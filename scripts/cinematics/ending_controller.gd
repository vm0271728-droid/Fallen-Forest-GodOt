extends Node3D

@export var boundary_path: NodePath
@export var terrain_path: NodePath
@export var player_path: NodePath
@export var pickup_scene: PackedScene
@export var escape_run_time := 2.35
@export var road_approach_time := 0.55
@export var vehicle_moment_time := 5.8
@export var end_fade_time := 2.45

var _boundary: Node
var _terrain: Node
var _player: CharacterBody3D
var _started := false
var _overlay: CanvasLayer
var _message: Label
var _black: ColorRect

func _ready() -> void:
	_boundary = get_node(boundary_path)
	_terrain = get_node_or_null(terrain_path)
	_player = get_node(player_path)
	_boundary.forest_exited.connect(_on_forest_exited)
	_build_overlay()

func _on_forest_exited(player: CharacterBody3D, boundary_point: Vector3, outward: Vector3) -> void:
	if _started:
		return
	_started = true
	_start_ending(player, boundary_point, outward.normalized())

func _start_ending(player: CharacterBody3D, boundary_point: Vector3, outward: Vector3) -> void:
	# Safety rule: the chase is over before player control is removed.
	for monster in get_tree().get_nodes_in_group("ff_monster"):
		if is_instance_valid(monster):
			monster.queue_free()

	player.set_controls_enabled(false)
	player.set_look_enabled(false)
	player.set_external_speed_scale(1.0)
	player.clear_forced_look_target()
	player.velocity = Vector3.ZERO
	player.set_physics_process(false)

	_message.text = "БЕГИ" if Settings.language == "ru" else "RUN"
	_message.modulate.a = 0.0
	var message_tween := create_tween()
	message_tween.tween_property(_message, "modulate:a", 1.0, 0.12)
	message_tween.tween_interval(0.8)
	message_tween.tween_property(_message, "modulate:a", 0.0, 0.25)

	var tangent := Vector3.UP.cross(outward).normalized()
	var edge := _ground(boundary_point + outward * 1.2)
	var forest_exit := _ground(edge + outward * 8.5)
	var roadside := _ground(edge + outward * 16.0)
	_build_road(roadside, tangent)

	await _move_actor(player, forest_exit, escape_run_time, outward)
	await _move_actor(player, roadside, road_approach_time, outward)
	await _play_pickup(roadside, tangent)

	var flashlight_rig := player.get_node_or_null("Head/Camera3D/FlashlightRig")
	if flashlight_rig != null and flashlight_rig.has_method("place_for_ending"):
		var lamp_position := roadside + tangent * 0.38 - outward * 0.18
		lamp_position.y = roadside.y
		flashlight_rig.call("place_for_ending", lamp_position, -outward)

	# Canonical beat: after the vehicle and flashlight placement, all forest audio
	# stops together. The lit flashlight remains as the only active sensory anchor.
	AudioDirector.hard_silence()
	await get_tree().create_timer(1.05).timeout

	var look_back := -outward
	var target_yaw := atan2(-look_back.x, -look_back.z)
	var turn := create_tween()
	turn.tween_property(player, "rotation:y", target_yaw, 1.15).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	await turn.finished
	await get_tree().create_timer(0.65).timeout

	var fade := create_tween()
	fade.tween_property(_black, "color:a", 1.0, end_fade_time)
	await fade.finished
	_message.text = "КОНЕЦ" if Settings.language == "ru" else "THE END"
	_message.modulate.a = 1.0
	_message.add_theme_font_size_override("font_size", 56)
	await get_tree().create_timer(4.0).timeout
	SceneFlow.go_to_main_menu()

func _play_pickup(roadside: Vector3, tangent: Vector3) -> void:
	if pickup_scene == null:
		await get_tree().create_timer(1.65).timeout
		return
	var vehicle := pickup_scene.instantiate()
	add_child(vehicle)
	var start := roadside - tangent * 31.0
	var finish := roadside + tangent * 31.0
	start.y = roadside.y + 0.04
	finish.y = roadside.y + 0.04
	vehicle.global_position = start
	vehicle.rotation.y = atan2(tangent.x, tangent.z)
	if vehicle.has_method("start_drive"):
		vehicle.call("start_drive", [finish])
	await get_tree().create_timer(vehicle_moment_time).timeout
	if is_instance_valid(vehicle):
		if vehicle.has_method("stop_now"):
			vehicle.call("stop_now", false)
		vehicle.queue_free()

func _move_actor(actor: Node3D, target: Vector3, duration: float, face: Vector3) -> void:
	if face.length_squared() > 0.001:
		actor.rotation.y = atan2(-face.x, -face.z)
	var tween := create_tween()
	tween.tween_property(actor, "global_position", target, duration).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	await tween.finished

func _ground(position: Vector3) -> Vector3:
	if _terrain != null and _terrain.has_method("sample_height"):
		position.y = float(_terrain.call("sample_height", position.x, position.z)) + 0.04
	return position

func _build_road(centre: Vector3, tangent: Vector3) -> void:
	var road := StaticBody3D.new()
	road.name = "FinalRoad_Runtime"
	road.global_position = centre - Vector3.UP * 0.08
	road.rotation.y = atan2(-tangent.x, -tangent.z)

	var mesh_instance := MeshInstance3D.new()
	var mesh := BoxMesh.new()
	mesh.size = Vector3(8.8, 0.16, 72.0)
	var material := StandardMaterial3D.new()
	material.albedo_color = Color(0.045, 0.042, 0.037, 1.0)
	material.roughness = 0.96
	mesh.material = material
	mesh_instance.mesh = mesh
	road.add_child(mesh_instance)

	var collision := CollisionShape3D.new()
	var shape := BoxShape3D.new()
	shape.size = Vector3(8.8, 0.16, 72.0)
	collision.shape = shape
	road.add_child(collision)
	add_child(road)

func _build_overlay() -> void:
	_overlay = CanvasLayer.new()
	_overlay.layer = 110

	_black = ColorRect.new()
	_black.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	_black.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_black.color = Color(0.0, 0.0, 0.0, 0.0)
	_overlay.add_child(_black)

	_message = Label.new()
	_message.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_message.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	_message.set_anchors_preset(Control.PRESET_CENTER)
	_message.position = Vector2(-350.0, -60.0)
	_message.size = Vector2(700.0, 120.0)
	_message.add_theme_font_size_override("font_size", 42)
	_message.modulate.a = 0.0
	_overlay.add_child(_message)
	add_child(_overlay)
