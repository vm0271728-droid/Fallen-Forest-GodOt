extends MultiMeshInstance3D

const DEFAULT_TREE_SCENE := preload("res://assets/environment/trees/black_spruce/zzz_LODs/LOD2/Picea mariana HD_Arctic mat 100_LOD2.fbx")

@export var tree_count := 3250
@export var world_half_extent := 345.0
@export var start_clear_radius := 18.0
@export var min_scale := 1.20
@export var max_scale := 1.90
@export var terrain_path: NodePath
@export var tree_scene: PackedScene = DEFAULT_TREE_SCENE

var tree_positions := PackedVector3Array()
var _terrain: Node

func _ready() -> void:
	_terrain = get_node_or_null(terrain_path)
	if _terrain == null and get_parent() != null:
		_terrain = get_parent().get_node_or_null("Terrain")
	build_forest()

func build_forest() -> void:
	tree_positions.clear()
	var source := _resolve_tree_mesh()
	var tree_mesh: Mesh = source.mesh
	var source_transform: Transform3D = source.transform

	var mm := MultiMesh.new()
	mm.transform_format = MultiMesh.TRANSFORM_3D
	mm.instance_count = tree_count
	mm.mesh = tree_mesh

	var rng := RandomNumberGenerator.new()
	rng.seed = int(GameState.run_seed) ^ 0x1F0A57

	var placed := 0
	var attempts := 0
	while placed < tree_count and attempts < tree_count * 12:
		attempts += 1
		var x := rng.randf_range(-world_half_extent, world_half_extent)
		var z := rng.randf_range(-world_half_extent, world_half_extent)
		if Vector2(x, z).length() < start_clear_radius:
			continue

		# Coarse clustering: some areas are intentionally much denser than others.
		var density := 0.5 + 0.5 * sin(x * 0.021 + sin(z * 0.013) * 2.4)
		if rng.randf() > lerpf(0.35, 0.96, density):
			continue

		var scale := rng.randf_range(min_scale, max_scale)
		var y_scale := rng.randf_range(0.94, 1.08) * scale
		var ground_y := 0.0
		if _terrain != null and _terrain.has_method("sample_height"):
			ground_y = float(_terrain.call("sample_height", x, z))

		var placement_basis := Basis(Vector3.UP, rng.randf_range(0.0, TAU))
		placement_basis = placement_basis.scaled(Vector3(scale, y_scale, scale))
		var placement := Transform3D(placement_basis, Vector3(x, ground_y, z))
		mm.set_instance_transform(placed, placement * source_transform)
		tree_positions.append(Vector3(x, ground_y, z))
		placed += 1

	mm.instance_count = placed
	multimesh = mm
	print("Fallen Forest: %d canonical black-spruce LOD2 trees generated with MultiMesh." % placed)

func _resolve_tree_mesh() -> Dictionary:
	if tree_scene != null:
		var root: Node = tree_scene.instantiate()
		var result := _find_first_mesh(root, Transform3D.IDENTITY)
		root.free()
		if result.has("mesh"):
			return result

	push_warning("Fallen Forest: canonical spruce mesh unavailable, using developer fallback trunk.")
	var trunk := CylinderMesh.new()
	trunk.top_radius = 0.18
	trunk.bottom_radius = 0.28
	trunk.height = 7.0
	trunk.radial_segments = 6
	trunk.rings = 1
	var material := StandardMaterial3D.new()
	material.albedo_color = Color(0.035, 0.022, 0.012, 1.0)
	material.roughness = 1.0
	trunk.material = material
	return {
		"mesh": trunk,
		"transform": Transform3D(Basis.IDENTITY, Vector3(0.0, 3.5, 0.0)),
	}

func _find_first_mesh(node: Node, parent_transform: Transform3D) -> Dictionary:
	var current := parent_transform
	if node is Node3D:
		current = parent_transform * (node as Node3D).transform
	if node is MeshInstance3D:
		var mesh_instance := node as MeshInstance3D
		if mesh_instance.mesh != null:
			return {"mesh": mesh_instance.mesh, "transform": current}
	for child: Node in node.get_children():
		var found := _find_first_mesh(child, current)
		if found.has("mesh"):
			return found
	return {}

func find_cover_near(player_position: Vector3, minimum_distance: float, maximum_distance: float, rng: RandomNumberGenerator) -> Vector3:
	if tree_positions.is_empty():
		return Vector3.INF
	var candidates: Array[Vector3] = []
	for position in tree_positions:
		var distance := Vector2(position.x - player_position.x, position.z - player_position.z).length()
		if distance >= minimum_distance and distance <= maximum_distance:
			candidates.append(position)
	if candidates.is_empty():
		return Vector3.INF
	return candidates[rng.randi_range(0, candidates.size() - 1)]
