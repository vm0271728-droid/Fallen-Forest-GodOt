# Android APK validation status

- Engine: Godot 4.7.1 stable
- Branch: `fix/android11-integrity`
- Tested commit: `2cce87c4d462ba665f86cb03700635d473cc8964`
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
     at: _parse_material_library (editor/import/3d/resource_importer_obj.cpp:60)
WARNING: OBJ: Ambient light for material 'nature_bark_fir_02_m_0001.jpg' is ignored in PBR
     at: _parse_material_library (editor/import/3d/resource_importer_obj.cpp:60)
[  91% ] [90m[1mreimport[22m | fir_2.obj[39m[0m
WARNING: OBJ: Ambient light for material 'nature_bark_fir_07_m_0001.jpg' is ignored in PBR
     at: _parse_material_library (editor/import/3d/resource_importer_obj.cpp:60)
WARNING: OBJ: Ambient light for material 'nature_bark_fir_05_m_0001.jpg' is ignored in PBR
     at: _parse_material_library (editor/import/3d/resource_importer_obj.cpp:60)
WARNING: OBJ: Ambient light for material 'nature_bark_fir_02_m_0001.jpg' is ignored in PBR
     at: _parse_material_library (editor/import/3d/resource_importer_obj.cpp:60)
[  91% ] [90m[1mreimport[22m | fir_1.obj[39m[0m
WARNING: OBJ: Ambient light for material 'nature_bark_fir_07_m_0001.jpg' is ignored in PBR
     at: _parse_material_library (editor/import/3d/resource_importer_obj.cpp:60)
WARNING: OBJ: Ambient light for material 'nature_bark_fir_05_m_0001.jpg' is ignored in PBR
     at: _parse_material_library (editor/import/3d/resource_importer_obj.cpp:60)
WARNING: OBJ: Ambient light for material 'nature_bark_fir_02_m_0001.jpg' is ignored in PBR
     at: _parse_material_library (editor/import/3d/resource_importer_obj.cpp:60)
[  92% ] [90m[1mreimport[22m | Grass.fbx[39m[0m
[   0% ] [90m[1mimport[22m | Started Import Scene (104 steps)[39m[0m
[   0% ] [90m[1mimport[22m | Importing Scene...[39m[0m
[   1% ] [90m[1mimport[22m | Running Custom Script...[39m[0m
[  99% ] [90m[1mimport[22m | Saving...[39m[0m
[92m[ DONE ][39m [1mimport[22m
[0m
[  93% ] [90m[1mreimport[22m | flashlightfbx.fbx[39m[0m
[   0% ] [90m[1mimport[22m | Started Import Scene (104 steps)[39m[0m
[   0% ] [90m[1mimport[22m | Importing Scene...[39m[0m
[   1% ] [90m[1mimport[22m | Running Custom Script...[39m[0m
[  99% ] [90m[1mimport[22m | Saving...[39m[0m
[92m[ DONE ][39m [1mimport[22m
[0m
[  93% ] [90m[1mreimport[22m | fpsarms.fbx[39m[0m
[   0% ] [90m[1mimport[22m | Started Import Scene (104 steps)[39m[0m
[   0% ] [90m[1mimport[22m | Importing Scene...[39m[0m
[   1% ] [90m[1mimport[22m | Running Custom Script...[39m[0m
[  99% ] [90m[1mimport[22m | Saving...[39m[0m
[92m[ DONE ][39m [1mimport[22m
[0m
[  94% ] [90m[1mreimport[22m | Tree_Pack.fbx[39m[0m
[   0% ] [90m[1mimport[22m | Started Import Scene (104 steps)[39m[0m
[   0% ] [90m[1mimport[22m | Importing Scene...[39m[0m
[   1% ] [90m[1mimport[22m | Running Custom Script...[39m[0m
[  99% ] [90m[1mimport[22m | Saving...[39m[0m
[92m[ DONE ][39m [1mimport[22m
[0m
[  95% ] [90m[1mreimport[22m | Picea mariana HD_Arctic mat 100_LOD2.fbx[39m[0m
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
[  96% ] [90m[1mreimport[22m | T_O_E Locust - By Doumty.fbx[39m[0m
[   0% ] [90m[1mimport[22m | Started Import Scene (104 steps)[39m[0m
[   0% ] [90m[1mimport[22m | Importing Scene...[39m[0m
[   1% ] [90m[1mimport[22m | Running Custom Script...[39m[0m
[  99% ] [90m[1mimport[22m | Saving...[39m[0m
[92m[ DONE ][39m [1mimport[22m
[0m
[  97% ] [90m[1mreimport[22m | Picea mariana HD_Arctic mat 100_LOD0.fbx[39m[0m
[   0% ] [90m[1mimport[22m | Started Import Scene (104 steps)[39m[0m
[   0% ] [90m[1mimport[22m | Importing Scene...[39m[0m
[   1% ] [90m[1mimport[22m | Running Custom Script...[39m[0m
[  99% ] [90m[1mimport[22m | Saving...[39m[0m
[92m[ DONE ][39m [1mimport[22m
[0m
[  97% ] [90m[1mreimport[22m | Pickup Afghanistan.fbx[39m[0m
[   0% ] [90m[1mimport[22m | Started Import Scene (104 steps)[39m[0m
[   0% ] [90m[1mimport[22m | Importing Scene...[39m[0m
[   1% ] [90m[1mimport[22m | Running Custom Script...[39m[0m
[  99% ] [90m[1mimport[22m | Saving...[39m[0m
[92m[ DONE ][39m [1mimport[22m
[0m
[  98% ] [90m[1mreimport[22m | BoiledOne.fbx[39m[0m
[   0% ] [90m[1mimport[22m | Started Import Scene (104 steps)[39m[0m
[   0% ] [90m[1mimport[22m | Importing Scene...[39m[0m
[   1% ] [90m[1mimport[22m | Running Custom Script...[39m[0m
[  99% ] [90m[1mimport[22m | Saving...[39m[0m
[92m[ DONE ][39m [1mimport[22m
[0m
[  99% ] [90m[1mreimport[22m | Finalizing Asset Import...[39m[0m
[92m[ DONE ][39m [1mreimport[22m
[0m
[   0% ] [90m[1mreimport[22m | Started (Re)Importing Assets (147 steps)[39m[0m
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
08-20 13:54:13.958  2767  2767 W asset   : Asset path Builds/Android/FallenForest-debug.apk is neither a directory nor file (type=1).
ERROR: dump failed because assets could not be loaded
```
