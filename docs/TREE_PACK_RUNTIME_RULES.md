# Fallen Forest — Tree Pack Runtime Rules

This file records the canonical interpretation of the owner's tree archives for the Godot migration.

## Core rule

A tree archive is a **pack of tree variants**, not one runtime tree prop.

The forest generator must extract/select individual tree variants and scatter them independently. It must never instantiate an entire multi-tree pack at every forest point.

## Black Spruce pack

Source: `assets/environment/trees/black_spruce/`

- Contains one black-spruce tree with authored LOD0–LOD4 resources.
- Runtime forest currently uses LOD2 as the baseline mobile mesh.
- The same source tree can be varied by scale and yaw, but it is only one logical tree variant.

## Dead Firs pack

Source: `assets/environment/trees/dead_firs/firs.obj`

The canonical OBJ contains four sequential tree objects. The repository expansion pipeline splits these losslessly into:

- `variants/fir_1.obj`
- `variants/fir_2.obj`
- `variants/fir_3.obj`
- `variants/fir_4.obj`

The original `firs.obj` remains canonical source material, but runtime scattering uses the four split variants individually.

## Low Poly Forest Tree Pack

Source: `assets/environment/trees/low_poly_pack/source/Tree_Pack.fbx`

The pack is not a single tree. It contains multiple tree representations and unrelated payload.

### Allowed runtime tree content

- `Background_Tree_Atlas*` — complete lightweight/background tree variants.
- `Tree_Trunk_*` — detailed tree trunk components.
- `Tree_Branches_*` — detailed tree branch/crown components.

`Tree_Trunk_*` and `Tree_Branches_*` must be paired by their original source-space position and scattered together as one logical tree. A trunk or branch component must never be scattered by itself.

### Explicitly excluded from Fallen Forest runtime use

The following low-poly-pack content is not part of the Fallen Forest vegetation set:

- grass
- bushes / shrubs
- ferns / weeds / other small plants
- rocks
- ground meshes/textures

The runtime code uses both a blacklist and a conservative tree whitelist so unknown low-poly objects are excluded rather than accidentally spawned.

## Current target mix

Baseline tuning for 3250 tree placements:

- Black spruce pack: 68%
- Dead fir pack: 14%
- Low-poly tree pack: 18%

If a pack is unavailable at import time, weights are automatically renormalized rather than replacing missing trees with unrelated assets.

All variants are normalized by their measured imported height before random scale variation is applied. This prevents 5 m and 10 m source trees from becoming unintentionally tiny or gigantic when mixed.

## Placement constraints

All tree variants share the same world-placement rules:

- deterministic from run seed;
- terrain-following;
- clustered rather than uniform;
- clear starting area;
- no trees on generated trails;
- tree positions remain available to document placement, Locust cover selection, pooled trunk collision, and foliage LOS blocking.
