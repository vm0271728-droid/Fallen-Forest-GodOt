#!/usr/bin/env python3
"""Import Fallen Forest source assets from the owner's canonical Drive archives.

The workflow downloads the two outer ZIP files. This script performs deterministic
nested extraction, keeps the owner's files as the source of truth, excludes the
forbidden Amazing Grace clip, and prepares tree packs as actual multi-tree sources.
"""
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

APPROVED_SCREAMERS = {
    "jakes-screamer.mp3",
    "the-screamer-shared-between-mallie-and-jenny.mp3",
}

LOW_POLY_SOURCE_FILES = {
    "Tree_Pack.fbx",
    "Tree_Pack.obj",
    "Tree_Pack.mtl",
}

LOW_POLY_TREE_TEXTURE_FOLDERS = {
    "TREES_HIGH_POLY",
    "TREES_LOW_POLY",
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
    data = outer.read(nested_name)
    with zipfile.ZipFile(io.BytesIO(data)) as nested:
        safe_extract_zip(nested, destination)


def import_primary(path: Path) -> None:
    with zipfile.ZipFile(path) as outer:
        for archive_name, relative_destination in PRIMARY_PACKS.items():
            print(f"Importing {archive_name} -> assets/{relative_destination}")
            extract_nested(outer, archive_name, ASSETS / relative_destination)

        screamers = outer.read("скримеры.zip")
        destination = ASSETS / "audio" / "screamers"
        destination.mkdir(parents=True, exist_ok=True)
        with zipfile.ZipFile(io.BytesIO(screamers)) as nested:
            for info in nested.infolist():
                if info.is_dir():
                    continue
                name = Path(info.filename).name
                if name not in APPROVED_SCREAMERS:
                    print(f"Skipping non-canonical screamer: {name}")
                    continue
                (destination / name).write_bytes(nested.read(info))


def import_black_spruce(outer: zipfile.ZipFile) -> None:
    destination = ASSETS / "environment" / "trees" / "black_spruce"
    reset_dir(destination)
    pack_data = outer.read("realistic-hd-black-spruce-1038.zip")
    with zipfile.ZipFile(io.BytesIO(pack_data)) as pack:
        source_data = pack.read("source/Picea mariana HD_Arctic mat 100.zip")
        with zipfile.ZipFile(io.BytesIO(source_data)) as source_zip:
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
    """Split the dead-fir OBJ pack into independent, Godot-safe resources.

    The canonical `firs.obj` stores fir_1..fir_4 sequentially. Face indices are
    global, so each object is remapped to local indices. The source also switches
    repeatedly between the same small set of materials. Godot's OBJ importer
    treats every material section as a mesh surface; preserving those repeated
    switches can exceed MAX_MESH_SURFACES even though there are only three real
    materials. Faces are therefore regrouped by material inside each tree. This
    changes neither vertex/UV/normal data nor face membership; it only collapses
    duplicate material sections into one surface per material.
    """
    reset_dir(destination)
    global_counts = [0, 0, 0]  # v, vt, vn
    offsets = (0, 0, 0)
    names: list[str] = []

    current_name: str | None = None
    geometry_lines: list[str] = []
    faces_by_material: dict[str, list[str]] = {}
    current_material = ""

    def flush_object() -> None:
        if current_name is None:
            return
        output_path = destination / f"{current_name}.obj"
        with output_path.open("w", encoding="utf-8") as output:
            output.write("mtllib ../firs.mtl\n")
            output.write(f"o {current_name}\n")
            for geometry_line in geometry_lines:
                output.write(geometry_line + "\n")
            for material, faces in faces_by_material.items():
                if material:
                    output.write(f"usemtl {material}\n")
                for face in faces:
                    output.write(face + "\n")

    with source_obj.open("r", encoding="utf-8", errors="ignore") as src:
        for raw_line in src:
            line = raw_line.rstrip("\n")
            if line.startswith("o "):
                flush_object()
                object_name = line[2:].strip()
                safe_name = "".join(c if c.isalnum() or c in "_-" else "_" for c in object_name)
                names.append(safe_name)
                current_name = safe_name
                geometry_lines = []
                faces_by_material = {}
                current_material = ""
                offsets = tuple(global_counts)
                continue

            if line.startswith("v "):
                global_counts[0] += 1
                if current_name is not None:
                    geometry_lines.append(line)
                continue
            if line.startswith("vt "):
                global_counts[1] += 1
                if current_name is not None:
                    geometry_lines.append(line)
                continue
            if line.startswith("vn "):
                global_counts[2] += 1
                if current_name is not None:
                    geometry_lines.append(line)
                continue

            if current_name is None:
                continue

            if line.startswith("usemtl "):
                current_material = line[7:].strip()
                faces_by_material.setdefault(current_material, [])
                continue

            if line.startswith("f "):
                tokens = line.split()
                remapped = [_remap_obj_face_token(token, offsets) for token in tokens[1:]]
                faces_by_material.setdefault(current_material, []).append(
                    "f " + " ".join(remapped)
                )

    flush_object()

    if names != ["fir_1", "fir_3", "fir_2", "fir_4"]:
        raise RuntimeError(f"Unexpected dead-fir object layout: {names}")

    for name in names:
        path = destination / f"{name}.obj"
        material_sections = sum(1 for line in path.open("r", encoding="utf-8") if line.startswith("usemtl "))
        if material_sections > 16:
            raise RuntimeError(
                f"Dead-fir variant {name} still has too many material sections: {material_sections}"
            )

    return names


def import_dead_firs(outer: zipfile.ZipFile) -> None:
    destination = ASSETS / "environment" / "trees" / "dead_firs"
    reset_dir(destination)
    pack_data = outer.read("4-dead-firs-trees-pack-high-poly (1).zip")
    with zipfile.ZipFile(io.BytesIO(pack_data)) as pack:
        source_data = pack.read("source/firs.zip")
        with zipfile.ZipFile(io.BytesIO(source_data)) as source_zip:
            safe_extract_zip(source_zip, destination)
    names = split_sequential_obj_objects(destination / "firs.obj", destination / "variants")
    print(f"Split dead-fir pack into {len(names)} variants: {', '.join(names)}")


def import_low_poly_tree_pack(outer: zipfile.ZipFile) -> None:
    destination = ASSETS / "environment" / "trees" / "low_poly_pack"
    reset_dir(destination)

    pack_data = outer.read("low-poly-forest-tree-pack.zip")
    with zipfile.ZipFile(io.BytesIO(pack_data)) as pack:
        rar_bytes = pack.read("source/LOW POLY FOREST TREE PACK.rar")

    with tempfile.TemporaryDirectory(prefix="fallenforest-lowpoly-") as temp_dir:
        temp = Path(temp_dir)
        rar_path = temp / "low_poly_tree_pack.rar"
        extract_root = temp / "extracted"
        rar_path.write_bytes(rar_bytes)
        extract_root.mkdir(parents=True, exist_ok=True)

        subprocess.run(
            ["7z", "x", "-y", f"-o{extract_root}", str(rar_path)],
            check=True,
        )

        source_root = extract_root / "FOREST_TREE_PACK" / "SOURCE"
        texture_root = extract_root / "FOREST_TREE_PACK" / "TEXTURES"
        source_destination = destination / "source"
        texture_destination = destination / "textures"
        source_destination.mkdir(parents=True, exist_ok=True)
        texture_destination.mkdir(parents=True, exist_ok=True)

        for filename in sorted(LOW_POLY_SOURCE_FILES):
            source = source_root / filename
            if not source.exists():
                raise RuntimeError(f"Expected low-poly source file missing: {filename}")
            shutil.copy2(source, source_destination / filename)

        for folder_name in sorted(LOW_POLY_TREE_TEXTURE_FOLDERS):
            source_folder = texture_root / folder_name
            if not source_folder.exists():
                raise RuntimeError(f"Expected low-poly tree texture folder missing: {folder_name}")
            shutil.copytree(source_folder, texture_destination / folder_name)


def import_trees(path: Path) -> None:
    with zipfile.ZipFile(path) as outer:
        import_black_spruce(outer)
        import_dead_firs(outer)
        import_low_poly_tree_pack(outer)


def write_manifest() -> None:
    model_exts = {".fbx", ".glb", ".gltf", ".obj"}
    models = sorted(
        p.relative_to(ROOT).as_posix()
        for p in ASSETS.rglob("*")
        if p.is_file() and p.suffix.lower() in model_exts
    )
    text = [
        "# Imported asset inventory",
        "",
        "Generated by `tools/import_drive_assets.py` from the project owner's canonical Google Drive archives.",
        "",
        "## 3D model files",
        "",
    ]
    text.extend(f"- `{model}`" for model in models)
    text.extend([
        "",
        "## Tree-pack rule",
        "",
        "The tree archives are packs, not single-tree assets. Runtime forest scattering uses individual mesh variants, not the whole pack as one prop.",
        "",
        "The dead-fir source is deterministically split into `fir_1`, `fir_2`, `fir_3`, and `fir_4` OBJ variants without modifying the canonical original OBJ. Repeated material sections are collapsed to one section per material so Godot cannot exceed its mesh-surface limit.",
        "",
        "`low_poly_pack` is tree-only for Fallen Forest: grass, bushes, rocks and ground assets from that pack are not gameplay assets and must not be instantiated. Only tree source files and tree material textures are retained by the importer.",
        "",
        "## Canonical audio rule",
        "",
        "Only the two approved Locust screamers are imported. `amazing-grace-analog-horror.mp3` is intentionally excluded.",
        "",
        "## Provenance",
        "",
        "Drive is the source of truth for these user-provided project files. Do not silently replace them with unrelated Internet assets.",
        "",
    ])
    (ROOT / "docs" / "ASSET_INVENTORY.md").write_text("\n".join(text), encoding="utf-8")


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--all", required=True, type=Path, help="Path to 'все нужное.zip'")
    parser.add_argument("--trees", required=True, type=Path, help="Path to 'Деревья.zip'")
    args = parser.parse_args()

    import_primary(args.all)
    import_trees(args.trees)
    write_manifest()
    print("Fallen Forest Drive asset import complete.")


if __name__ == "__main__":
    main()
