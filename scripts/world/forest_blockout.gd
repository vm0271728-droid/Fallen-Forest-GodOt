extends MultiMeshInstance3D

@export var tree_count := 3250
@export var world_half_extent := 345.0
@export var start_clear_radius := 18.0
@export var min_scale := 0.80
@export var max_scale := 1.35
@export var terrain_path: NodePath

var tree_positions := PackedVector3Array()
var _terrain: Node

func _ready() -> void:
	_terrain = get_node_or_null(terrain_path)
	if _terrain == null and get_parent() != null:
		_terrain = get_parent().get_node_or_null("Terrain")
	build_forest()

func build_forest() -> void:
	tree_positions.clear()
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

	var mm := MultiMesh.new()
	mm.transform_format = MultiMesh.TRANSFORM_3D
	mm.instance_count = tree_count
	mm.mesh = trunk

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
		var height_scale := rng.randf_range(0.9, 1.2) * scale
		var ground_y := 0.0
		if _terrain != null and _terrain.has_method("sample_height"):
			ground_y = float(_terrain.call("sample_height", x, z))

		var basis := Basis(Vector3.UP, rng.randf_range(0.0, TAU))
		basis = basis.scaled(Vector3(scale, height_scale, scale))
		var origin := Vector3(x, ground_y + 3.5 * height_scale, z)
		mm.set_instance_transform(placed, Transform3D(basis, origin))
		tree_positions.append(Vector3(x, ground_y, z))
		placed += 1

	mm.instance_count = placed
	multimesh = mm
	print("Fallen Forest blockout: %d trees generated with MultiMesh." % placed)

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
