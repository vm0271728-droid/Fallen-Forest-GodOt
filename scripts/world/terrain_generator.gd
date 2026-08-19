extends StaticBody3D

@export var world_size := 720.0
@export var resolution := 129
@export var broad_amplitude := 7.5
@export var medium_amplitude := 3.2
@export var fine_amplitude := 0.8
@export var depression_strength := 2.4
@export var start_flatten_radius := 8.0
@export var start_blend_width := 6.0

@onready var mesh_instance: MeshInstance3D = $MeshInstance3D
@onready var collision: CollisionShape3D = $CollisionShape3D

var _heights := PackedFloat32Array()
var _cell_size := 1.0
var generated := false

func _ready() -> void:
	generate()

func generate() -> void:
	resolution = maxi(33, resolution)
	_cell_size = world_size / float(resolution - 1)
	_heights.resize(resolution * resolution)

	var base_seed := GameState.run_seed if GameState.run_seed != 0 else 228117
	var broad := _make_noise(base_seed ^ 0x1731, 0.0030, 3)
	var medium := _make_noise(base_seed ^ 0x2A91, 0.0105, 2)
	var fine := _make_noise(base_seed ^ 0x31F7, 0.0340, 2)
	var depressions := _make_noise(base_seed ^ 0x52D3, 0.0068, 2)

	for z in resolution:
		for x in resolution:
			var wx := (float(x) / float(resolution - 1) - 0.5) * world_size
			var wz := (float(z) / float(resolution - 1) - 0.5) * world_size
			var h := broad.get_noise_2d(wx, wz) * broad_amplitude
			h += medium.get_noise_2d(wx, wz) * medium_amplitude
			h += fine.get_noise_2d(wx, wz) * fine_amplitude
			var d := maxf(0.0, (depressions.get_noise_2d(wx, wz) - 0.28) / 0.72)
			h -= d * d * depression_strength
			_heights[z * resolution + x] = h

	var centre := _heights[(resolution / 2) * resolution + (resolution / 2)]
	var outer := start_flatten_radius + start_blend_width
	for z in resolution:
		for x in resolution:
			var wx := (float(x) / float(resolution - 1) - 0.5) * world_size
			var wz := (float(z) / float(resolution - 1) - 0.5) * world_size
			var distance := Vector2(wx, wz).length()
			if distance >= outer:
				continue
			var keep_relief := 0.0 if distance <= start_flatten_radius else smoothstep(start_flatten_radius, outer, distance)
			var index := z * resolution + x
			_heights[index] = lerpf(centre, _heights[index], keep_relief)

	_build_mesh()
	_build_collision()
	generated = true
	print("Fallen Forest terrain: %dx%d heightfield generated across %.0fm." % [resolution, resolution, world_size])

func _make_noise(seed_value: int, frequency: float, octaves: int) -> FastNoiseLite:
	var noise := FastNoiseLite.new()
	noise.seed = seed_value
	noise.noise_type = FastNoiseLite.TYPE_PERLIN
	noise.frequency = frequency
	noise.fractal_type = FastNoiseLite.FRACTAL_FBM
	noise.fractal_octaves = octaves
	noise.fractal_gain = 0.5
	noise.fractal_lacunarity = 2.03
	return noise

func _build_mesh() -> void:
	var vertices := PackedVector3Array()
	var normals := PackedVector3Array()
	var uvs := PackedVector2Array()
	var indices := PackedInt32Array()
	vertices.resize(resolution * resolution)
	normals.resize(resolution * resolution)
	uvs.resize(resolution * resolution)

	for z in resolution:
		for x in resolution:
			var index := z * resolution + x
			var wx := (float(x) / float(resolution - 1) - 0.5) * world_size
			var wz := (float(z) / float(resolution - 1) - 0.5) * world_size
			vertices[index] = Vector3(wx, _heights[index], wz)
			uvs[index] = Vector2(float(x) / float(resolution - 1), float(z) / float(resolution - 1)) * 24.0

	for z in resolution:
		for x in resolution:
			var hl := _height_index(maxi(0, x - 1), z)
			var hr := _height_index(mini(resolution - 1, x + 1), z)
			var hb := _height_index(x, maxi(0, z - 1))
			var hf := _height_index(x, mini(resolution - 1, z + 1))
			normals[z * resolution + x] = Vector3(hl - hr, _cell_size * 2.0, hb - hf).normalized()

	for z in resolution - 1:
		for x in resolution - 1:
			var i := z * resolution + x
			indices.append(i)
			indices.append(i + resolution)
			indices.append(i + 1)
			indices.append(i + 1)
			indices.append(i + resolution)
			indices.append(i + resolution + 1)

	var arrays := []
	arrays.resize(Mesh.ARRAY_MAX)
	arrays[Mesh.ARRAY_VERTEX] = vertices
	arrays[Mesh.ARRAY_NORMAL] = normals
	arrays[Mesh.ARRAY_TEX_UV] = uvs
	arrays[Mesh.ARRAY_INDEX] = indices
	var terrain_mesh := ArrayMesh.new()
	terrain_mesh.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, arrays)

	var material := StandardMaterial3D.new()
	material.albedo_color = Color(0.018, 0.031, 0.018, 1.0)
	material.roughness = 1.0
	terrain_mesh.surface_set_material(0, material)
	mesh_instance.mesh = terrain_mesh

func _build_collision() -> void:
	var shape := HeightMapShape3D.new()
	shape.map_width = resolution
	shape.map_depth = resolution
	shape.map_data = _heights
	collision.shape = shape
	collision.scale = Vector3(_cell_size, 1.0, _cell_size)

func _height_index(x: int, z: int) -> float:
	return _heights[z * resolution + x]

func sample_height(world_x: float, world_z: float) -> float:
	if _heights.is_empty():
		return 0.0
	var fx := clampf((world_x / world_size + 0.5) * float(resolution - 1), 0.0, float(resolution - 1))
	var fz := clampf((world_z / world_size + 0.5) * float(resolution - 1), 0.0, float(resolution - 1))
	var x0 := int(floor(fx))
	var z0 := int(floor(fz))
	var x1 := mini(resolution - 1, x0 + 1)
	var z1 := mini(resolution - 1, z0 + 1)
	var tx := fx - float(x0)
	var tz := fz - float(z0)
	var a := lerpf(_height_index(x0, z0), _height_index(x1, z0), tx)
	var b := lerpf(_height_index(x0, z1), _height_index(x1, z1), tx)
	return lerpf(a, b, tz)

func sample_normal(world_x: float, world_z: float) -> Vector3:
	var step := maxf(_cell_size, 0.5)
	var left := sample_height(world_x - step, world_z)
	var right := sample_height(world_x + step, world_z)
	var back := sample_height(world_x, world_z - step)
	var front := sample_height(world_x, world_z + step)
	return Vector3(left - right, step * 2.0, back - front).normalized()
