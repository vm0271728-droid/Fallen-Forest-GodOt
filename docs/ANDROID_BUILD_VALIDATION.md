# Android APK validation status

- Engine: Godot 4.7.1 stable
- Branch: `main`
- Tested commit: `88b389c34ee62f45fdb909c556a485442562136a`
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
   at: _load (core/io/resource_loader.cpp:325)
ERROR: Can't open file from path 'res://assets/environment/trees/low_poly_pack/source/Background_Tree_Atlas_Roughness.png'.
   at: get_file_as_bytes (core/io/file_access.cpp:907)
WARNING: FBX: Image index '3' couldn't be loaded from path: res://assets/environment/trees/low_poly_pack/source/Background_Tree_Atlas_Roughness.png because there was no data to load. Skipping it.
     at: _parse_images (modules/fbx/fbx_document.cpp:1081)
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
ERROR: Resource file not found: res:// (expected type: Texture2D)
   at: _load (core/io/resource_loader.cpp:325)
ERROR: Can't open file from path 'res://assets/environment/trees/low_poly_pack/source/Tree_Branches_1_Diffuse.png'.
   at: get_file_as_bytes (core/io/file_access.cpp:907)
WARNING: FBX: Image index '7' couldn't be loaded from path: res://assets/environment/trees/low_poly_pack/source/Tree_Branches_1_Diffuse.png because there was no data to load. Skipping it.
     at: _parse_images (modules/fbx/fbx_document.cpp:1081)
ERROR: Resource file not found: res:// (expected type: Texture2D)
   at: _load (core/io/resource_loader.cpp:325)
ERROR: Can't open file from path 'res://assets/environment/trees/low_poly_pack/source/Tree_Branches_1_Opacity.png'.
   at: get_file_as_bytes (core/io/file_access.cpp:907)
WARNING: FBX: Image index '8' couldn't be loaded from path: res://assets/environment/trees/low_poly_pack/source/Tree_Branches_1_Opacity.png because there was no data to load. Skipping it.
     at: _parse_images (modules/fbx/fbx_document.cpp:1081)
ERROR: Resource file not found: res:// (expected type: Texture2D)
   at: _load (core/io/resource_loader.cpp:325)
ERROR: Can't open file from path 'res://assets/environment/trees/low_poly_pack/source/Tree_Branches_Normal.png'.
   at: get_file_as_bytes (core/io/file_access.cpp:907)
WARNING: FBX: Image index '9' couldn't be loaded from path: res://assets/environment/trees/low_poly_pack/source/Tree_Branches_Normal.png because there was no data to load. Skipping it.
     at: _parse_images (modules/fbx/fbx_document.cpp:1081)
ERROR: Resource file not found: res:// (expected type: Texture2D)
   at: _load (core/io/resource_loader.cpp:325)
ERROR: Can't open file from path 'res://assets/environment/trees/low_poly_pack/source/Tree_Branches_Roughness.png'.
   at: get_file_as_bytes (core/io/file_access.cpp:907)
WARNING: FBX: Image index '10' couldn't be loaded from path: res://assets/environment/trees/low_poly_pack/source/Tree_Branches_Roughness.png because there was no data to load. Skipping it.
     at: _parse_images (modules/fbx/fbx_document.cpp:1081)
ERROR: Resource file not found: res:// (expected type: Texture2D)
   at: _load (core/io/resource_loader.cpp:325)
ERROR: Can't open file from path 'res://assets/environment/trees/low_poly_pack/source/Tree_Branches_2_Diffuse.png'.
   at: get_file_as_bytes (core/io/file_access.cpp:907)
WARNING: FBX: Image index '11' couldn't be loaded from path: res://assets/environment/trees/low_poly_pack/source/Tree_Branches_2_Diffuse.png because there was no data to load. Skipping it.
     at: _parse_images (modules/fbx/fbx_document.cpp:1081)
ERROR: Resource file not found: res:// (expected type: Texture2D)
   at: _load (core/io/resource_loader.cpp:325)
ERROR: Can't open file from path 'res://assets/environment/trees/low_poly_pack/source/Tree_Branches_2_Opacity.png'.
   at: get_file_as_bytes (core/io/file_access.cpp:907)
WARNING: FBX: Image index '12' couldn't be loaded from path: res://assets/environment/trees/low_poly_pack/source/Tree_Branches_2_Opacity.png because there was no data to load. Skipping it.
     at: _parse_images (modules/fbx/fbx_document.cpp:1081)
ERROR: Resource file not found: res:// (expected type: Texture2D)
   at: _load (core/io/resource_loader.cpp:325)
ERROR: Can't open file from path 'res://assets/environment/trees/low_poly_pack/source/Tree_Trunk_01_Normal.png'.
   at: get_file_as_bytes (core/io/file_access.cpp:907)
WARNING: FBX: Image index '13' couldn't be loaded from path: res://assets/environment/trees/low_poly_pack/source/Tree_Trunk_01_Normal.png because there was no data to load. Skipping it.
     at: _parse_images (modules/fbx/fbx_document.cpp:1081)
ERROR: Resource file not found: res:// (expected type: Texture2D)
   at: _load (core/io/resource_loader.cpp:325)
ERROR: Can't open file from path 'res://assets/environment/trees/low_poly_pack/source/Tree_Trunk_01_Roughness.png'.
   at: get_file_as_bytes (core/io/file_access.cpp:907)
WARNING: FBX: Image index '14' couldn't be loaded from path: res://assets/environment/trees/low_poly_pack/source/Tree_Trunk_01_Roughness.png because there was no data to load. Skipping it.
     at: _parse_images (modules/fbx/fbx_document.cpp:1081)
ERROR: Resource file not found: res:// (expected type: Texture2D)
   at: _load (core/io/resource_loader.cpp:325)
ERROR: Can't open file from path 'res://assets/environment/trees/low_poly_pack/source/Tree_Trunk_02_Normal.png'.
   at: get_file_as_bytes (core/io/file_access.cpp:907)
WARNING: FBX: Image index '15' couldn't be loaded from path: res://assets/environment/trees/low_poly_pack/source/Tree_Trunk_02_Normal.png because there was no data to load. Skipping it.
     at: _parse_images (modules/fbx/fbx_document.cpp:1081)
ERROR: Resource file not found: res:// (expected type: Texture2D)
   at: _load (core/io/resource_loader.cpp:325)
ERROR: Can't open file from path 'res://assets/environment/trees/low_poly_pack/source/Tree_Trunk_02_Roughness.png'.
   at: get_file_as_bytes (core/io/file_access.cpp:907)
WARNING: FBX: Image index '16' couldn't be loaded from path: res://assets/environment/trees/low_poly_pack/source/Tree_Trunk_02_Roughness.png because there was no data to load. Skipping it.
     at: _parse_images (modules/fbx/fbx_document.cpp:1081)
[   1% ] [90m[1mimport[22m | Running Custom Script...[39m[0m
[  99% ] [90m[1mimport[22m | Saving...[39m[0m
[92m[ DONE ][39m [1mimport[22m
[0m
[  99% ] [90m[1mreimport[22m | Finalizing Asset Import...[39m[0m
[92m[ DONE ][39m [1mreimport[22m
[0m
[   0% ] [90m[1mreimport[22m | Started (Re)Importing Assets (227 steps)[39m[0m
[   0% ] [90m[1mreimport[22m | Executing post-reimport operations...[39m[0m
[92m[ DONE ][39m [1mreimport[22m
[0m
[   0% ] [90m[1mloading_editor_layout[22m | Started Loading editor (5 steps)[39m[0m
[   0% ] [90m[1mloading_editor_layout[22m | Loading editor layout...[39m[0m
[  16% ] [90m[1mloading_editor_layout[22m | Loading docks...[39m[0m
[92m[ DONE ][39m [1mloading_editor_layout[22m
[0m
cannot connect to daemon at tcp:5037: Connection refused
```

## Export log tail
```text
```

## APK badging
```text
08-21 17:28:30.576  2631  2631 W asset   : Asset path Builds/Android/FallenForest-debug.apk is neither a directory nor file (type=1).
ERROR: dump failed because assets could not be loaded
```
