extends Node3D

const DEFAULT_GRASS_SCENE := preload("res://assets/environment/grass/source/Grass.fbx")

@export var target_count := 16000
@export var world_half_extent := 344.0
@export var start_clear_radius := 10.0
@export var document_clear_radius := 1.15
@export var trail_extra_clearance := 0.38
@export var terrain_path: NodePath
@export var trail_path: NodePath
@export var grass_scene: PackedScene = DEFAULT_GRASS_SCENE
@export var min_scale := 0.58
@export var max_scale := 1.05

var _terrain: Node
var _trails: Node
var _document_positions: Array[Vector3] = []

func _ready() -> void:
	_terrain = get_node_or_null(terrain_path)
	_trails = get_node_or_null(trail_path)
	if _terrain == null and get_parent() != null:
		_terrain = get_parent().get_node_or_null("Terrain")
	if _trails == null and get_parent() != null:
		_trails = get_parent().get_node_or_null("TrailNetwork")
	call_deferred("build_grass")

func build_grass() -> void:
	for child: Node in get_children():
		child.queue_free()
	_document_positions = _collect_document_positions()
	var variants := _resolve_grass_variants()
	if variants.is_empty():
		push_warning("Fallen Forest: canonical grass FBX produced no usable mesh variants.")
		return

	var weights: Array[float] = []
	var weight_sum := 0.0
	for variant: Dictionary in variants:
		var name := str(variant.get("name", "")).to_lower()
		var weight := 0.10 if "lawn" in name else 1.0
		weights.append(weight)
		weight_sum += weight

	var rng := RandomNumberGenerator.new()
	rng.seed = int(GameState.run_seed) ^ 0x67A55
	var remaining := target_count
	for index in variants.size():
		var variant: Dictionary = variants[index]
		var count := remaining if index == variants.size() - 1 else int(round(float(target_count) * weights[index] / weight_sum))
		count = mini(count, remaining)
		remaining -= count
		_build_variant_multimesh(variant, count, rng, index)

	print("Fallen Forest: %d canonical grass instances generated across %d MultiMeshes." % [target_count - remaining, variants.size()])

func _build_variant_multimesh(variant: Dictionary, requested_count: int, rng: RandomNumberGenerator, variant_index: int) -> void:
	if requested_count <= 0:
		return
	var mesh: Mesh = variant.mesh
	var source_transform: Transform3D = variant.transform
	# Remove pack-layout X/Z offsets while preserving import scale/orientation and ground offset.
	source_transform.origin.x = 0.0
	source_transform.origin.z = 0.0

	var mm := MultiMesh.new()
	mm.transform_format = MultiMesh.TRANSFORM_3D
	mm.instance_count = requested_count
	mm.mesh = mesh

	var placed := 0
	var attempts := 0
	while placed < requested_count and attempts < requested_count * 10:
		attempts += 1
		var x := rng.randf_range(-world_half_extent, world_half_extent)
		var z := rng.randf_range(-world_half_extent, world_half_extent)
		if Vector2(x, z).length() < start_clear_radius:
			continue
		if _near_document(x, z):
			continue
		if _trails != null and _trails.has_method("is_in_trail_clearance"):
			if bool(_trails.call("is_in_trail_clearance", x, z, trail_extra_clearance)):
				continue

		# Preserve uneven density instead of a uniform green carpet.
		var cluster := 0.5 + 0.5 * sin(x * 0.028 + sin(z * 0.017) * 2.1 + float(variant_index) * 0.7)
		if rng.randf() > lerpf(0.34, 0.96, cluster):
			continue

		var ground_y := 0.0
		if _terrain != null and _terrain.has_method("sample_height"):
			ground_y = float(_terrain.call("sample_height", x, z))
		var uniform_scale := rng.randf_range(min_scale, max_scale)
		var basis := Basis(Vector3.UP, rng.randf_range(0.0, TAU))
		basis = basis.scaled(Vector3(uniform_scale, rng.randf_range(0.90, 1.10) * uniform_scale, uniform_scale))
		var placement := Transform3D(basis, Vector3(x, ground_y, z))
		mm.set_instance_transform(placed, placement * source_transform)
		placed += 1

	mm.instance_count = placed
	var instance := MultiMeshInstance3D.new()
	instance.name = "GrassVariant_%02d_%s" % [variant_index, str(variant.get("name", "Mesh"))]
	instance.multimesh = mm
	add_child(instance)

func _collect_document_positions() -> Array[Vector3]:
	var result: Array[Vector3] = []
	if get_parent() == null:
		return result
	var system := get_parent().get_node_or_null("DocumentSystem")
	if system == null:
		return result
	for child: Node in system.get_children():
		if child is Node3D:
			result.append((child as Node3D).global_position)
	return result

func _near_document(x: float, z: float) -> bool:
	for position: Vector3 in _document_positions:
		if Vector2(position.x - x, position.z - z).length_squared() < document_clear_radius * document_clear_radius:
			return true
	return false

func _resolve_grass_variants() -> Array[Dictionary]:
	var result: Array[Dictionary] = []
	if grass_scene == null:
		return result
	var root := grass_scene.instantiate()
	_collect_meshes(root, Transform3D.IDENTITY, result)
	root.free()
	return result

func _collect_meshes(node: Node, parent_transform: Transform3D, result: Array[Dictionary]) -> void:
	var current := parent_transform
	if node is Node3D:
		current = parent_transform * (node as Node3D).transform
	if node is MeshInstance3D:
		var mesh_instance := node as MeshInstance3D
		if mesh_instance.mesh != null:
			result.append({
				"name": str(mesh_instance.name),
				"mesh": mesh_instance.mesh,
				"transform": current,
			})
	for child: Node in node.get_children():
		_collect_meshes(child, current, result)
