# Android APK validation status

- Engine: Godot 4.7.1 stable
- Branch: `fix/android11-integrity`
- Tested commit: `fa5d501c2265aa697f7733222d6540a19316906b`
- Required minimum: Android 11 / API 30
- Required ABI: arm64-v8a only
- Import exit code: `1`
- Export exit code: `999`
- Manifest/ABI verification exit code: `1`
- APK minSdk: `unknown`
- APK targetSdk: `unknown`
- Result: **FAIL**

## Import log tail
```text
[  92% ] [90m[1mreimport[22m | Picea mariana HD_Arctic mat 100_LOD0.fbx[39m[0m
[   0% ] [90m[1mimport[22m | Started Import Scene (104 steps)[39m[0m
[   0% ] [90m[1mimport[22m | Importing Scene...[39m[0m
[   1% ] [90m[1mimport[22m | Running Custom Script...[39m[0m
[  99% ] [90m[1mimport[22m | Saving...[39m[0m
[92m[ DONE ][39m [1mimport[22m
[0m
[  93% ] [90m[1mreimport[22m | Pickup Afghanistan.fbx[39m[0m
[   0% ] [90m[1mimport[22m | Started Import Scene (104 steps)[39m[0m
[   0% ] [90m[1mimport[22m | Importing Scene...[39m[0m
[   1% ] [90m[1mimport[22m | Running Custom Script...[39m[0m
[  99% ] [90m[1mimport[22m | Saving...[39m[0m
[92m[ DONE ][39m [1mimport[22m
[0m
[  93% ] [90m[1mreimport[22m | BoiledOne.fbx[39m[0m
[   0% ] [90m[1mimport[22m | Started Import Scene (104 steps)[39m[0m
[   0% ] [90m[1mimport[22m | Importing Scene...[39m[0m
[   1% ] [90m[1mimport[22m | Running Custom Script...[39m[0m
[  99% ] [90m[1mimport[22m | Saving...[39m[0m
[92m[ DONE ][39m [1mimport[22m
[0m
[  94% ] [90m[1mreimport[22m | T_O_E Locust - By Doumty.fbx[39m[0m
[   0% ] [90m[1mimport[22m | Started Import Scene (104 steps)[39m[0m
[   0% ] [90m[1mimport[22m | Importing Scene...[39m[0m
[   1% ] [90m[1mimport[22m | Running Custom Script...[39m[0m
[  99% ] [90m[1mimport[22m | Saving...[39m[0m
[92m[ DONE ][39m [1mimport[22m
[0m
[  95% ] [90m[1mreimport[22m | document_file_folder (1).glb[39m[0m
[   0% ] [90m[1mimport[22m | Started Import Scene (104 steps)[39m[0m
[   0% ] [90m[1mimport[22m | Importing Scene...[39m[0m
[   1% ] [90m[1mimport[22m | Running Custom Script...[39m[0m
[  99% ] [90m[1mimport[22m | Saving...[39m[0m
[92m[ DONE ][39m [1mimport[22m
[0m
[  95% ] [90m[1mreimport[22m | Grass.fbx[39m[0m
[   0% ] [90m[1mimport[22m | Started Import Scene (104 steps)[39m[0m
[   0% ] [90m[1mimport[22m | Importing Scene...[39m[0m
[   1% ] [90m[1mimport[22m | Running Custom Script...[39m[0m
[  99% ] [90m[1mimport[22m | Saving...[39m[0m
[92m[ DONE ][39m [1mimport[22m
[0m
[  96% ] [90m[1mreimport[22m | flashlightfbx.fbx[39m[0m
[   0% ] [90m[1mimport[22m | Started Import Scene (104 steps)[39m[0m
[   0% ] [90m[1mimport[22m | Importing Scene...[39m[0m
[   1% ] [90m[1mimport[22m | Running Custom Script...[39m[0m
[  99% ] [90m[1mimport[22m | Saving...[39m[0m
[92m[ DONE ][39m [1mimport[22m
[0m
[  97% ] [90m[1mreimport[22m | fpsarms.fbx[39m[0m
[   0% ] [90m[1mimport[22m | Started Import Scene (104 steps)[39m[0m
[   0% ] [90m[1mimport[22m | Importing Scene...[39m[0m
[   1% ] [90m[1mimport[22m | Running Custom Script...[39m[0m
[  99% ] [90m[1mimport[22m | Saving...[39m[0m
[92m[ DONE ][39m [1mimport[22m
[0m
[  97% ] [90m[1mreimport[22m | Tree_Pack.fbx[39m[0m
[   0% ] [90m[1mimport[22m | Started Import Scene (104 steps)[39m[0m
[   0% ] [90m[1mimport[22m | Importing Scene...[39m[0m
ERROR: Resource file not found: res:// (expected type: Texture2D)
   at: _load (core/io/resource_loader.cpp:325)
ERROR: Can't open file from path 'res://assets/environment/trees/low_poly_pack/source/ROCKS_DIFFUSE.png'.
   at: get_file_as_bytes (core/io/file_access.cpp:907)
WARNING: FBX: Image index '4' couldn't be loaded from path: res://assets/environment/trees/low_poly_pack/source/ROCKS_DIFFUSE.png because there was no data to load. Skipping it.
     at: _parse_images (modules/fbx/fbx_document.cpp:1081)
ERROR: Resource file not found: res:// (expected type: Texture2D)
   at: _load (core/io/resource_loader.cpp:325)
ERROR: Can't open file from path 'res://assets/environment/trees/low_poly_pack/source/ROCKS_NORMALtest.png'.
   at: get_file_as_bytes (core/io/file_access.cpp:907)
WARNING: FBX: Image index '5' couldn't be loaded from path: res://assets/environment/trees/low_poly_pack/source/ROCKS_NORMALtest.png because there was no data to load. Skipping it.
     at: _parse_images (modules/fbx/fbx_document.cpp:1081)
ERROR: Resource file not found: res:// (expected type: Texture2D)
   at: _load (core/io/resource_loader.cpp:325)
ERROR: Can't open file from path 'res://assets/environment/trees/low_poly_pack/source/ROCKS_ROUGHNESS.png'.
   at: get_file_as_bytes (core/io/file_access.cpp:907)
WARNING: FBX: Image index '6' couldn't be loaded from path: res://assets/environment/trees/low_poly_pack/source/ROCKS_ROUGHNESS.png because there was no data to load. Skipping it.
     at: _parse_images (modules/fbx/fbx_document.cpp:1081)
[   1% ] [90m[1mimport[22m | Running Custom Script...[39m[0m
[  99% ] [90m[1mimport[22m | Saving...[39m[0m
[92m[ DONE ][39m [1mimport[22m
[0m
[  98% ] [90m[1mreimport[22m | Picea mariana HD_Arctic mat 100_LOD2.fbx[39m[0m
[   0% ] [90m[1mimport[22m | Started Import Scene (104 steps)[39m[0m
[   0% ] [90m[1mimport[22m | Importing Scene...[39m[0m
[   1% ] [90m[1mimport[22m | Running Custom Script...[39m[0m
[  99% ] [90m[1mimport[22m | Saving...[39m[0m
[92m[ DONE ][39m [1mimport[22m
[0m
[  99% ] [90m[1mreimport[22m | Finalizing Asset Import...[39m[0m
[92m[ DONE ][39m [1mreimport[22m
[0m
[   0% ] [90m[1mreimport[22m | Started (Re)Importing Assets (143 steps)[39m[0m
[   0% ] [90m[1mreimport[22m | Executing post-reimport operations...[39m[0m
[92m[ DONE ][39m [1mreimport[22m
[0m
[   0% ] [90m[1mloading_editor_layout[22m | Started Loading editor (5 steps)[39m[0m
[   0% ] [90m[1mloading_editor_layout[22m | Loading editor layout...[39m[0m
[  16% ] [90m[1mloading_editor_layout[22m | Loading docks...[39m[0m
[92m[ DONE ][39m [1mloading_editor_layout[22m
[0m
```

## Export log tail
```text
```

## APK badging
```text
08-20 13:24:50.587  2538  2538 W asset   : Asset path Builds/Android/FallenForest-debug.apk is neither a directory nor file (type=1).
ERROR: dump failed because assets could not be loaded
```
