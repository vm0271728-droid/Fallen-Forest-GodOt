extends Node3D

@export var spawn_chance := 0.45
@export var minimum_count := 4
@export var maximum_count := 6
@export var visible_distance := 12.5
@export var minimum_height := 0.18
@export var maximum_height := 0.48
@export var minimum_radius := 0.10
@export var maximum_radius := 0.34
@export var drift_speed := 0.44
@export var vertical_bob := 0.032

var _slot := -1
var _active := false
var _time := 0.0
var _fireflies: Array[MeshInstance3D] = []
var _phases: PackedFloat32Array = []
var _radii: PackedFloat32Array = []
var _speeds: PackedFloat32Array = []
var _heights: PackedFloat32Array = []

func configure(slot: int) -> void:
	_slot = slot
	_build_if_selected()

func _process(delta: float) -> void:
	if not _active:
		return
	var camera := get_viewport().get_camera_3d()
	if camera != null:
		var distance_squared := global_position.distance_squared_to(camera.global_position)
		visible = distance_squared <= visible_distance * visible_distance
		if not visible:
			return

	_time += delta
	for i in _fireflies.size():
		var angle := _phases[i] + _time * _speeds[i] * drift_speed
		var radius := _radii[i] * (0.86 + sin(_time * 0.73 + _phases[i]) * 0.14)
		var x := cos(angle) * radius + sin(_time * 0.41 + _phases[i] * 1.7) * 0.035
		var z := sin(angle) * radius + cos(_time * 0.36 + _phases[i] * 1.3) * 0.035
		var y := _heights[i] + sin(_time * (0.9 + _speeds[i] * 0.21) + _phases[i]) * vertical_bob
		_fireflies[i].position = Vector3(x, y, z)

func _build_if_selected() -> void:
	if _slot < 0 or _active:
		return
	var rng := RandomNumberGenerator.new()
	rng.seed = int(GameState.run_seed) ^ (_slot * 0x45D9F3B) ^ 0xF17EF1
	if rng.randf() >= spawn_chance:
		return

	_active = true
	var count := rng.randi_range(minimum_count, maximum_count)
	var shared_mesh := SphereMesh.new()
	shared_mesh.radius = 0.010
	shared_mesh.height = 0.020
	shared_mesh.radial_segments = 6
	shared_mesh.rings = 3

	var material := StandardMaterial3D.new()
	material.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	material.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	material.albedo_color = Color(0.78, 0.67, 0.37, 0.48)
	material.emission_enabled = true
	material.emission = Color(0.76, 0.61, 0.28, 1.0)
	material.emission_energy_multiplier = 0.55
	shared_mesh.material = material

	for i in count:
		var firefly := MeshInstance3D.new()
		firefly.name = "Firefly_%02d" % i
		firefly.mesh = shared_mesh
		firefly.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		add_child(firefly)
		_fireflies.append(firefly)
		_phases.append(rng.randf_range(0.0, TAU))
		_radii.append(rng.randf_range(minimum_radius, maximum_radius))
		_speeds.append(rng.randf_range(0.72, 1.24))
		_heights.append(rng.randf_range(minimum_height, maximum_height))

	# Deliberately no PointLight3D: these are mood cues, not quest beacons.
