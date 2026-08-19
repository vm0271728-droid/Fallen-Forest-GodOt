#!/usr/bin/env python3
"""Expand tree packs that are already committed in the Godot repository.

This avoids re-downloading the large canonical Drive archives when only the
multi-tree source containers need to be normalized for runtime use.
"""
from __future__ import annotations

import shutil
import subprocess
import tempfile
from pathlib import Path

from import_drive_assets import split_sequential_obj_objects

ROOT = Path(__file__).resolve().parents[1]
DEAD_FIRS = ROOT / "assets/environment/trees/dead_firs"
LOW_POLY = ROOT / "assets/environment/trees/low_poly_pack"


def expand_dead_firs() -> None:
    source = DEAD_FIRS / "firs.obj"
    if not source.exists():
        raise RuntimeError(f"Missing canonical dead-fir source: {source}")
    names = split_sequential_obj_objects(source, DEAD_FIRS / "variants")
    print("Dead fir variants:", ", ".join(names))


def expand_low_poly() -> None:
    source_dir = LOW_POLY / "source"
    rar_path = source_dir / "LOW POLY FOREST TREE PACK.rar"
    if not rar_path.exists():
        # Idempotent reruns after successful expansion.
        if (source_dir / "Tree_Pack.fbx").exists():
            print("Low-poly pack already expanded.")
            return
        raise RuntimeError(f"Missing low-poly RAR source: {rar_path}")

    with tempfile.TemporaryDirectory(prefix="fallenforest-lowpoly-existing-") as temp_dir:
        extract_root = Path(temp_dir) / "extracted"
        extract_root.mkdir(parents=True, exist_ok=True)
        subprocess.run(["7z", "x", "-y", f"-o{extract_root}", str(rar_path)], check=True)

        pack_root = extract_root / "FOREST_TREE_PACK"
        pack_source = pack_root / "SOURCE"
        for filename in ("Tree_Pack.fbx", "Tree_Pack.obj", "Tree_Pack.mtl"):
            source = pack_source / filename
            if not source.exists():
                raise RuntimeError(f"Expected tree-pack source file missing: {filename}")
            shutil.copy2(source, source_dir / filename)

    # Keep only the unpacked source in Git; Drive remains the canonical archive.
    rar_path.unlink()

    # Remove payload that is explicitly outside Fallen Forest's low-poly tree use.
    texture_dir = LOW_POLY / "textures"
    for path in texture_dir.iterdir() if texture_dir.exists() else []:
        lower = path.name.lower()
        if lower.startswith("rocks_") or lower.startswith("internal_ground"):
            path.unlink()

    print("Low-poly Tree_Pack.fbx/obj/mtl expanded; RAR and rock/ground payload removed.")


def main() -> None:
    expand_dead_firs()
    expand_low_poly()


if __name__ == "__main__":
    main()
