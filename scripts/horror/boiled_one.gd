extends Node3D

signal encounter_finished

@export var gaze_trigger_angle_degrees := 10.0
@export var gaze_confirmation_time := 0.06
@export var gaze_max_distance := 70.0
@export var untriggered_lifetime := Vector2(28.0, 42.0)
@export var focus_stare_time := 2.2
@export var eyelid_close_time := 0.8
@export var blackout_hold_time := 0.35
@export var wake_fade_time := 0.75
@export var forced_look_response := 11.0

@onready var visual_root: Node3D = $Visual
@onready var body: StaticBody3D = $Body

var _player: CharacterBody3D
var _camera: Camera3D
var _gaze_timer := 0.0
var _expires_at := 0.0
var _triggered := false
var _base_visual_rotation := Vector3.ZERO

func begin_encounter(player: CharacterBody3D) -> void:
	_player = player
	_camera = player.get_node_or_null("Head/Camera3D")
	GameState.consume_boiled_encounter()
	SaveSystem.save_run()
	_expires_at = Time.get_ticks_msec() / 1000.0 + randf_range(untriggered_lifetime.x, untriggered_lifetime.y)
	_base_visual_rotation = visual_root.rotation
	_face_player_once()

func _process(delta: float) -> void:
	# Non-humanoid idle: tiny irregular vertical-mass sway only.
	var t := Time.get_ticks_msec() / 1000.0
	visual_root.rotation.z = _base_visual_rotation.z + sin(t * 0.47) * deg_to_rad(0.7) + sin(t * 0.19 + 1.7) * deg_to_rad(0.35)

	if _triggered or _player == null or _camera == null:
		return

	if _is_player_looking_at_me():
		_gaze_timer += delta
		if _gaze_timer >= gaze_confirmation_time:
			_triggered = true
			_focus_sequence()
	else:
		_gaze_timer = 0.0

	if not _triggered and t >= _expires_at:
		encounter_finished.emit()
		queue_free()

func _face_player_once() -> void:
	if _player == null:
		return
	var flat := _player.global_position - global_position
	flat.y = 0.0
	if flat.length_squared() > 0.001:
		look_at(global_position + flat.normalized(), Vector3.UP)

func _gaze_point() -> Vector3:
	return global_position + Vector3.UP * 1.65

func _is_player_looking_at_me() -> bool:
	var target := _gaze_point()
	var delta := target - _camera.global_position
	var distance := delta.length()
	if distance < 0.1 or distance > gaze_max_distance:
		return false
	var direction := delta / distance
	var forward := -_camera.global_basis.z
	var dot_value := clampf(forward.dot(direction), -1.0, 1.0)
	if rad_to_deg(acos(dot_value)) > gaze_trigger_angle_degrees:
		return false

	var query := PhysicsRayQueryParameters3D.create(_camera.global_position, target)
	query.exclude = [_player.get_rid()]
	query.collide_with_areas = false
	query.collide_with_bodies = true
	var hit := get_world_3d().direct_space_state.intersect_ray(query)
	if hit.is_empty():
		return true
	var collider = hit.get("collider")
	if collider == body:
		return true
	if collider is Node and (collider == self or self.is_ancestor_of(collider)):
		return true
	return false

func _focus_sequence() -> void:
	if _player == null:
		return
	_player.set_external_speed_scale(0.33)
	_player.set_forced_look_target(self, Vector3.UP * 1.65, forced_look_response)

	var overlay := _make_blackout_overlay()
	var black: ColorRect = overlay.get_node("Black")

	await get_tree().create_timer(focus_stare_time).timeout
	var close_tween := create_tween()
	close_tween.tween_property(black, "color:a", 1.0, eyelid_close_time)
	await close_tween.finished

	# Canon rule: the creature disappears only after the eyes are completely closed.
	visual_root.visible = false
	body.process_mode = Node.PROCESS_MODE_DISABLED
	_player.clear_forced_look_target()
	_player.set_external_speed_scale(1.0)

	await get_tree().create_timer(blackout_hold_time).timeout
	var wake_tween := create_tween()
	wake_tween.tween_property(black, "color:a", 0.0, wake_fade_time)
	await wake_tween.finished
	overlay.queue_free()

	GameState.mark_boiled_influenced()
	SaveSystem.save_run()
	encounter_finished.emit()
	queue_free()

func _make_blackout_overlay() -> CanvasLayer:
	var layer := CanvasLayer.new()
	layer.name = "BoiledEyelids"
	layer.layer = 100
	var black := ColorRect.new()
	black.name = "Black"
	black.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	black.mouse_filter = Control.MOUSE_FILTER_IGNORE
	black.color = Color(0.0, 0.0, 0.0, 0.0)
	layer.add_child(black)
	get_tree().root.add_child(layer)
	return layer
