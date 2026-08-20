#!/usr/bin/env python3
"""Import Fallen Forest source assets from the owner's canonical Drive archives."""
from __future__ import annotations

import argparse
import io
import shutil
import subprocess
import tempfile
import zipfile
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
ASSETS = ROOT / "assets"

PRIMARY_PACKS = {
    "grass.zip": "environment/grass",
    "first-person-arms.zip": "player/arms",
    "flashlight.zip": "player/flashlight",
    "document-file-folder-1.zip": "props/documents",
    "pickup-truck.zip": "vehicles/pickup",
    "toe-locust-by-doumty.zip": "characters/locust",
    "the-boiled-one-horror-game-boiled-one.zip": "characters/boiled_one",
    "Видео для скримера вареного.zip": "video/boiled_one",
}
APPROVED_SCREAMERS = {"jakes-screamer.mp3", "the-screamer-shared-between-mallie-and-jenny.mp3"}
LOW_POLY_SOURCE_FILES = {"Tree_Pack.fbx", "Tree_Pack.obj", "Tree_Pack.mtl"}
LOW_POLY_TREE_TEXTURE_FOLDERS = {"TREES_HIGH_POLY", "TREES_LOW_POLY"}
LOW_POLY_FBX_IMPORT_DEPENDENCIES = {
    "ROCKS_AO.png", "ROCKS_DIFFUSE.png", "ROCKS_NORMALtest.png", "ROCKS_ROUGHNESS.png"
}


def safe_extract_zip(zf: zipfile.ZipFile, destination: Path) -> None:
    destination.mkdir(parents=True, exist_ok=True)
    dest_resolved = destination.resolve()
    for info in zf.infolist():
        if info.is_dir():
            continue
        target = (destination / info.filename).resolve()
        if dest_resolved not in target.parents and target != dest_resolved:
            raise RuntimeError(f"Unsafe ZIP path: {info.filename}")
        target.parent.mkdir(parents=True, exist_ok=True)
        with zf.open(info) as src, target.open("wb") as dst:
            shutil.copyfileobj(src, dst)


def reset_dir(path: Path) -> None:
    if path.exists():
        shutil.rmtree(path)
    path.mkdir(parents=True, exist_ok=True)


def extract_nested(outer: zipfile.ZipFile, nested_name: str, destination: Path) -> None:
    with zipfile.ZipFile(io.BytesIO(outer.read(nested_name))) as nested:
        safe_extract_zip(nested, destination)


def import_primary(path: Path) -> None:
    with zipfile.ZipFile(path) as outer:
        for archive_name, relative_destination in PRIMARY_PACKS.items():
            extract_nested(outer, archive_name, ASSETS / relative_destination)
        destination = ASSETS / "audio" / "screamers"
        destination.mkdir(parents=True, exist_ok=True)
        with zipfile.ZipFile(io.BytesIO(outer.read("скримеры.zip"))) as nested:
            for info in nested.infolist():
                if info.is_dir():
                    continue
                name = Path(info.filename).name
                if name in APPROVED_SCREAMERS:
                    (destination / name).write_bytes(nested.read(info))


def import_black_spruce(outer: zipfile.ZipFile) -> None:
    destination = ASSETS / "environment" / "trees" / "black_spruce"
    reset_dir(destination)
    with zipfile.ZipFile(io.BytesIO(outer.read("realistic-hd-black-spruce-1038.zip"))) as pack:
        with zipfile.ZipFile(io.BytesIO(pack.read("source/Picea mariana HD_Arctic mat 100.zip"))) as source_zip:
            safe_extract_zip(source_zip, destination)


def _remap_obj_face_token(token: str, offsets: tuple[int, int, int]) -> str:
    pieces = token.split("/")
    result: list[str] = []
    for index, piece in enumerate(pieces):
        if not piece:
            result.append("")
            continue
        value = int(piece)
        if value > 0:
            value -= offsets[min(index, 2)]
        result.append(str(value))
    return "/".join(result)


def split_sequential_obj_objects(source_obj: Path, destination: Path) -> list[str]:
    """Split dead firs and collapse duplicate material sections to Godot-safe surfaces."""
    reset_dir(destination)
    global_counts = [0, 0, 0]
    offsets = (0, 0, 0)
    names: list[str] = []
    current_name: str | None = None
    geometry_lines: list[str] = []
    faces_by_material: dict[str, list[str]] = {}
    current_material = ""

    def flush_object() -> None:
        if current_name is None:
            return
        with (destination / f"{current_name}.obj").open("w", encoding="utf-8") as output:
            output.write("mtllib ../firs.mtl\n")
            output.write(f"o {current_name}\n")
            output.write("\n".join(geometry_lines) + "\n")
            for material, faces in faces_by_material.items():
                if material:
                    output.write(f"usemtl {material}\n")
                output.write("\n".join(faces) + "\n")

    with source_obj.open("r", encoding="utf-8", errors="ignore") as src:
        for raw_line in src:
            line = raw_line.rstrip("\n")
            if line.startswith("o "):
                flush_object()
                object_name = line[2:].strip()
                current_name = "".join(c if c.isalnum() or c in "_-" else "_" for c in object_name)
                names.append(current_name)
                geometry_lines = []
                faces_by_material = {}
                current_material = ""
                offsets = tuple(global_counts)
                continue
            if line.startswith("v "):
                global_counts[0] += 1
                if current_name is not None: geometry_lines.append(line)
                continue
            if line.startswith("vt "):
                global_counts[1] += 1
                if current_name is not None: geometry_lines.append(line)
                continue
            if line.startswith("vn "):
                global_counts[2] += 1
                if current_name is not None: geometry_lines.append(line)
                continue
            if current_name is None:
                continue
            if line.startswith("usemtl "):
                current_material = line[7:].strip()
                faces_by_material.setdefault(current_material, [])
            elif line.startswith("f "):
                tokens = line.split()
                remapped = [_remap_obj_face_token(token, offsets) for token in tokens[1:]]
                faces_by_material.setdefault(current_material, []).append("f " + " ".join(remapped))
    flush_object()

    if names != ["fir_1", "fir_3", "fir_2", "fir_4"]:
        raise RuntimeError(f"Unexpected dead-fir object layout: {names}")
    for name in names:
        sections = sum(1 for line in (destination / f"{name}.obj").open("r", encoding="utf-8") if line.startswith("usemtl "))
        if sections > 16:
            raise RuntimeError(f"Dead-fir variant {name} still has too many material sections: {sections}")
    return names


def import_dead_firs(outer: zipfile.ZipFile) -> None:
    destination = ASSETS / "environment" / "trees" / "dead_firs"
    reset_dir(destination)
    with zipfile.ZipFile(io.BytesIO(outer.read("4-dead-firs-trees-pack-high-poly (1).zip"))) as pack:
        with zipfile.ZipFile(io.BytesIO(pack.read("source/firs.zip"))) as source_zip:
            safe_extract_zip(source_zip, destination)
    split_sequential_obj_objects(destination / "firs.obj", destination / "variants")


def import_low_poly_tree_pack(outer: zipfile.ZipFile) -> None:
    destination = ASSETS / "environment" / "trees" / "low_poly_pack"
    reset_dir(destination)
    with zipfile.ZipFile(io.BytesIO(outer.read("low-poly-forest-tree-pack.zip"))) as pack:
        rar_bytes = pack.read("source/LOW POLY FOREST TREE PACK.rar")
    with tempfile.TemporaryDirectory(prefix="fallenforest-lowpoly-") as temp_dir:
        temp = Path(temp_dir)
        rar_path = temp / "low_poly_tree_pack.rar"
        extract_root = temp / "extracted"
        rar_path.write_bytes(rar_bytes)
        extract_root.mkdir(parents=True, exist_ok=True)
        subprocess.run(["7z", "x", "-y", f"-o{extract_root}", str(rar_path)], check=True)
        source_root = extract_root / "FOREST_TREE_PACK" / "SOURCE"
        texture_root = extract_root / "FOREST_TREE_PACK" / "TEXTURES"
        source_destination = destination / "source"
        texture_destination = destination / "textures"
        source_destination.mkdir(parents=True, exist_ok=True)
        texture_destination.mkdir(parents=True, exist_ok=True)
        for filename in sorted(LOW_POLY_SOURCE_FILES):
            shutil.copy2(source_root / filename, source_destination / filename)
        for filename in sorted(LOW_POLY_FBX_IMPORT_DEPENDENCIES):
            source = texture_root / filename
            if not source.exists():
                raise RuntimeError(f"Expected FBX dependency missing: {filename}")
            shutil.copy2(source, source_destination / filename)
        for folder_name in sorted(LOW_POLY_TREE_TEXTURE_FOLDERS):
            shutil.copytree(texture_root / folder_name, texture_destination / folder_name)


def import_trees(path: Path) -> None:
    with zipfile.ZipFile(path) as outer:
        import_black_spruce(outer)
        import_dead_firs(outer)
        import_low_poly_tree_pack(outer)


def write_manifest() -> None:
    model_exts = {".fbx", ".glb", ".gltf", ".obj"}
    models = sorted(p.relative_to(ROOT).as_posix() for p in ASSETS.rglob("*") if p.is_file() and p.suffix.lower() in model_exts)
    text = [
        "# Imported asset inventory", "",
        "Generated by `tools/import_drive_assets.py` from the project owner's canonical Google Drive archives.", "",
        "## 3D model files", "",
    ]
    text.extend(f"- `{model}`" for model in models)
    text.extend([
        "", "## Tree-pack rule", "",
        "The tree archives are packs, not single-tree assets. Runtime forest scattering uses individual mesh variants, not the whole pack as one prop.", "",
        "Dead-fir variants collapse repeated material sections to one section per material to remain below Godot's mesh-surface limit.", "",
        "Low-poly rocks/ground are excluded from runtime. Original ROCKS_* images are retained beside Tree_Pack.fbx only because the canonical FBX references them during import.", "",
        "## Canonical audio rule", "",
        "Only the two approved Locust screamers are imported. `amazing-grace-analog-horror.mp3` is intentionally excluded.", "",
        "## Provenance", "",
        "Drive is the source of truth for these user-provided project files. Do not silently replace them with unrelated Internet assets.", "",
    ])
    (ROOT / "docs" / "ASSET_INVENTORY.md").write_text("\n".join(text), encoding="utf-8")


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--all", required=True, type=Path)
    parser.add_argument("--trees", required=True, type=Path)
    args = parser.parse_args()
    import_primary(args.all)
    import_trees(args.trees)
    write_manifest()


if __name__ == "__main__":
    main()
