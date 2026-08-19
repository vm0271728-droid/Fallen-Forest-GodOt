# Fast Godot script validation

- Engine: Godot 4.7.1 stable
- Tested commit: `dcedfb4c75293beabd7688bec2597ea9f62d1a5a`
- Exit code: `1`
- Result: **FAIL**

```text
Godot Engine v4.7.1.stable.official.a13da4feb - https://godotengine.org

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
FAST_GDSCRIPT_VALIDATION: PASS
```
