# Fast Godot script validation

- Engine: Godot 4.7.1 stable
- Tested commit: `8e12a087dfca3cde03b8f8a4fd2023b6ee9441cc`
- Exit code: `1`
- Result: **FAIL**

```text
Godot Engine v4.7.1.stable.official.a13da4feb - https://godotengine.org

SCRIPT ERROR: Parse Error: Function "_ready" has the same name as a previously declared variable.
          at: GDScript::reload (res://scripts/horror/locust_animator.gd:23)
          GDScript backtrace (most recent call first):
              [0] _scan_dir (res://tools/fast_validate_scripts.gd:32)
              [1] _scan_dir (res://tools/fast_validate_scripts.gd:30)
              [2] _initialize (res://tools/fast_validate_scripts.gd:6)
ERROR: Failed to load script "res://scripts/horror/locust_animator.gd" with error "Parse error".
   at: load (modules/gdscript/gdscript_resource_format.cpp:46)
   GDScript backtrace (most recent call first):
       [0] _scan_dir (res://tools/fast_validate_scripts.gd:32)
       [1] _scan_dir (res://tools/fast_validate_scripts.gd:30)
       [2] _initialize (res://tools/fast_validate_scripts.gd:6)
FAST_GDSCRIPT_VALIDATION: PASS
```
