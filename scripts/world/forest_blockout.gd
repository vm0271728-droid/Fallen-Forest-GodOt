extends Node3D

const SPRUCE_PATH := "res://assets/environment/trees/black_spruce/zzz_LODs/LOD2/Picea mariana HD_Arctic mat 100_LOD2.fbx"
const DEAD_FIR_VARIANT_PATHS := [
	"res://assets/environment/trees/dead_firs/variants/fir_1.obj",
	"res://assets/environment/trees/dead_firs/variants/fir_2.obj",
	"res://assets/environment/trees/dead_firs/variants/fir_3.obj",
	"res://assets/environment/trees/dead_firs/variants/fir_4.obj",
]
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
	variants.append_array(_load_simple_variants(SPRUCE_PATH, "spruce"))
	for dead_path: String in DEAD_FIR_VARIANT_PATHS:
		variants.append_array(_load_simple_variants(dead_path, "dead_fir"))
	if ResourceLoader.exists(LOW_POLY_PATH):
		variants.append_array(_load_low_poly_variants(LOW_POLY_PATH))

	if variants.is_empty():
		push_error("Fallen Forest: no canonical tree variants could be imported.")
		return

	var pack_counts: Dictionary = _count_variants_by_pack(variants)
	var pack_weights: Dictionary = _effective_pack_weights(pack_counts)
	var transforms_by_variant: Array = []
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
		var candidate_indices: Array[int] = _indices_for_pack(variants, pack)
		if candidate_indices.is_empty():
			continue
		var variant_index := candidate_indices[rng.randi_range(0, candidate_indices.size() - 1)]
		var variant: Dictionary = variants[variant_index]

		var ground_y := 0.0
		if _terrain != null and _terrain.has_method("sample_height"):
			ground_y = float(_terrain.call("sample_height", x, z))

		var desired_height := _desired_height_for_pack(pack, rng)
		var source_height := maxf(0.2, float(variant["height"]))
		var uniform_scale := desired_height / source_height
		var horizontal_scale := uniform_scale * rng.randf_range(0.92, 1.08)
		var vertical_scale := uniform_scale * rng.randf_range(0.96, 1.05)
		var placement_basis := Basis(Vector3.UP, rng.randf_range(0.0, TAU))
		placement_basis = placement_basis.scaled(Vector3(horizontal_scale, vertical_scale, horizontal_scale))
		var placement := Transform3D(placement_basis, Vector3(x, ground_y, z))
		transforms_by_variant[variant_index].append(placement)
		tree_positions.append(Vector3(x, ground_y, z))
		placed += 1

	for variant_index in variants.size():
		var placements: Array = transforms_by_variant[variant_index]
		if placements.is_empty():
			continue
		var variant: Dictionary = variants[variant_index]
		var components: Array = variant["components"]
		for component_index in components.size():
			var component: Dictionary = components[component_index]
			var mm := MultiMesh.new()
			mm.transform_format = MultiMesh.TRANSFORM_3D
			mm.instance_count = placements.size()
			mm.mesh = component["mesh"] as Mesh
			var component_transform: Transform3D = component["transform"]
			for transform_index in placements.size():
				var placement: Transform3D = placements[transform_index]
				mm.set_instance_transform(transform_index, placement * component_transform)
			var instance := MultiMeshInstance3D.new()
			instance.name = "Trees_%s_%s_C%02d" % [str(variant["pack"]), _safe_name(str(variant["name"])), component_index]
			instance.multimesh = mm
			add_child(instance)

	print("Fallen Forest: %d trees generated from %d canonical logical variants (%s)." % [placed, variants.size(), _pack_summary(variants, transforms_by_variant)])

func _load_simple_variants(path: String, pack: String) -> Array[Dictionary]:
	var result: Array[Dictionary] = []
	if not ResourceLoader.exists(path):
		return result
	var resource := ResourceLoader.load(path)
	if resource is PackedScene:
		var root := (resource as PackedScene).instantiate()
		var components: Array[Dictionary] = []
		_collect_components(root, Transform3D.IDENTITY, components, false)
		root.free()
		for component: Dictionary in components:
			var component_list: Array = [component]
			result.append(_make_variant(pack, str(component["name"]), component_list))
	elif resource is Mesh:
		var mesh := resource as Mesh
		var component: Dictionary = {
			"name": path.get_file().get_basename(),
			"mesh": mesh,
			"source_transform": Transform3D.IDENTITY,
		}
		var component_list: Array = [component]
		result.append(_make_variant(pack, path.get_file().get_basename(), component_list))
	return result

func _load_low_poly_variants(path: String) -> Array[Dictionary]:
	var result: Array[Dictionary] = []
	var resource := ResourceLoader.load(path)
	if not resource is PackedScene:
		return result
	var root := (resource as PackedScene).instantiate()
	var raw: Array[Dictionary] = []
	_collect_components(root, Transform3D.IDENTITY, raw, true)
	root.free()

	var trunks: Array[Dictionary] = []
	var branches: Array[Dictionary] = []
	var standalones: Array[Dictionary] = []
	for component: Dictionary in raw:
		var lower := str(component["name"]).to_lower()
		if lower.begins_with("background_tree_atlas"):
			standalones.append(component)
		elif "trunk" in lower:
			trunks.append(component)
		elif "branch" in lower:
			branches.append(component)

	for standalone: Dictionary in standalones:
		var component_list: Array = [standalone]
		result.append(_make_variant("low_poly", str(standalone["name"]), component_list))

	var used_branches: Dictionary = {}
	for trunk: Dictionary in trunks:
		var trunk_center: Vector3 = _component_world_center(trunk)
		var best_index := -1
		var best_distance := INF
		for branch_index in branches.size():
			if used_branches.has(branch_index):
				continue
			var branch_center: Vector3 = _component_world_center(branches[branch_index])
			var flat_distance := Vector2(trunk_center.x - branch_center.x, trunk_center.z - branch_center.z).length()
			if flat_distance < best_distance:
				best_distance = flat_distance
				best_index = branch_index
		if best_index >= 0 and best_distance <= 5.5:
			used_branches[best_index] = true
			var pair: Array = [trunk, branches[best_index]]
			result.append(_make_variant("low_poly", "%s+%s" % [trunk["name"], branches[best_index]["name"]], pair))
		else:
			push_warning("Fallen Forest: low-poly trunk `%s` had no nearby branch mesh; excluded." % trunk["name"])

	print("Fallen Forest low-poly tree pack: %d background trees + %d trunk/branch trees; rocks and other vegetation excluded." % [standalones.size(), result.size() - standalones.size()])
	return result

func _collect_components(node: Node, parent_transform: Transform3D, result: Array[Dictionary], low_poly_filter: bool) -> void:
	var current := parent_transform
	if node is Node3D:
		current = parent_transform * (node as Node3D).transform
	if node is MeshInstance3D:
		var mesh_instance := node as MeshInstance3D
		if mesh_instance.mesh != null:
			var name := str(mesh_instance.name)
			if not low_poly_filter or _low_poly_component_allowed(name):
				result.append({
					"name": name,
					"mesh": mesh_instance.mesh,
					"source_transform": current,
				})
	for child: Node in node.get_children():
		_collect_components(child, current, result, low_poly_filter)

func _low_poly_component_allowed(mesh_name: String) -> bool:
	var name := mesh_name.to_lower()
	for excluded: String in ["grass", "bush", "shrub", "rock", "ground", "fern", "plant", "weed"]:
		if excluded in name:
			return false
	return name.begins_with("background_tree_atlas") or "trunk" in name or "branch" in name

func _make_variant(pack: String, name: String, source_components: Array) -> Dictionary:
	var bounds: Dictionary = _components_bounds(source_components)
	var min_v: Vector3 = bounds["min"]
	var max_v: Vector3 = bounds["max"]
	var anchor := Vector3((min_v.x + max_v.x) * 0.5, min_v.y, (min_v.z + max_v.z) * 0.5)
	var normalized_components: Array = []
	for source_variant in source_components:
		var source_component: Dictionary = source_variant
		var source_transform: Transform3D = source_component["source_transform"]
		normalized_components.append({
			"name": source_component["name"],
			"mesh": source_component["mesh"],
			"transform": Transform3D(source_transform.basis, source_transform.origin - anchor),
		})
	return {
		"pack": pack,
		"name": name,
		"components": normalized_components,
		"height": maxf(0.01, max_v.y - min_v.y),
	}

func _components_bounds(source_components: Array) -> Dictionary:
	var min_v := Vector3(INF, INF, INF)
	var max_v := Vector3(-INF, -INF, -INF)
	for source_variant in source_components:
		var component: Dictionary = source_variant
		var mesh := component["mesh"] as Mesh
		var source_transform: Transform3D = component["source_transform"]
		for corner: Vector3 in _aabb_corners(mesh.get_aabb()):
			var p := source_transform * corner
			min_v = Vector3(minf(min_v.x, p.x), minf(min_v.y, p.y), minf(min_v.z, p.z))
			max_v = Vector3(maxf(max_v.x, p.x), maxf(max_v.y, p.y), maxf(max_v.z, p.z))
	return {"min": min_v, "max": max_v}

func _component_world_center(component: Dictionary) -> Vector3:
	var mesh := component["mesh"] as Mesh
	var source_transform: Transform3D = component["source_transform"]
	var aabb := mesh.get_aabb()
	return source_transform * (aabb.position + aabb.size * 0.5)

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
		var pack := str(variant["pack"])
		counts[pack] = int(counts.get(pack, 0)) + 1
	return counts

func _effective_pack_weights(counts: Dictionary) -> Dictionary:
	var raw := {
		"spruce": spruce_weight if int(counts.get("spruce", 0)) > 0 else 0.0,
		"dead_fir": dead_fir_weight if int(counts.get("dead_fir", 0)) > 0 else 0.0,
		"low_poly": low_poly_weight if int(counts.get("low_poly", 0)) > 0 else 0.0,
	}
	var total := float(raw["spruce"]) + float(raw["dead_fir"]) + float(raw["low_poly"])
	if total <= 0.0:
		return {"spruce": 1.0, "dead_fir": 0.0, "low_poly": 0.0}
	return {
		"spruce": float(raw["spruce"]) / total,
		"dead_fir": float(raw["dead_fir"]) / total,
		"low_poly": float(raw["low_poly"]) / total,
	}

func _choose_pack(rng: RandomNumberGenerator, weights: Dictionary) -> String:
	var roll := rng.randf()
	if roll < float(weights["spruce"]):
		return "spruce"
	if roll < float(weights["spruce"]) + float(weights["dead_fir"]):
		return "dead_fir"
	return "low_poly"

func _indices_for_pack(variants: Array[Dictionary], pack: String) -> Array[int]:
	var result: Array[int] = []
	for i in variants.size():
		if str(variants[i]["pack"]) == pack:
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
	return value.replace(" ", "_").replace("/", "_").replace("\\", "_").replace("+", "_")

func _pack_summary(variants: Array[Dictionary], transforms_by_variant: Array) -> String:
	var counts := {"spruce": 0, "dead_fir": 0, "low_poly": 0}
	for i in variants.size():
		var pack := str(variants[i]["pack"])
		counts[pack] = int(counts.get(pack, 0)) + transforms_by_variant[i].size()
	return "spruce=%d dead_fir=%d low_poly=%d" % [counts["spruce"], counts["dead_fir"], counts["low_poly"]]

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
