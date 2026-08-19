extends Node3D

@export var document_scene: PackedScene
@export var count := 10
@export var world_half_extent := 330.0
@export var minimum_spacing := 28.0
@export var minimum_from_start := 34.0
@export var candidate_count := 240
@export var maximum_slope_degrees := 24.0
@export var tree_clearance := 1.6
@export var terrain_path: NodePath
@export var forest_path: NodePath

var _terrain: Node
var _forest: Node

func _ready() -> void:
	_terrain = get_node_or_null(terrain_path)
	_forest = get_node_or_null(forest_path)
	if _terrain == null and get_parent() != null:
		_terrain = get_parent().get_node_or_null("Terrain")
	if _forest == null and get_parent() != null:
		_forest = get_parent().get_node_or_null("ForestBlockout")
	spawn_documents()

func spawn_documents() -> void:
	if document_scene == null:
		push_error("Fallen Forest: DocumentSpawner has no document_scene.")
		return

	var rng := RandomNumberGenerator.new()
	rng.seed = int(GameState.run_seed) ^ 0x5F3759DF

	var candidates: Array[Vector3] = []
	for i in candidate_count:
		var x := rng.randf_range(-world_half_extent, world_half_extent)
		var z := rng.randf_range(-world_half_extent, world_half_extent)
		if Vector2(x, z).length() < minimum_from_start:
			continue

		var y := 0.03
		if _terrain != null and _terrain.has_method("sample_height"):
			y = float(_terrain.call("sample_height", x, z)) + 0.04
		if _terrain != null and _terrain.has_method("sample_normal"):
			var normal: Vector3 = _terrain.call("sample_normal", x, z)
			if rad_to_deg(acos(clampf(normal.dot(Vector3.UP), -1.0, 1.0))) > maximum_slope_degrees:
				continue
		if not _is_clear_of_trees(Vector3(x, y, z)):
			continue
		candidates.append(Vector3(x, y, z))

	# Fisher-Yates shuffle with the run RNG so Continue reproduces the same world.
	for i in range(candidates.size() - 1, 0, -1):
		var j := rng.randi_range(0, i)
		var tmp := candidates[i]
		candidates[i] = candidates[j]
		candidates[j] = tmp

	var chosen: Array[Vector3] = []
	for candidate in candidates:
		if chosen.size() >= count:
			break
		var valid := true
		for previous in chosen:
			if Vector2(previous.x - candidate.x, previous.z - candidate.z).length() < minimum_spacing:
				valid = false
				break
		if not valid:
			continue

		var slot := chosen.size()
		chosen.append(candidate)
		if GameState.is_document_collected(slot):
			continue

		var document := document_scene.instantiate()
		document.position = candidate
		document.rotation.y = rng.randf_range(0.0, TAU)
		add_child(document)
		if document.has_method("configure"):
			document.call("configure", slot)

	if chosen.size() < count:
		push_warning("Fallen Forest: only %d/%d valid document positions were generated." % [chosen.size(), count])

func _is_clear_of_trees(point: Vector3) -> bool:
	if _forest == null:
		return true
	var positions = _forest.get("tree_positions")
	if positions == null:
		return true
	var clearance_squared := tree_clearance * tree_clearance
	for tree_position in positions:
		var dx := float(tree_position.x) - point.x
		var dz := float(tree_position.z) - point.z
		if dx * dx + dz * dz < clearance_squared:
			return false
	return true
