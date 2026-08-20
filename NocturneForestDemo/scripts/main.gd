extends Node3D

const WORLD_SIZE := 150.0
const TREE_COUNT := 260
const ROCK_COUNT := 85
const GRASS_COUNT := 850

var rng := RandomNumberGenerator.new()
var player: CharacterBody3D
var neck: Node3D
var camera: Camera3D
var flashlight: SpotLight3D
var joystick: FloatingJoystick
var move_vec := Vector2.ZERO
var look_accum := Vector2.ZERO
var yaw := 0.0
var pitch := -0.02
var bob_time := 0.0
var base_fov := 74.0
var light_on := true
var velocity_smooth := Vector3.ZERO
var start_pos := Vector3(0, 1.0, 10.0)
var watcher: Node3D
var watcher_points := [Vector3(0,0,-26), Vector3(-22,0,-17), Vector3(24,0,-8), Vector3(-18,0,21), Vector3(27,0,25)]
var watcher_index := 0
var watcher_cooldown := 0.0

func _ready() -> void:
	rng.seed = 73317331
	_build_environment()
	_build_ground()
	_build_forest()
	_build_watcher()
	_build_player()
	_build_ui()
	if not OS.has_feature("mobile"):
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _build_environment() -> void:
	var world_env := WorldEnvironment.new()
	var env := Environment.new()
	env.background_mode = Environment.BG_COLOR
	env.background_color = Color(0.007, 0.011, 0.015)
	env.ambient_light_source = Environment.AMBIENT_SOURCE_COLOR
	env.ambient_light_color = Color(0.14, 0.18, 0.2)
	env.ambient_light_energy = 0.28
	env.reflected_light_source = Environment.REFLECTION_SOURCE_DISABLED
	env.fog_enabled = true
	env.fog_light_color = Color(0.17, 0.21, 0.22)
	env.fog_light_energy = 0.45
	env.fog_density = 0.028
	env.fog_height = 0.0
	env.fog_height_density = 0.085
	env.fog_aerial_perspective = 0.72
	env.tonemap_mode = Environment.TONE_MAPPER_FILMIC
	env.tonemap_exposure = 1.12
	world_env.environment = env
	add_child(world_env)

	var moon := DirectionalLight3D.new()
	moon.rotation_degrees = Vector3(-58.0, -34.0, 0.0)
	moon.light_color = Color(0.55, 0.67, 0.82)
	moon.light_energy = 0.46
	moon.shadow_enabled = true
	moon.directional_shadow_max_distance = 48.0
	add_child(moon)

func _build_ground() -> void:
	var body := StaticBody3D.new()
	body.name = "Ground"
	var mesh_instance := MeshInstance3D.new()
	var plane := PlaneMesh.new()
	plane.size = Vector2(WORLD_SIZE, WORLD_SIZE)
	plane.subdivide_width = 96
	plane.subdivide_depth = 96
	var mat := StandardMaterial3D.new()
	mat.albedo_color = Color(0.095, 0.115, 0.09)
	mat.roughness = 0.88
	mat.uv1_scale = Vector3(34.0, 34.0, 34.0)
	mat.metallic = 0.0
	plane.material = mat
	mesh_instance.mesh = plane
	body.add_child(mesh_instance)

	var col := CollisionShape3D.new()
	var shape := BoxShape3D.new()
	shape.size = Vector3(WORLD_SIZE, 0.35, WORLD_SIZE)
	col.shape = shape
	col.position.y = -0.2
	body.add_child(col)
	add_child(body)

	var puddles := MultiMeshInstance3D.new()
	var pm := PlaneMesh.new()
	pm.size = Vector2(1.8, 1.1)
	var pmat := StandardMaterial3D.new()
	pmat.albedo_color = Color(0.035, 0.055, 0.05, 0.88)
	pmat.roughness = 0.18
	pmat.metallic = 0.04
	pm.material = pmat
	var pmm := MultiMesh.new()
	pmm.transform_format = MultiMesh.TRANSFORM_3D
	pmm.mesh = pm
	pmm.instance_count = 52
	for i in range(pmm.instance_count):
		var p := _forest_position(7.0)
		p.y = 0.012
		var s := rng.randf_range(0.55, 2.5)
		var b := Basis(Vector3.UP, rng.randf_range(0.0, TAU)).scaled(Vector3(s, 1.0, rng.randf_range(0.5, 1.5) * s))
		pmm.set_instance_transform(i, Transform3D(b, p))
	puddles.multimesh = pmm
	add_child(puddles)

func _build_forest() -> void:
	_build_tree_layer()
	_build_rocks()
	_build_grass()
	_build_dead_branches()

func _build_tree_layer() -> void:
	var trunk_mesh := CylinderMesh.new()
	trunk_mesh.top_radius = 0.27
	trunk_mesh.bottom_radius = 0.42
	trunk_mesh.height = 7.2
	trunk_mesh.radial_segments = 10
	var trunk_mat := StandardMaterial3D.new()
	trunk_mat.albedo_color = Color(0.19, 0.15, 0.11)
	trunk_mat.roughness = 0.94
	trunk_mat.uv1_scale = Vector3(2.4, 4.5, 2.4)
	trunk_mesh.material = trunk_mat
	var trunk_mm := MultiMesh.new()
	trunk_mm.transform_format = MultiMesh.TRANSFORM_3D
	trunk_mm.mesh = trunk_mesh
	trunk_mm.instance_count = TREE_COUNT

	var crown_mesh := CylinderMesh.new()
	crown_mesh.top_radius = 0.08
	crown_mesh.bottom_radius = 2.35
	crown_mesh.height = 5.5
	crown_mesh.radial_segments = 10
	var crown_mat := StandardMaterial3D.new()
	crown_mat.albedo_color = Color(0.035, 0.085, 0.04)
	crown_mat.roughness = 0.92
	crown_mat.uv1_scale = Vector3(3.0, 3.0, 3.0)
	crown_mesh.material = crown_mat
	var crown_mm := MultiMesh.new()
	crown_mm.transform_format = MultiMesh.TRANSFORM_3D
	crown_mm.mesh = crown_mesh
	crown_mm.instance_count = TREE_COUNT

	var tree_colliders := StaticBody3D.new()
	tree_colliders.name = "TreeColliders"
	add_child(tree_colliders)

	for i in range(TREE_COUNT):
		var p := _forest_position(9.0)
		var scale := rng.randf_range(0.72, 1.48)
		var yaw_r := rng.randf_range(0.0, TAU)
		var trunk_basis := Basis(Vector3.UP, yaw_r).scaled(Vector3(scale, scale, scale))
		trunk_mm.set_instance_transform(i, Transform3D(trunk_basis, p + Vector3(0, 3.6 * scale, 0)))
		var crown_basis := Basis(Vector3.UP, yaw_r + 0.2).scaled(Vector3(scale * rng.randf_range(0.85,1.18), scale, scale * rng.randf_range(0.85,1.18)))
		crown_mm.set_instance_transform(i, Transform3D(crown_basis, p + Vector3(0, 7.3 * scale, 0)))
		var tree_col := CollisionShape3D.new()
		var tree_shape := CylinderShape3D.new()
		tree_shape.radius = 0.38 * scale
		tree_shape.height = 7.0 * scale
		tree_col.shape = tree_shape
		tree_col.position = p + Vector3(0, 3.5 * scale, 0)
		tree_colliders.add_child(tree_col)

	var trunks := MultiMeshInstance3D.new()
	trunks.multimesh = trunk_mm
	trunks.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_ON
	add_child(trunks)
	var crowns := MultiMeshInstance3D.new()
	crowns.multimesh = crown_mm
	crowns.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_ON
	add_child(crowns)

func _build_rocks() -> void:
	var mesh := SphereMesh.new()
	mesh.radius = 0.65
	mesh.height = 0.95
	mesh.radial_segments = 10
	mesh.rings = 6
	var mat := StandardMaterial3D.new()
	mat.albedo_color = Color(0.22, 0.24, 0.21)
	mat.roughness = 0.78
	mat.uv1_triplanar = true
	mat.uv1_world_triplanar = true
	mat.uv1_scale = Vector3(0.75, 0.75, 0.75)
	mesh.material = mat
	var mm := MultiMesh.new()
	mm.transform_format = MultiMesh.TRANSFORM_3D
	mm.mesh = mesh
	mm.instance_count = ROCK_COUNT
	for i in range(ROCK_COUNT):
		var p := _forest_position(6.0)
		p.y = rng.randf_range(0.04, 0.18)
		var b := Basis(Vector3.UP, rng.randf_range(0.0, TAU)).scaled(Vector3(rng.randf_range(0.55, 1.65), rng.randf_range(0.4, 1.0), rng.randf_range(0.65, 1.55)))
		mm.set_instance_transform(i, Transform3D(b, p))
	var inst := MultiMeshInstance3D.new()
	inst.multimesh = mm
	add_child(inst)

func _build_grass() -> void:
	var mesh := QuadMesh.new()
	mesh.size = Vector2(0.9, 1.25)
	var mat := StandardMaterial3D.new()
	mat.albedo_color = Color(0.055, 0.105, 0.065, 0.82)
	mat.shading_mode = BaseMaterial3D.SHADING_MODE_PER_PIXEL
	mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA_SCISSOR
	mat.alpha_scissor_threshold = 0.24
	mat.cull_mode = BaseMaterial3D.CULL_DISABLED
	mesh.material = mat
	var mm := MultiMesh.new()
	mm.transform_format = MultiMesh.TRANSFORM_3D
	mm.mesh = mesh
	mm.instance_count = GRASS_COUNT
	for i in range(GRASS_COUNT):
		var p := _forest_position(5.0)
		p.y = 0.58
		var sc := rng.randf_range(0.45, 1.35)
		var b := Basis(Vector3.UP, rng.randf_range(0.0, TAU)).scaled(Vector3(sc, sc, sc))
		mm.set_instance_transform(i, Transform3D(b, p))
	var inst := MultiMeshInstance3D.new()
	inst.multimesh = mm
	inst.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	add_child(inst)

func _build_dead_branches() -> void:
	for i in range(22):
		var branch := MeshInstance3D.new()
		var box := BoxMesh.new()
		box.size = Vector3(rng.randf_range(2.0, 5.5), 0.16, 0.2)
		var mat := StandardMaterial3D.new()
		mat.albedo_color = Color(0.06, 0.045, 0.034)
		mat.roughness = 0.95
		box.material = mat
		branch.mesh = box
		branch.position = _forest_position(8.0) + Vector3(0, 0.12, 0)
		branch.rotation = Vector3(rng.randf_range(-0.12,0.12), rng.randf_range(0.0,TAU), rng.randf_range(-0.08,0.08))
		add_child(branch)

func _forest_position(clear_radius: float) -> Vector3:
	for attempt in range(25):
		var p := Vector3(rng.randf_range(-WORLD_SIZE*0.48, WORLD_SIZE*0.48), 0, rng.randf_range(-WORLD_SIZE*0.48, WORLD_SIZE*0.48))
		if Vector2(p.x, p.z - 10.0).length() > clear_radius:
			return p
	return Vector3(20,0,20)

func _build_watcher() -> void:
	watcher = Node3D.new()
	watcher.name = "Watcher"
	watcher.position = watcher_points[0]
	var mat := StandardMaterial3D.new()
	mat.albedo_color = Color(0.003, 0.004, 0.004)
	mat.roughness = 1.0

	var body := MeshInstance3D.new()
	var body_mesh := CylinderMesh.new()
	body_mesh.top_radius = 0.23
	body_mesh.bottom_radius = 0.36
	body_mesh.height = 2.15
	body_mesh.radial_segments = 8
	body_mesh.material = mat
	body.mesh = body_mesh
	body.position.y = 1.25
	watcher.add_child(body)

	var head := MeshInstance3D.new()
	var head_mesh := SphereMesh.new()
	head_mesh.radius = 0.27
	head_mesh.height = 0.54
	head_mesh.radial_segments = 10
	head_mesh.rings = 6
	head_mesh.material = mat
	head.mesh = head_mesh
	head.position.y = 2.57
	watcher.add_child(head)

	var eye := OmniLight3D.new()
	eye.position = Vector3(0, 2.61, -0.23)
	eye.light_color = Color(0.45, 0.015, 0.008)
	eye.light_energy = 0.16
	eye.omni_range = 0.85
	eye.shadow_enabled = false
	watcher.add_child(eye)
	add_child(watcher)

func _build_player() -> void:
	player = CharacterBody3D.new()
	player.name = "Player"
	player.position = start_pos
	player.floor_max_angle = deg_to_rad(48.0)
	var collider := CollisionShape3D.new()
	var capsule := CapsuleShape3D.new()
	capsule.radius = 0.34
	capsule.height = 1.7
	collider.shape = capsule
	collider.position.y = 0.85
	player.add_child(collider)

	neck = Node3D.new()
	neck.position = Vector3(0, 1.58, 0)
	player.add_child(neck)
	camera = Camera3D.new()
	camera.current = true
	camera.fov = base_fov
	camera.near = 0.04
	camera.far = 110.0
	neck.add_child(camera)

	flashlight = SpotLight3D.new()
	flashlight.position = Vector3(0.11, -0.08, -0.08)
	flashlight.rotation_degrees = Vector3(-1.5, 0, 0)
	flashlight.light_color = Color(1.0, 0.91, 0.74)
	flashlight.light_energy = 7.8
	flashlight.spot_range = 31.0
	flashlight.spot_angle = 31.0
	flashlight.spot_angle_attenuation = 0.62
	flashlight.shadow_enabled = true
	flashlight.shadow_bias = 0.035
	camera.add_child(flashlight)
	add_child(player)

func _build_ui() -> void:
	var layer := CanvasLayer.new()
	layer.layer = 10
	add_child(layer)
	joystick = FloatingJoystick.new()
	joystick.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	layer.add_child(joystick)

	var hint := Label.new()
	hint.text = "ПРОВЕДИ СПРАВА — ОСМОТРЕТЬСЯ"
	hint.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	hint.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	hint.set_anchors_preset(Control.PRESET_TOP_WIDE)
	hint.offset_top = 30
	hint.offset_bottom = 84
	hint.add_theme_font_size_override("font_size", 21)
	hint.modulate = Color(0.84,0.9,0.87,0.55)
	layer.add_child(hint)
	var tw := create_tween()
	tw.tween_interval(3.5)
	tw.tween_property(hint, "modulate:a", 0.0, 2.0)

	var cross := Label.new()
	cross.text = "·"
	cross.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	cross.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	cross.set_anchors_and_offsets_preset(Control.PRESET_CENTER)
	cross.offset_left = -12
	cross.offset_right = 12
	cross.offset_top = -18
	cross.offset_bottom = 18
	cross.add_theme_font_size_override("font_size", 28)
	cross.modulate = Color(0.9,0.94,0.9,0.42)
	layer.add_child(cross)

	var button := Button.new()
	button.text = "ФОНАРЬ"
	button.set_anchors_preset(Control.PRESET_BOTTOM_RIGHT)
	button.offset_left = -190
	button.offset_top = -150
	button.offset_right = -34
	button.offset_bottom = -62
	button.add_theme_font_size_override("font_size", 21)
	button.modulate = Color(0.85,0.91,0.86,0.78)
	button.pressed.connect(_toggle_flashlight)
	layer.add_child(button)

	var vignette := ColorRect.new()
	vignette.mouse_filter = Control.MOUSE_FILTER_IGNORE
	vignette.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	var sm := ShaderMaterial.new()
	var sh := Shader.new()
	sh.code = """
shader_type canvas_item;
render_mode unshaded;
float rand(vec2 co){ return fract(sin(dot(co, vec2(12.9898,78.233))) * 43758.5453); }
void fragment(){
	float d = distance(UV, vec2(0.5));
	float vig = smoothstep(0.34, 0.79, d) * 0.48;
	float grain = (rand(UV * vec2(1920.0,1080.0) + TIME*31.0) - 0.5) * 0.035;
	float topbot = smoothstep(0.0, 0.06, UV.y) * smoothstep(0.0, 0.06, 1.0-UV.y);
	float a = clamp(vig + abs(grain) * 0.28 + (1.0-topbot)*0.16, 0.0, 0.62);
	COLOR = vec4(vec3(0.0), a);
}
"""
	sm.shader = sh
	vignette.material = sm
	layer.add_child(vignette)

func _input(event: InputEvent) -> void:
	if event is InputEventScreenDrag:
		var size := get_viewport().get_visible_rect().size
		if event.index != joystick.active_touch and event.position.x > size.x * 0.40 and event.position.y < size.y * 0.86:
			look_accum += event.relative * 0.00235
	elif event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		look_accum += event.relative * 0.0018
	elif event is InputEventKey and event.pressed and event.physical_keycode == KEY_ESCAPE:
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	elif event.is_action_pressed("toggle_light"):
		_toggle_flashlight()

func _physics_process(delta: float) -> void:
	if player == null:
		return
	move_vec = joystick.value if joystick != null and joystick.value.length() > 0.05 else Input.get_vector("move_left", "move_right", "move_forward", "move_back")
	move_vec = move_vec.limit_length(1.0)
	var local_dir := Vector3(move_vec.x, 0.0, move_vec.y)
	var world_dir := (Basis(Vector3.UP, yaw) * local_dir)
	if world_dir.length() > 1.0:
		world_dir = world_dir.normalized()
	var running := move_vec.length() > 0.88
	var speed := 5.15 if running else 3.45
	var target_velocity := world_dir * speed
	velocity_smooth.x = lerpf(velocity_smooth.x, target_velocity.x, 1.0 - exp(-8.0 * delta))
	velocity_smooth.z = lerpf(velocity_smooth.z, target_velocity.z, 1.0 - exp(-8.0 * delta))
	player.velocity.x = velocity_smooth.x
	player.velocity.z = velocity_smooth.z
	if not player.is_on_floor():
		player.velocity.y -= 9.8 * delta
	else:
		player.velocity.y = -0.4
	player.move_and_slide()
	if player.position.y < -8.0:
		player.position = start_pos
		player.velocity = Vector3.ZERO
	_update_camera(delta, running)
	_update_watcher(delta)

func _update_camera(delta: float, running: bool) -> void:
	yaw -= look_accum.x
	pitch = clampf(pitch - look_accum.y, deg_to_rad(-78.0), deg_to_rad(78.0))
	look_accum = look_accum.lerp(Vector2.ZERO, 1.0 - exp(-18.0 * delta))
	player.rotation.y = lerp_angle(player.rotation.y, yaw, 1.0 - exp(-20.0 * delta))
	neck.rotation.x = lerp_angle(neck.rotation.x, pitch, 1.0 - exp(-18.0 * delta))

	var planar_speed: float = Vector2(player.velocity.x, player.velocity.z).length()
	var motion: float = clampf(planar_speed / 5.2, 0.0, 1.0)
	bob_time += delta * lerpf(3.2, 9.0 if running else 7.0, motion)
	var bob_y: float = sin(bob_time * 2.0) * 0.020 * motion
	var bob_x: float = cos(bob_time) * 0.016 * motion
	var breath: float = sin(Time.get_ticks_msec() * 0.00125) * 0.006
	var micro: float = sin(Time.get_ticks_msec() * 0.0061) * 0.0022 + sin(Time.get_ticks_msec() * 0.0107) * 0.0011
	camera.position = camera.position.lerp(Vector3(bob_x + micro, bob_y + breath, 0.0), 1.0 - exp(-12.0 * delta))
	var target_roll: float = -move_vec.x * 0.020 - bob_x * 0.7
	camera.rotation.z = lerp(camera.rotation.z, target_roll, 1.0 - exp(-8.0 * delta))
	camera.rotation.y = lerp(camera.rotation.y, -move_vec.x * 0.006 + micro * 0.3, 1.0 - exp(-7.0 * delta))
	camera.fov = lerp(camera.fov, base_fov + (4.0 if running else 0.0) * motion, 1.0 - exp(-5.0 * delta))
	if flashlight != null and light_on:
		var pulse: float = 1.0 + sin(Time.get_ticks_msec()*0.0024)*0.018 + sin(Time.get_ticks_msec()*0.011)*0.008
		flashlight.light_energy = 7.8 * pulse

func _update_watcher(delta: float) -> void:
	if watcher == null:
		return
	watcher_cooldown = maxf(0.0, watcher_cooldown - delta)
	var flat_dist := Vector2(player.position.x - watcher.position.x, player.position.z - watcher.position.z).length()
	watcher.look_at(Vector3(player.position.x, watcher.position.y + 1.3, player.position.z), Vector3.UP)
	if flat_dist < 11.0 and watcher_cooldown <= 0.0:
		watcher_index = (watcher_index + 1 + rng.randi_range(0, watcher_points.size()-2)) % watcher_points.size()
		watcher.position = watcher_points[watcher_index]
		watcher_cooldown = 4.0

func _toggle_flashlight() -> void:
	light_on = not light_on
	if flashlight:
		flashlight.visible = light_on
