# Core floor/tree collision validation

- Engine: Godot 4.7.1 stable
- Branch: `fix/android11-integrity`
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
- Tested commit: `a21f6a992420979f712bb3abed36ce338c1e0562`
- Exit code: `1`
=======
- Tested commit: `e4cf07198f693b06fb248dd95592530c8a577407`
- Exit code: `999`
>>>>>>> 35b58dc (Record collision validation for e4cf07198f693b06fb248dd95592530c8a577407)
=======
- Tested commit: `003e7a42c404e01a51b5103980d3f23f20cca6c1`
- Exit code: `999`
>>>>>>> 66466c8 (Record collision validation for 003e7a42c404e01a51b5103980d3f23f20cca6c1)
=======
- Tested commit: `46d21ec209921961b9745b2e1d73c9e64902da07`
- Exit code: `0`
>>>>>>> 90ded9c (Record collision validation for 46d21ec209921961b9745b2e1d73c9e64902da07)
- Checks: HeightMapShape3D, uniform physics scale, CharacterBody3D test_move, terrain raycast, active tree CylinderShape3D, tree raycast.
- Result: **PASS**

```text
<<<<<<< HEAD
Godot Engine v4.7.1.stable.official.a13da4feb - https://godotengine.org

<<<<<<< HEAD
SCRIPT ERROR: Compile Error: Identifier not found: GameState
          at: GDScript::reload (res://scripts/world/terrain_generator.gd:29)
SCRIPT ERROR: Compile Error: Failed to compile depended scripts.
          at: GDScript::reload (res://tools/validate_collision_core.gd:0)
ERROR: Failed to load script "res://tools/validate_collision_core.gd" with error "Compilation failed".
   at: load (modules/gdscript/gdscript_resource_format.cpp:46)
SCRIPT ERROR: Invalid call. Nonexistent 'bool' constructor.
<<<<<<< HEAD
          at: _run (res://tools/validate_collision_core.gd:33)
          GDScript backtrace (most recent call first):
              [0] _run (res://tools/validate_collision_core.gd:33)
=======
          at: _run (res://tools/validate_collision_core.gd:34)
          GDScript backtrace (most recent call first):
              [0] _run (res://tools/validate_collision_core.gd:34)
>>>>>>> 35b58dc (Record collision validation for e4cf07198f693b06fb248dd95592530c8a577407)
=======
>>>>>>> 66466c8 (Record collision validation for 003e7a42c404e01a51b5103980d3f23f20cca6c1)
=======
Fallen Forest terrain: 129x129 heightfield generated across 720m.
COLLISION_CORE_VALIDATION: PASS
>>>>>>> 90ded9c (Record collision validation for 46d21ec209921961b9745b2e1d73c9e64902da07)
```
