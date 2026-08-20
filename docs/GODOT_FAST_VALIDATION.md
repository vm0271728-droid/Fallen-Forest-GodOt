# Fast Godot script validation

- Engine: Godot 4.7.1 stable
- Branch: `fix/android11-integrity`
- Tested commit: `379fff1a7b488ccdb377a2030f794b2e4c24e49a`
- Exit code: `1`
- Result: **FAIL**

```text
Godot Engine v4.7.1.stable.official.a13da4feb - https://godotengine.org

SCRIPT ERROR: Parse Error: Cannot infer the type of "hit" variable because the value doesn't have a set type.
          at: GDScript::reload (res://tools/validate_runtime_physics.gd:98)
          GDScript backtrace (most recent call first):
              [0] _scan_dir (res://tools/fast_validate_scripts.gd:33)
              [1] _initialize (res://tools/fast_validate_scripts.gd:7)
SCRIPT ERROR: Parse Error: Cannot infer the type of "hit" variable because the value doesn't have a set type.
          at: GDScript::reload (res://tools/validate_runtime_physics.gd:148)
          GDScript backtrace (most recent call first):
              [0] _scan_dir (res://tools/fast_validate_scripts.gd:33)
              [1] _initialize (res://tools/fast_validate_scripts.gd:7)
ERROR: Failed to load script "res://tools/validate_runtime_physics.gd" with error "Parse error".
   at: load (modules/gdscript/gdscript_resource_format.cpp:46)
   GDScript backtrace (most recent call first):
       [0] _scan_dir (res://tools/fast_validate_scripts.gd:33)
       [1] _initialize (res://tools/fast_validate_scripts.gd:7)
ERROR: Index p_type_b = 116 is out of bounds (Variant::VARIANT_MAX = 39).
   at: get_validated_operator_evaluator (core/variant/variant_op.cpp:1070)
   GDScript backtrace (most recent call first):
       [0]  (res://tools/fast_validate_scripts.gd:34)
       [1]  (res://tools/fast_validate_scripts.gd:7)
SCRIPT ERROR: Invalid operands 'Object' and '' in operator '=='.
          at:  (res://tools/fast_validate_scripts.gd:34)
          GDScript backtrace (most recent call first):
              [0]  (res://tools/fast_validate_scripts.gd:34)
              [1]  (res://tools/fast_validate_scripts.gd:7)

================================================================
handle_crash: Program crashed with signal 11
Engine version: Godot Engine v4.7.1.stable.official (a13da4feb8d8aefc283c3763d33a2f170a18d541)
Dumping the backtrace. Please include this when reporting the bug on: https://github.com/godotengine/godot/issues
Load address: 7f1a79a00000

[1] 7f1a79a45330 (main+45330) - /lib/x86_64-linux-gnu/libc.so.6(+0x45330) [0x7f1a79a45330]
-- END OF C++ BACKTRACE --
================================================================
GDScript backtrace (most recent call first):
    [0]  (res://tools/fast_validate_scripts.gd:7)
-- END OF GDSCRIPT BACKTRACE --
================================================================
timeout: the monitored command dumped core
```
