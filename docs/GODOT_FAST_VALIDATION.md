# Fast Godot script validation

- Engine: Godot 4.7.1 stable
- Tested commit: `75e4f364e7549c04d99684d7dcca5552a09c70ab`
- Exit code: `0`
- Result: **PASS**

```text
Godot Engine v4.7.1.stable.official.a13da4feb - https://godotengine.org

SCRIPT ERROR: Parse Error: Preload file "res://assets/audio/screamers/jakes-screamer.mp3" has no resource loaders (unrecognized file extension).
          at: GDScript::reload (res://scripts/horror/locust_death_controller.gd:3)
          GDScript backtrace (most recent call first):
              [0] _scan_dir (res://tools/fast_validate_scripts.gd:32)
              [1] _scan_dir (res://tools/fast_validate_scripts.gd:30)
              [2] _initialize (res://tools/fast_validate_scripts.gd:6)
SCRIPT ERROR: Parse Error: Cannot infer the type of "FRONT_SCREAMER" constant because the value doesn't have a set type.
          at: GDScript::reload (res://scripts/horror/locust_death_controller.gd:3)
          GDScript backtrace (most recent call first):
              [0] _scan_dir (res://tools/fast_validate_scripts.gd:32)
              [1] _scan_dir (res://tools/fast_validate_scripts.gd:30)
              [2] _initialize (res://tools/fast_validate_scripts.gd:6)
SCRIPT ERROR: Parse Error: Preload file "res://assets/audio/screamers/the-screamer-shared-between-mallie-and-jenny.mp3" has no resource loaders (unrecognized file extension).
          at: GDScript::reload (res://scripts/horror/locust_death_controller.gd:4)
          GDScript backtrace (most recent call first):
              [0] _scan_dir (res://tools/fast_validate_scripts.gd:32)
              [1] _scan_dir (res://tools/fast_validate_scripts.gd:30)
              [2] _initialize (res://tools/fast_validate_scripts.gd:6)
SCRIPT ERROR: Parse Error: Cannot infer the type of "REAR_SCREAMER" constant because the value doesn't have a set type.
          at: GDScript::reload (res://scripts/horror/locust_death_controller.gd:4)
          GDScript backtrace (most recent call first):
              [0] _scan_dir (res://tools/fast_validate_scripts.gd:32)
              [1] _scan_dir (res://tools/fast_validate_scripts.gd:30)
              [2] _initialize (res://tools/fast_validate_scripts.gd:6)
SCRIPT ERROR: Compile Error: Failed to compile depended scripts.
          at: GDScript::reload (res://scripts/horror/event_director.gd:0)
          GDScript backtrace (most recent call first):
              [0] _scan_dir (res://tools/fast_validate_scripts.gd:32)
              [1] _scan_dir (res://tools/fast_validate_scripts.gd:30)
              [2] _initialize (res://tools/fast_validate_scripts.gd:6)
ERROR: Failed to load script "res://scripts/horror/event_director.gd" with error "Compilation failed".
   at: load (modules/gdscript/gdscript_resource_format.cpp:46)
   GDScript backtrace (most recent call first):
       [0] _scan_dir (res://tools/fast_validate_scripts.gd:32)
       [1] _scan_dir (res://tools/fast_validate_scripts.gd:30)
       [2] _initialize (res://tools/fast_validate_scripts.gd:6)
SCRIPT ERROR: Parse Error: Preload file "res://assets/audio/screamers/jakes-screamer.mp3" has no resource loaders (unrecognized file extension).
          at: GDScript::reload (res://scripts/horror/locust_death_controller.gd:3)
          GDScript backtrace (most recent call first):
              [0] _scan_dir (res://tools/fast_validate_scripts.gd:32)
              [1] _scan_dir (res://tools/fast_validate_scripts.gd:30)
              [2] _initialize (res://tools/fast_validate_scripts.gd:6)
SCRIPT ERROR: Parse Error: Cannot infer the type of "FRONT_SCREAMER" constant because the value doesn't have a set type.
          at: GDScript::reload (res://scripts/horror/locust_death_controller.gd:3)
          GDScript backtrace (most recent call first):
              [0] _scan_dir (res://tools/fast_validate_scripts.gd:32)
              [1] _scan_dir (res://tools/fast_validate_scripts.gd:30)
              [2] _initialize (res://tools/fast_validate_scripts.gd:6)
SCRIPT ERROR: Parse Error: Preload file "res://assets/audio/screamers/the-screamer-shared-between-mallie-and-jenny.mp3" has no resource loaders (unrecognized file extension).
          at: GDScript::reload (res://scripts/horror/locust_death_controller.gd:4)
          GDScript backtrace (most recent call first):
              [0] _scan_dir (res://tools/fast_validate_scripts.gd:32)
              [1] _scan_dir (res://tools/fast_validate_scripts.gd:30)
              [2] _initialize (res://tools/fast_validate_scripts.gd:6)
SCRIPT ERROR: Parse Error: Cannot infer the type of "REAR_SCREAMER" constant because the value doesn't have a set type.
          at: GDScript::reload (res://scripts/horror/locust_death_controller.gd:4)
          GDScript backtrace (most recent call first):
              [0] _scan_dir (res://tools/fast_validate_scripts.gd:32)
              [1] _scan_dir (res://tools/fast_validate_scripts.gd:30)
              [2] _initialize (res://tools/fast_validate_scripts.gd:6)
ERROR: Failed to load script "res://scripts/horror/locust_death_controller.gd" with error "Parse error".
   at: load (modules/gdscript/gdscript_resource_format.cpp:46)
   GDScript backtrace (most recent call first):
       [0] _scan_dir (res://tools/fast_validate_scripts.gd:32)
       [1] _scan_dir (res://tools/fast_validate_scripts.gd:30)
       [2] _initialize (res://tools/fast_validate_scripts.gd:6)
SCRIPT ERROR: Parse Error: Assigned value for constant "DOCUMENT_DURATIONS" isn't a constant expression.
          at: GDScript::reload (res://scripts/player/viewmodel_controller.gd:3)
          GDScript backtrace (most recent call first):
              [0] _scan_dir (res://tools/fast_validate_scripts.gd:32)
              [1] _scan_dir (res://tools/fast_validate_scripts.gd:30)
              [2] _initialize (res://tools/fast_validate_scripts.gd:6)
SCRIPT ERROR: Parse Error: Assigned value for constant "DOCUMENT_SIDE_OFFSETS" isn't a constant expression.
          at: GDScript::reload (res://scripts/player/viewmodel_controller.gd:4)
          GDScript backtrace (most recent call first):
              [0] _scan_dir (res://tools/fast_validate_scripts.gd:32)
              [1] _scan_dir (res://tools/fast_validate_scripts.gd:30)
              [2] _initialize (res://tools/fast_validate_scripts.gd:6)
SCRIPT ERROR: Parse Error: Assigned value for constant "DOCUMENT_ROLL_DEGREES" isn't a constant expression.
          at: GDScript::reload (res://scripts/player/viewmodel_controller.gd:5)
          GDScript backtrace (most recent call first):
              [0] _scan_dir (res://tools/fast_validate_scripts.gd:32)
              [1] _scan_dir (res://tools/fast_validate_scripts.gd:30)
              [2] _initialize (res://tools/fast_validate_scripts.gd:6)
SCRIPT ERROR: Parse Error: Assigned value for constant "DOCUMENT_PITCH_DEGREES" isn't a constant expression.
          at: GDScript::reload (res://scripts/player/viewmodel_controller.gd:6)
          GDScript backtrace (most recent call first):
              [0] _scan_dir (res://tools/fast_validate_scripts.gd:32)
              [1] _scan_dir (res://tools/fast_validate_scripts.gd:30)
              [2] _initialize (res://tools/fast_validate_scripts.gd:6)
ERROR: Failed to load script "res://scripts/player/viewmodel_controller.gd" with error "Parse error".
   at: load (modules/gdscript/gdscript_resource_format.cpp:46)
   GDScript backtrace (most recent call first):
       [0] _scan_dir (res://tools/fast_validate_scripts.gd:32)
       [1] _scan_dir (res://tools/fast_validate_scripts.gd:30)
       [2] _initialize (res://tools/fast_validate_scripts.gd:6)
SCRIPT ERROR: Parse Error: Preload file "res://assets/player/flashlight/source/flashlightfbx.fbx" has no resource loaders (unrecognized file extension).
          at: GDScript::reload (res://scripts/player/flashlight_rig.gd:3)
          GDScript backtrace (most recent call first):
              [0] _scan_dir (res://tools/fast_validate_scripts.gd:32)
              [1] _scan_dir (res://tools/fast_validate_scripts.gd:30)
              [2] _initialize (res://tools/fast_validate_scripts.gd:6)
SCRIPT ERROR: Parse Error: Cannot infer the type of "FLASHLIGHT_MODEL" constant because the value doesn't have a set type.
          at: GDScript::reload (res://scripts/player/flashlight_rig.gd:3)
          GDScript backtrace (most recent call first):
              [0] _scan_dir (res://tools/fast_validate_scripts.gd:32)
              [1] _scan_dir (res://tools/fast_validate_scripts.gd:30)
              [2] _initialize (res://tools/fast_validate_scripts.gd:6)
ERROR: Failed to load script "res://scripts/player/flashlight_rig.gd" with error "Parse error".
   at: load (modules/gdscript/gdscript_resource_format.cpp:46)
   GDScript backtrace (most recent call first):
       [0] _scan_dir (res://tools/fast_validate_scripts.gd:32)
       [1] _scan_dir (res://tools/fast_validate_scripts.gd:30)
       [2] _initialize (res://tools/fast_validate_scripts.gd:6)
SCRIPT ERROR: Parse Error: Preload file "res://assets/environment/grass/source/Grass.fbx" has no resource loaders (unrecognized file extension).
          at: GDScript::reload (res://scripts/world/grass_scatterer.gd:3)
          GDScript backtrace (most recent call first):
              [0] _scan_dir (res://tools/fast_validate_scripts.gd:32)
              [1] _scan_dir (res://tools/fast_validate_scripts.gd:30)
              [2] _initialize (res://tools/fast_validate_scripts.gd:6)
SCRIPT ERROR: Parse Error: Cannot infer the type of "DEFAULT_GRASS_SCENE" constant because the value doesn't have a set type.
          at: GDScript::reload (res://scripts/world/grass_scatterer.gd:3)
          GDScript backtrace (most recent call first):
              [0] _scan_dir (res://tools/fast_validate_scripts.gd:32)
              [1] _scan_dir (res://tools/fast_validate_scripts.gd:30)
              [2] _initialize (res://tools/fast_validate_scripts.gd:6)
ERROR: Failed to load script "res://scripts/world/grass_scatterer.gd" with error "Parse error".
   at: load (modules/gdscript/gdscript_resource_format.cpp:46)
   GDScript backtrace (most recent call first):
       [0] _scan_dir (res://tools/fast_validate_scripts.gd:32)
       [1] _scan_dir (res://tools/fast_validate_scripts.gd:30)
       [2] _initialize (res://tools/fast_validate_scripts.gd:6)
FAST_GDSCRIPT_VALIDATION: PASS
```
