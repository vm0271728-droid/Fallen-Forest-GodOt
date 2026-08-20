# Godot validation status

- Engine: Godot 4.7.1 stable
- Branch: `fix/android11-integrity`
- Tested commit: `cb15c55ba8fb99d6b3096605c79ac765c735fac3`
- Full asset import exit code: `1`
- Main-menu smoke-test exit code: `0`
- Gameplay smoke-test exit code: `0`
- Runtime floor/tree physics exit code: `0`
- Asset inspection exit code: `0`
- Overall exit code: `1`
- Result: **FAIL**

## Tail of import log
```text
ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
   at: add_surface (scene/resources/mesh.cpp:1784)
ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
   at: add_surface (scene/resources/mesh.cpp:1784)
ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
   at: add_surface (scene/resources/mesh.cpp:1784)
ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
   at: add_surface (scene/resources/mesh.cpp:1784)
ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
   at: add_surface (scene/resources/mesh.cpp:1784)
ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
   at: add_surface (scene/resources/mesh.cpp:1784)
ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
   at: add_surface (scene/resources/mesh.cpp:1784)
ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
   at: add_surface (scene/resources/mesh.cpp:1784)
ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
   at: add_surface (scene/resources/mesh.cpp:1784)
ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
   at: add_surface (scene/resources/mesh.cpp:1784)
ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
   at: add_surface (scene/resources/mesh.cpp:1784)
ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
   at: add_surface (scene/resources/mesh.cpp:1784)
ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
   at: add_surface (scene/resources/mesh.cpp:1784)
ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
   at: add_surface (scene/resources/mesh.cpp:1784)
ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
   at: add_surface (scene/resources/mesh.cpp:1784)
ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
   at: add_surface (scene/resources/mesh.cpp:1784)
ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
   at: add_surface (scene/resources/mesh.cpp:1784)
ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
   at: add_surface (scene/resources/mesh.cpp:1784)
ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
   at: add_surface (scene/resources/mesh.cpp:1784)
ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
   at: add_surface (scene/resources/mesh.cpp:1784)
ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
   at: add_surface (scene/resources/mesh.cpp:1784)
ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
   at: add_surface (scene/resources/mesh.cpp:1784)
ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
   at: add_surface (scene/resources/mesh.cpp:1784)
ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
   at: add_surface (scene/resources/mesh.cpp:1784)
ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
   at: add_surface (scene/resources/mesh.cpp:1784)
ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
   at: add_surface (scene/resources/mesh.cpp:1784)
ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
   at: add_surface (scene/resources/mesh.cpp:1784)
ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
   at: add_surface (scene/resources/mesh.cpp:1784)
ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
   at: add_surface (scene/resources/mesh.cpp:1784)
ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
   at: add_surface (scene/resources/mesh.cpp:1784)
ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
   at: add_surface (scene/resources/mesh.cpp:1784)
ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
   at: add_surface (scene/resources/mesh.cpp:1784)
ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
   at: add_surface (scene/resources/mesh.cpp:1784)
ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
   at: add_surface (scene/resources/mesh.cpp:1784)
ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
   at: add_surface (scene/resources/mesh.cpp:1784)
ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
   at: add_surface (scene/resources/mesh.cpp:1784)
ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
   at: add_surface (scene/resources/mesh.cpp:1784)
ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
   at: add_surface (scene/resources/mesh.cpp:1784)
ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
   at: add_surface (scene/resources/mesh.cpp:1784)
ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
   at: add_surface (scene/resources/mesh.cpp:1784)
ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
   at: add_surface (scene/resources/mesh.cpp:1784)
ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
   at: add_surface (scene/resources/mesh.cpp:1784)
ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
   at: add_surface (scene/resources/mesh.cpp:1784)
ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
   at: add_surface (scene/resources/mesh.cpp:1784)
ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
   at: add_surface (scene/resources/mesh.cpp:1784)
ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
   at: add_surface (scene/resources/mesh.cpp:1784)
ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
   at: add_surface (scene/resources/mesh.cpp:1784)
ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
   at: add_surface (scene/resources/mesh.cpp:1784)
ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
   at: add_surface (scene/resources/mesh.cpp:1784)
ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
   at: add_surface (scene/resources/mesh.cpp:1784)
```

## Tail of main-menu smoke-test log
```text
Main-menu smoke test skipped because import failed.
```

## Tail of gameplay smoke-test log
```text
Gameplay smoke test skipped because import failed.
```

## Runtime floor/tree physics log
```text
Runtime physics validation skipped because import failed.
```

## Tail of asset inspector log
```text
Asset inspection skipped because import failed.
```
