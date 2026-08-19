# Fast Godot script validation

- Engine: Godot 4.7.1 stable
- Tested commit: `62a0dec1ca3a9e37e893b5558891b0346181cb8d`
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
SCRIPT ERROR: Parse Error: Identifier "SceneFlow" not declared in the current scope.
          at: GDScript::reload (res://scripts/ui/main_menu.gd:11)
          GDScript backtrace (most recent call first):
              [0] _scan_dir (res://tools/fast_validate_scripts.gd:32)
              [1] _scan_dir (res://tools/fast_validate_scripts.gd:30)
              [2] _initialize (res://tools/fast_validate_scripts.gd:6)
SCRIPT ERROR: Parse Error: Identifier "SceneFlow" not declared in the current scope.
          at: GDScript::reload (res://scripts/ui/main_menu.gd:12)
          GDScript backtrace (most recent call first):
              [0] _scan_dir (res://tools/fast_validate_scripts.gd:32)
              [1] _scan_dir (res://tools/fast_validate_scripts.gd:30)
              [2] _initialize (res://tools/fast_validate_scripts.gd:6)
SCRIPT ERROR: Parse Error: Identifier "SceneFlow" not declared in the current scope.
          at: GDScript::reload (res://scripts/ui/main_menu.gd:15)
          GDScript backtrace (most recent call first):
              [0] _scan_dir (res://tools/fast_validate_scripts.gd:32)
              [1] _scan_dir (res://tools/fast_validate_scripts.gd:30)
              [2] _initialize (res://tools/fast_validate_scripts.gd:6)
ERROR: Failed to load script "res://scripts/ui/main_menu.gd" with error "Parse error".
   at: load (modules/gdscript/gdscript_resource_format.cpp:46)
   GDScript backtrace (most recent call first):
       [0] _scan_dir (res://tools/fast_validate_scripts.gd:32)
       [1] _scan_dir (res://tools/fast_validate_scripts.gd:30)
       [2] _initialize (res://tools/fast_validate_scripts.gd:6)
FAST_GDSCRIPT_VALIDATION: PASS
```
