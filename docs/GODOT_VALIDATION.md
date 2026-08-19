# Godot validation status

- Engine: Godot 4.7.1 stable
- Tested commit: `4516201a605b9d93961de51d223138c0d43ab5e8`
- Project import/parse exit code: `0`
- Asset inspection exit code: `1`
- Overall exit code: `1`
- Result: **FAIL**

## Tail of headless editor log

```text
Godot Engine v4.7.1.stable.official.a13da4feb - https://godotengine.org

[   0% ] [90m[1mfirst_scan_filesystem[22m | Started Project initialization (5 steps)[39m[0m
[   0% ] [90m[1mfirst_scan_filesystem[22m | Scanning file structure...[39m[0m
[  16% ] [90m[1mfirst_scan_filesystem[22m | Loading global class names...[39m[0m
[  33% ] [90m[1mfirst_scan_filesystem[22m | Verifying GDExtensions...[39m[0m
[  50% ] [90m[1mfirst_scan_filesystem[22m | Creating autoload scripts...[39m[0m
[  66% ] [90m[1mfirst_scan_filesystem[22m | Initializing plugins...[39m[0m
[  83% ] [90m[1mfirst_scan_filesystem[22m | Starting file scan...[39m[0m
[92m[ DONE ][39m [1mfirst_scan_filesystem[22m
[0m
WARNING: Scan thread aborted...
     at: _notification (editor/file_system/editor_file_system.cpp:1757)
```

## Tail of asset inspector log

```text
Godot Engine v4.7.1.stable.official.a13da4feb - https://godotengine.org

SCRIPT ERROR: Parse Error: Cannot infer the type of "local_to_root" variable because the value doesn't have a set type.
          at: GDScript::reload (res://tools/inspect_assets.gd:77)
SCRIPT ERROR: Parse Error: Cannot infer the type of "p" variable because the value doesn't have a set type.
          at: GDScript::reload (res://tools/inspect_assets.gd:89)
ERROR: Failed to load script "res://tools/inspect_assets.gd" with error "Parse error".
   at: load (modules/gdscript/gdscript_resource_format.cpp:46)
```
