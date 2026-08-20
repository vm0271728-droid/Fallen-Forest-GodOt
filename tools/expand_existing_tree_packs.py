#!/usr/bin/env python3
"""Normalize tree packs already committed in the Godot repository."""
from __future__ import annotations

import shutil
import subprocess
import tempfile
from pathlib import Path

from import_drive_assets import split_sequential_obj_objects

ROOT = Path(__file__).resolve().parents[1]
DEAD_FIRS = ROOT / "assets/environment/trees/dead_firs"
LOW_POLY = ROOT / "assets/environment/trees/low_poly_pack"
FBX_DEPENDENCIES = ("ROCKS_AO.png", "ROCKS_DIFFUSE.png", "ROCKS_NORMALtest.png", "ROCKS_ROUGHNESS.png")


def expand_dead_firs() -> None:
    source = DEAD_FIRS / "firs.obj"
    if not source.exists():
        raise RuntimeError(f"Missing canonical dead-fir source: {source}")
    names = split_sequential_obj_objects(source, DEAD_FIRS / "variants")
    print("Dead fir variants:", ", ".join(names))


def _restore_blob_from_history(relative_path: str, destination: Path) -> None:
    revisions = subprocess.run(
        ["git", "rev-list", "--all", "--", relative_path],
        cwd=ROOT, check=True, capture_output=True, text=True,
    ).stdout.splitlines()
    for revision in revisions:
        result = subprocess.run(
            ["git", "show", f"{revision}:{relative_path}"],
            cwd=ROOT, capture_output=True,
        )
        if result.returncode == 0 and result.stdout:
            destination.write_bytes(result.stdout)
            print(f"Restored {destination.name} from {revision[:12]}")
            return
    raise RuntimeError(f"Unable to restore historical asset: {relative_path}")


def restore_low_poly_fbx_dependencies() -> None:
    source_dir = LOW_POLY / "source"
    source_dir.mkdir(parents=True, exist_ok=True)
    for filename in FBX_DEPENDENCIES:
        destination = source_dir / filename
        if destination.exists():
            continue
        historical_path = f"assets/environment/trees/low_poly_pack/textures/{filename}"
        _restore_blob_from_history(historical_path, destination)


def expand_low_poly() -> None:
    source_dir = LOW_POLY / "source"
    rar_path = source_dir / "LOW POLY FOREST TREE PACK.rar"
    if rar_path.exists():
        with tempfile.TemporaryDirectory(prefix="fallenforest-lowpoly-existing-") as temp_dir:
            extract_root = Path(temp_dir) / "extracted"
            extract_root.mkdir(parents=True, exist_ok=True)
            subprocess.run(["7z", "x", "-y", f"-o{extract_root}", str(rar_path)], check=True)
            pack_source = extract_root / "FOREST_TREE_PACK" / "SOURCE"
            for filename in ("Tree_Pack.fbx", "Tree_Pack.obj", "Tree_Pack.mtl"):
                source = pack_source / filename
                if not source.exists():
                    raise RuntimeError(f"Expected tree-pack source file missing: {filename}")
                shutil.copy2(source, source_dir / filename)
        rar_path.unlink()
    elif not (source_dir / "Tree_Pack.fbx").exists():
        raise RuntimeError(f"Missing low-poly tree pack source: {source_dir}")

    # The canonical FBX still references the original rock textures even though
    # all rock meshes are excluded by runtime filtering. Keep those PNGs beside
    # the FBX solely so Godot can import the file without broken dependencies.
    restore_low_poly_fbx_dependencies()

    # Rock/ground payload remains excluded from the runtime texture folder.
    texture_dir = LOW_POLY / "textures"
    for path in texture_dir.iterdir() if texture_dir.exists() else []:
        lower = path.name.lower()
        if lower.startswith("rocks_") or lower.startswith("internal_ground"):
            path.unlink()

    print("Low-poly source normalized; FBX import dependencies restored, rock meshes remain runtime-excluded.")


def main() -> None:
    expand_dead_firs()
    expand_low_poly()


if __name__ == "__main__":
    main()
