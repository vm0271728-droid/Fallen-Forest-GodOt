extends Node3D

@export var terrain_path: NodePath
@export var trail_count := 4
@export var samples_per_trail := 30
@export var minimum_width := 1.55
@export var maximum_width := 2.35
@export var world_half_extent := 326.0

var _terrain: Node
var _paths: Array[PackedVector3Array] = []
var _widths: Array[float] = []

func _ready() -> void:
	_terrain = get_node_or_null(terrain_path)
	if _terrain == null and get_parent() != null:
		_terrain = get_parent().get_node_or_null("Terrain")
	generate_trails()

func generate_trails() -> void:
	_paths.clear()
	_widths.clear()
	var rng := RandomNumberGenerator.new()
	rng.seed = int(GameState.run_seed) ^ 0x7A11C0DE

	for index in trail_count:
		var side := index % 4
		var opposite := (side + 2) % 4
		var start := _edge_point(side, rng)
		var finish := _edge_point(opposite, rng)
		var line := finish - start
		var length := maxf(1.0, line.length())
		var normal := Vector2(-line.y, line.x) / length
		var bend := rng.randf_range(-58.0, 58.0)
		var secondary := rng.randf_range(10.0, 26.0)
		var phase := rng.randf_range(0.0, TAU)
		var points := PackedVector3Array()
		for sample in samples_per_trail:
			var t := float(sample) / float(maxi(1, samples_per_trail - 1))
			var flat := start.lerp(finish, t)
			flat += normal * sin(t * PI) * bend
			flat += normal * sin(t * TAU * 2.0 + phase) * secondary * sin(t * PI)
			var y := 0.035
			if _terrain != null and _terrain.has_method("sample_height"):
				y = float(_terrain.call("sample_height", flat.x, flat.y)) + 0.035
			points.append(Vector3(flat.x, y, flat.y))
		_paths.append(points)
		_widths.append(rng.randf_range(minimum_width, maximum_width))

	_build_mesh()
	print("Fallen Forest: %d terrain-following trails generated." % _paths.size())

func _edge_point(side: int, rng: RandomNumberGenerator) -> Vector2:
	var along := rng.randf_range(-world_half_extent * 0.78, world_half_extent * 0.78)
	match side:
		0:
			return Vector2(-world_half_extent, along)
		1:
			return Vector2(along, -world_half_extent)
		2:
			return Vector2(world_half_extent, along)
		_:
			return Vector2(along, world_half_extent)

func _build_mesh() -> void:
	var vertices := PackedVector3Array()
	var normals := PackedVector3Array()
	var uvs := PackedVector2Array()
	var indices := PackedInt32Array()

	for path_index in _paths.size():
		var path: PackedVector3Array = _paths[path_index]
		if path.size() < 2:
			continue
		var width := _widths[path_index]
		var base_index := vertices.size()
		for i in path.size():
			var previous := path[maxi(0, i - 1)]
			var next := path[mini(path.size() - 1, i + 1)]
			var tangent := Vector2(next.x - previous.x, next.z - previous.z).normalized()
			var side := Vector2(-tangent.y, tangent.x) * width * 0.5
			vertices.append(path[i] + Vector3(side.x, 0.0, side.y))
			vertices.append(path[i] - Vector3(side.x, 0.0, side.y))
			normals.append(Vector3.UP)
			normals.append(Vector3.UP)
			var v := float(i) * 0.32
			uvs.append(Vector2(0.0, v))
			uvs.append(Vector2(1.0, v))

		for i in path.size() - 1:
			var a := base_index + i * 2
			indices.append(a)
			indices.append(a + 2)
			indices.append(a + 1)
			indices.append(a + 1)
			indices.append(a + 2)
			indices.append(a + 3)

	var arrays := []
	arrays.resize(Mesh.ARRAY_MAX)
	arrays[Mesh.ARRAY_VERTEX] = vertices
	arrays[Mesh.ARRAY_NORMAL] = normals
	arrays[Mesh.ARRAY_TEX_UV] = uvs
	arrays[Mesh.ARRAY_INDEX] = indices
	var mesh := ArrayMesh.new()
	mesh.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, arrays)
	var material := StandardMaterial3D.new()
	material.albedo_color = Color(0.065, 0.052, 0.038, 1.0)
	material.roughness = 1.0
	mesh.surface_set_material(0, material)

	var instance := get_node_or_null("TrailMesh") as MeshInstance3D
	if instance == null:
		instance = MeshInstance3D.new()
		instance.name = "TrailMesh"
		add_child(instance)
	instance.mesh = mesh

func distance_to_nearest_trail(x: float, z: float) -> float:
	var point := Vector2(x, z)
	var best := INF
	for path: PackedVector3Array in _paths:
		for i in path.size() - 1:
			var a := Vector2(path[i].x, path[i].z)
			var b := Vector2(path[i + 1].x, path[i + 1].z)
			best = minf(best, _distance_to_segment(point, a, b))
	return best

func is_in_trail_clearance(x: float, z: float, extra_clearance := 0.0) -> bool:
	var point := Vector2(x, z)
	for path_index in _paths.size():
		var path: PackedVector3Array = _paths[path_index]
		var radius := _widths[path_index] * 0.5 + extra_clearance
		for i in path.size() - 1:
			var a := Vector2(path[i].x, path[i].z)
			var b := Vector2(path[i + 1].x, path[i + 1].z)
			if _distance_to_segment(point, a, b) <= radius:
				return true
	return false

func _distance_to_segment(point: Vector2, a: Vector2, b: Vector2) -> float:
	var segment := b - a
	var length_squared := segment.length_squared()
	if length_squared <= 0.000001:
		return point.distance_to(a)
	var t := clampf((point - a).dot(segment) / length_squared, 0.0, 1.0)
	return point.distance_to(a + segment * t)
