# Fast Godot script validation

- Engine: Godot 4.7.1 stable
- Branch: `main`
- Tested commit: `b2a0c5b6857a130a25846de768dd6018131ef7b6`
- Exit code: `1`
- Result: **FAIL**

```text
Godot Engine v4.7.1.stable.official.a13da4feb - https://godotengine.org

SCRIPT ERROR: Parse Error: Identifier "SaveSystem" not declared in the current scope.
          at: GDScript::reload (res://scripts/core/scene_flow.gd:11)
ERROR: Failed to load script "res://scripts/core/scene_flow.gd" with error "Parse error".
   at: load (modules/gdscript/gdscript_resource_format.cpp:46)
ERROR: Failed to instantiate an autoload, script 'res://scripts/core/scene_flow.gd' does not inherit from 'Node'.
   at: start (main/main.cpp:4535)
SCRIPT ERROR: Parse Error: Identifier "SaveSystem" not declared in the current scope.
          at: GDScript::reload (res://scripts/horror/boiled_one.gd:48)
          GDScript backtrace (most recent call first):
              [0] _scan_dir (res://tools/fast_validate_scripts.gd:38)
              [1] _scan_dir (res://tools/fast_validate_scripts.gd:31)
              [2] _initialize (res://tools/fast_validate_scripts.gd:6)
SCRIPT ERROR: Parse Error: Identifier "SaveSystem" not declared in the current scope.
          at: GDScript::reload (res://scripts/horror/boiled_one.gd:151)
          GDScript backtrace (most recent call first):
              [0] _scan_dir (res://tools/fast_validate_scripts.gd:38)
              [1] _scan_dir (res://tools/fast_validate_scripts.gd:31)
              [2] _initialize (res://tools/fast_validate_scripts.gd:6)
ERROR: Failed to load script "res://scripts/horror/boiled_one.gd" with error "Parse error".
   at: load (modules/gdscript/gdscript_resource_format.cpp:46)
   GDScript backtrace (most recent call first):
       [0] _scan_dir (res://tools/fast_validate_scripts.gd:38)
       [1] _scan_dir (res://tools/fast_validate_scripts.gd:31)
       [2] _initialize (res://tools/fast_validate_scripts.gd:6)
SCRIPT ERROR: Parse Error: Identifier "SaveSystem" not declared in the current scope.
          at: GDScript::reload (res://scripts/horror/locust_death_controller.gd:71)
          GDScript backtrace (most recent call first):
              [0] _scan_dir (res://tools/fast_validate_scripts.gd:38)
              [1] _scan_dir (res://tools/fast_validate_scripts.gd:31)
              [2] _initialize (res://tools/fast_validate_scripts.gd:6)
SCRIPT ERROR: Parse Error: Identifier "SaveSystem" not declared in the current scope.
          at: GDScript::reload (res://scripts/horror/locust_death_controller.gd:72)
          GDScript backtrace (most recent call first):
              [0] _scan_dir (res://tools/fast_validate_scripts.gd:38)
              [1] _scan_dir (res://tools/fast_validate_scripts.gd:31)
              [2] _initialize (res://tools/fast_validate_scripts.gd:6)
SCRIPT ERROR: Parse Error: Identifier "SaveSystem" not declared in the current scope.
          at: GDScript::reload (res://scripts/horror/locust_death_controller.gd:73)
          GDScript backtrace (most recent call first):
              [0] _scan_dir (res://tools/fast_validate_scripts.gd:38)
              [1] _scan_dir (res://tools/fast_validate_scripts.gd:31)
              [2] _initialize (res://tools/fast_validate_scripts.gd:6)
SCRIPT ERROR: Parse Error: Identifier "SaveSystem" not declared in the current scope.
          at: GDScript::reload (res://scripts/horror/locust_death_controller.gd:74)
          GDScript backtrace (most recent call first):
              [0] _scan_dir (res://tools/fast_validate_scripts.gd:38)
              [1] _scan_dir (res://tools/fast_validate_scripts.gd:31)
              [2] _initialize (res://tools/fast_validate_scripts.gd:6)
SCRIPT ERROR: Compile Error: Failed to compile depended scripts.
          at: GDScript::reload (res://scripts/horror/event_director.gd:0)
          GDScript backtrace (most recent call first):
              [0] _scan_dir (res://tools/fast_validate_scripts.gd:38)
              [1] _scan_dir (res://tools/fast_validate_scripts.gd:31)
              [2] _initialize (res://tools/fast_validate_scripts.gd:6)
ERROR: Failed to load script "res://scripts/horror/event_director.gd" with error "Compilation failed".
   at: load (modules/gdscript/gdscript_resource_format.cpp:46)
   GDScript backtrace (most recent call first):
       [0] _scan_dir (res://tools/fast_validate_scripts.gd:38)
       [1] _scan_dir (res://tools/fast_validate_scripts.gd:31)
       [2] _initialize (res://tools/fast_validate_scripts.gd:6)
SCRIPT ERROR: Parse Error: Identifier "SaveSystem" not declared in the current scope.
          at: GDScript::reload (res://scripts/horror/locust_death_controller.gd:71)
          GDScript backtrace (most recent call first):
              [0] _scan_dir (res://tools/fast_validate_scripts.gd:38)
              [1] _scan_dir (res://tools/fast_validate_scripts.gd:31)
              [2] _initialize (res://tools/fast_validate_scripts.gd:6)
SCRIPT ERROR: Parse Error: Identifier "SaveSystem" not declared in the current scope.
          at: GDScript::reload (res://scripts/horror/locust_death_controller.gd:72)
          GDScript backtrace (most recent call first):
              [0] _scan_dir (res://tools/fast_validate_scripts.gd:38)
              [1] _scan_dir (res://tools/fast_validate_scripts.gd:31)
              [2] _initialize (res://tools/fast_validate_scripts.gd:6)
SCRIPT ERROR: Parse Error: Identifier "SaveSystem" not declared in the current scope.
          at: GDScript::reload (res://scripts/horror/locust_death_controller.gd:73)
          GDScript backtrace (most recent call first):
              [0] _scan_dir (res://tools/fast_validate_scripts.gd:38)
              [1] _scan_dir (res://tools/fast_validate_scripts.gd:31)
              [2] _initialize (res://tools/fast_validate_scripts.gd:6)
SCRIPT ERROR: Parse Error: Identifier "SaveSystem" not declared in the current scope.
          at: GDScript::reload (res://scripts/horror/locust_death_controller.gd:74)
          GDScript backtrace (most recent call first):
              [0] _scan_dir (res://tools/fast_validate_scripts.gd:38)
              [1] _scan_dir (res://tools/fast_validate_scripts.gd:31)
              [2] _initialize (res://tools/fast_validate_scripts.gd:6)
ERROR: Failed to load script "res://scripts/horror/locust_death_controller.gd" with error "Parse error".
   at: load (modules/gdscript/gdscript_resource_format.cpp:46)
   GDScript backtrace (most recent call first):
       [0] _scan_dir (res://tools/fast_validate_scripts.gd:38)
       [1] _scan_dir (res://tools/fast_validate_scripts.gd:31)
       [2] _initialize (res://tools/fast_validate_scripts.gd:6)
SCRIPT ERROR: Parse Error: Identifier "SaveSystem" not declared in the current scope.
          at: GDScript::reload (res://scripts/player/player.gd:131)
          GDScript backtrace (most recent call first):
              [0] _scan_dir (res://tools/fast_validate_scripts.gd:38)
              [1] _scan_dir (res://tools/fast_validate_scripts.gd:31)
              [2] _initialize (res://tools/fast_validate_scripts.gd:6)
ERROR: Failed to load script "res://scripts/player/player.gd" with error "Parse error".
   at: load (modules/gdscript/gdscript_resource_format.cpp:46)
   GDScript backtrace (most recent call first):
       [0] _scan_dir (res://tools/fast_validate_scripts.gd:38)
       [1] _scan_dir (res://tools/fast_validate_scripts.gd:31)
       [2] _initialize (res://tools/fast_validate_scripts.gd:6)
SCRIPT ERROR: Parse Error: Identifier "SaveSystem" not declared in the current scope.
          at: GDScript::reload (res://scripts/player/flashlight_rig.gd:50)
          GDScript backtrace (most recent call first):
              [0] _scan_dir (res://tools/fast_validate_scripts.gd:38)
              [1] _scan_dir (res://tools/fast_validate_scripts.gd:31)
              [2] _initialize (res://tools/fast_validate_scripts.gd:6)
ERROR: Failed to load script "res://scripts/player/flashlight_rig.gd" with error "Parse error".
   at: load (modules/gdscript/gdscript_resource_format.cpp:46)
   GDScript backtrace (most recent call first):
       [0] _scan_dir (res://tools/fast_validate_scripts.gd:38)
       [1] _scan_dir (res://tools/fast_validate_scripts.gd:31)
       [2] _initialize (res://tools/fast_validate_scripts.gd:6)
SCRIPT ERROR: Parse Error: Identifier "SaveSystem" not declared in the current scope.
          at: GDScript::reload (res://scripts/core/scene_flow.gd:11)
          GDScript backtrace (most recent call first):
              [0] _scan_dir (res://tools/fast_validate_scripts.gd:38)
              [1] _scan_dir (res://tools/fast_validate_scripts.gd:31)
              [2] _initialize (res://tools/fast_validate_scripts.gd:6)
ERROR: Failed to load script "res://scripts/core/scene_flow.gd" with error "Parse error".
   at: load (modules/gdscript/gdscript_resource_format.cpp:46)
   GDScript backtrace (most recent call first):
       [0] _scan_dir (res://tools/fast_validate_scripts.gd:38)
       [1] _scan_dir (res://tools/fast_validate_scripts.gd:31)
       [2] _initialize (res://tools/fast_validate_scripts.gd:6)
SCRIPT ERROR: Parse Error: Identifier "SaveSystem" not declared in the current scope.
          at: GDScript::reload (res://scripts/documents/document_pickup.gd:51)
          GDScript backtrace (most recent call first):
              [0] _scan_dir (res://tools/fast_validate_scripts.gd:38)
              [1] _scan_dir (res://tools/fast_validate_scripts.gd:31)
              [2] _initialize (res://tools/fast_validate_scripts.gd:6)
ERROR: Failed to load script "res://scripts/documents/document_pickup.gd" with error "Parse error".
   at: load (modules/gdscript/gdscript_resource_format.cpp:46)
   GDScript backtrace (most recent call first):
       [0] _scan_dir (res://tools/fast_validate_scripts.gd:38)
       [1] _scan_dir (res://tools/fast_validate_scripts.gd:31)
       [2] _initialize (res://tools/fast_validate_scripts.gd:6)
FAST_GDSCRIPT_VALIDATION: PASS
```
