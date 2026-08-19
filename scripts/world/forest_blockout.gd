extends Node3D

const SPRUCE_PATH := "res://assets/environment/trees/black_spruce/zzz_LODs/LOD2/Picea mariana HD_Arctic mat 100_LOD2.fbx"
const DEAD_FIRS_PATH := "res://assets/environment/trees/dead_firs/firs.obj"
const LOW_POLY_PATH := "res://assets/environment/trees/low_poly_pack/source/Tree_Pack.fbx"

@export var tree_count := 3250
@export var world_half_extent := 345.0
@export var start_clear_radius := 18.0
@export var trail_extra_clearance := 0.95
@export var terrain_path: NodePath
@export var trail_path: NodePath
@export_range(0.0, 1.0, 0.01) var spruce_weight := 0.68
@export_range(0.0, 1.0, 0.01) var dead_fir_weight := 0.14
@export_range(0.0, 1.0, 0.01) var low_poly_weight := 0.18

var tree_positions := PackedVector3Array()
var _terrain: Node
var _trails: Node

func _ready() -> void:
	_terrain = get_node_or_null(terrain_path)
	_trails = get_node_or_null(trail_path)
	if _terrain == null and get_parent() != null:
		_terrain = get_parent().get_node_or_null("Terrain")
	if _trails == null and get_parent() != null:
		_trails = get_parent().get_node_or_null("TrailNetwork")
	build_forest()

func build_forest() -> void:
	for child: Node in get_children():
		child.queue_free()
	tree_positions.clear()

	var variants: Array[Dictionary] = []
	variants.append_array(_load_pack_variants(SPRUCE_PATH, "spruce"))
	variants.append_array(_load_pack_variants(DEAD_FIRS_PATH, "dead_fir"))
	if ResourceLoader.exists(LOW_POLY_PATH):
		variants.append_array(_load_pack_variants(LOW_POLY_PATH, "low_poly"))

	if variants.is_empty():
		push_error("Fallen Forest: no canonical tree variants could be imported.")
		return

	var pack_counts := _count_variants_by_pack(variants)
	var pack_weights := _effective_pack_weights(pack_counts)
	var transforms_by_variant: Array[Array] = []
	transforms_by_variant.resize(variants.size())
	for i in variants.size():
		transforms_by_variant[i] = []

	var rng := RandomNumberGenerator.new()
	rng.seed = int(GameState.run_seed) ^ 0x1F0A57
	var placed := 0
	var attempts := 0
	while placed < tree_count and attempts < tree_count * 16:
		attempts += 1
		var x := rng.randf_range(-world_half_extent, world_half_extent)
		var z := rng.randf_range(-world_half_extent, world_half_extent)
		if Vector2(x, z).length() < start_clear_radius:
			continue
		if _trails != null and _trails.has_method("is_in_trail_clearance"):
			if bool(_trails.call("is_in_trail_clearance", x, z, trail_extra_clearance)):
				continue

		var density := 0.5 + 0.5 * sin(x * 0.021 + sin(z * 0.013) * 2.4)
		if rng.randf() > lerpf(0.35, 0.96, density):
			continue

		var pack := _choose_pack(rng, pack_weights)
		var candidate_indices := _indices_for_pack(variants, pack)
		if candidate_indices.is_empty():
			continue
		var variant_index := candidate_indices[rng.randi_range(0, candidate_indices.size() - 1)]
		var variant: Dictionary = variants[variant_index]

		var ground_y := 0.0
		if _terrain != null and _terrain.has_method("sample_height"):
			ground_y = float(_terrain.call("sample_height", x, z))

		var desired_height := _desired_height_for_pack(pack, rng)
		var source_height := maxf(0.2, float(variant.get("height", 5.0)))
		var uniform_scale := desired_height / source_height
		var horizontal_scale := uniform_scale * rng.randf_range(0.92, 1.08)
		var vertical_scale := uniform_scale * rng.randf_range(0.96, 1.05)
		var placement_basis := Basis(Vector3.UP, rng.randf_range(0.0, TAU))
		placement_basis = placement_basis.scaled(Vector3(horizontal_scale, vertical_scale, horizontal_scale))
		var placement := Transform3D(placement_basis, Vector3(x, ground_y, z))
		var source_transform: Transform3D = variant.transform
		transforms_by_variant[variant_index].append(placement * source_transform)
		tree_positions.append(Vector3(x, ground_y, z))
		placed += 1

	for index in variants.size():
		var transforms: Array = transforms_by_variant[index]
		if transforms.is_empty():
			continue
		var variant: Dictionary = variants[index]
		var mm := MultiMesh.new()
		mm.transform_format = MultiMesh.TRANSFORM_3D
		mm.instance_count = transforms.size()
		mm.mesh = variant.mesh
		for transform_index in transforms.size():
			mm.set_instance_transform(transform_index, transforms[transform_index])
		var instance := MultiMeshInstance3D.new()
		instance.name = "Trees_%s_%s" % [str(variant.pack), _safe_name(str(variant.name))]
		instance.multimesh = mm
		add_child(instance)

	print("Fallen Forest: %d trees generated from %d canonical variants (%s)." % [placed, variants.size(), _pack_summary(variants, transforms_by_variant)])

func _load_pack_variants(path: String, pack: String) -> Array[Dictionary]:
	var result: Array[Dictionary] = []
	if not ResourceLoader.exists(path):
		return result
	var resource := ResourceLoader.load(path)
	if not resource is PackedScene:
		return result
	var root := (resource as PackedScene).instantiate()
	_collect_pack_meshes(root, Transform3D.IDENTITY, pack, result)
	root.free()
	return result

func _collect_pack_meshes(node: Node, parent_transform: Transform3D, pack: String, result: Array[Dictionary]) -> void:
	var current := parent_transform
	if node is Node3D:
		current = parent_transform * (node as Node3D).transform

	if node is MeshInstance3D:
		var mesh_instance := node as MeshInstance3D
		if mesh_instance.mesh != null and _mesh_allowed(pack, str(mesh_instance.name)):
			var normalized := _normalized_source_transform(mesh_instance.mesh, current)
			result.append({
				"pack": pack,
				"name": str(mesh_instance.name),
				"mesh": mesh_instance.mesh,
				"transform": normalized.transform,
				"height": normalized.height,
			})

	for child: Node in node.get_children():
		_collect_pack_meshes(child, current, pack, result)

func _mesh_allowed(pack: String, mesh_name: String) -> bool:
	if pack != "low_poly":
		return true
	var name := mesh_name.to_lower()
	for excluded: String in ["grass", "bush", "shrub", "rock", "ground", "fern", "plant", "weed"]:
		if excluded in name:
			return false
	for included: String in ["tree", "fir", "pine", "spruce", "trunk", "branch"]:
		if included in name:
			return true
	# Conservative rule: unknown low-poly objects are excluded until inspected.
	return false

func _normalized_source_transform(mesh: Mesh, source_transform: Transform3D) -> Dictionary:
	var aabb := mesh.get_aabb()
	var min_v := Vector3(INF, INF, INF)
	var max_v := Vector3(-INF, -INF, -INF)
	for corner: Vector3 in _aabb_corners(aabb):
		var p := source_transform * corner
		min_v = Vector3(minf(min_v.x, p.x), minf(min_v.y, p.y), minf(min_v.z, p.z))
		max_v = Vector3(maxf(max_v.x, p.x), maxf(max_v.y, p.y), maxf(max_v.z, p.z))
	var anchor := Vector3((min_v.x + max_v.x) * 0.5, min_v.y, (min_v.z + max_v.z) * 0.5)
	var normalized := Transform3D(source_transform.basis, source_transform.origin - anchor)
	return {"transform": normalized, "height": maxf(0.01, max_v.y - min_v.y)}

func _aabb_corners(aabb: AABB) -> Array[Vector3]:
	return [
		aabb.position,
		aabb.position + Vector3(aabb.size.x, 0, 0),
		aabb.position + Vector3(0, aabb.size.y, 0),
		aabb.position + Vector3(0, 0, aabb.size.z),
		aabb.position + Vector3(aabb.size.x, aabb.size.y, 0),
		aabb.position + Vector3(aabb.size.x, 0, aabb.size.z),
		aabb.position + Vector3(0, aabb.size.y, aabb.size.z),
		aabb.position + aabb.size,
	]

func _count_variants_by_pack(variants: Array[Dictionary]) -> Dictionary:
	var counts := {"spruce": 0, "dead_fir": 0, "low_poly": 0}
	for variant: Dictionary in variants:
		var pack := str(variant.pack)
		counts[pack] = int(counts.get(pack, 0)) + 1
	return counts

func _effective_pack_weights(counts: Dictionary) -> Dictionary:
	var raw := {
		"spruce": spruce_weight if int(counts.get("spruce", 0)) > 0 else 0.0,
		"dead_fir": dead_fir_weight if int(counts.get("dead_fir", 0)) > 0 else 0.0,
		"low_poly": low_poly_weight if int(counts.get("low_poly", 0)) > 0 else 0.0,
	}
	var total := float(raw.spruce) + float(raw.dead_fir) + float(raw.low_poly)
	if total <= 0.0:
		return {"spruce": 1.0, "dead_fir": 0.0, "low_poly": 0.0}
	return {
		"spruce": float(raw.spruce) / total,
		"dead_fir": float(raw.dead_fir) / total,
		"low_poly": float(raw.low_poly) / total,
	}

func _choose_pack(rng: RandomNumberGenerator, weights: Dictionary) -> String:
	var roll := rng.randf()
	if roll < float(weights.spruce):
		return "spruce"
	if roll < float(weights.spruce) + float(weights.dead_fir):
		return "dead_fir"
	return "low_poly"

func _indices_for_pack(variants: Array[Dictionary], pack: String) -> Array[int]:
	var result: Array[int] = []
	for i in variants.size():
		if str(variants[i].pack) == pack:
			result.append(i)
	return result

func _desired_height_for_pack(pack: String, rng: RandomNumberGenerator) -> float:
	match pack:
		"dead_fir":
			return rng.randf_range(7.3, 10.8)
		"low_poly":
			return rng.randf_range(5.6, 9.2)
		_:
			return rng.randf_range(6.2, 9.4)

func _safe_name(value: String) -> String:
	return value.replace(" ", "_").replace("/", "_").replace("\\", "_")

func _pack_summary(variants: Array[Dictionary], transforms_by_variant: Array[Array]) -> String:
	var counts := {"spruce": 0, "dead_fir": 0, "low_poly": 0}
	for i in variants.size():
		var pack := str(variants[i].pack)
		counts[pack] = int(counts.get(pack, 0)) + transforms_by_variant[i].size()
	return "spruce=%d dead_fir=%d low_poly=%d" % [counts.spruce, counts.dead_fir, counts.low_poly]

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
