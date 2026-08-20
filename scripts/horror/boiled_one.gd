extends Node3D

signal encounter_finished
signal fear_intensity_changed(value: float)

enum State { WATCHING, FOCUS, VANISHED }

@export var gaze_trigger_angle_degrees := 10.0
@export var gaze_confirmation_time := 0.06
@export var gaze_max_distance := 70.0
@export var untriggered_lifetime := Vector2(28.0, 42.0)
@export var focus_stare_time := 2.2
@export var eyelid_close_time := 0.8
@export var blackout_hold_time := 0.35
@export var eyelid_open_time := 0.75
@export var forced_look_response := 11.0
@export var remaining_speed_scale := 0.33
@export var tinnitus_frequency_hz := 3150.0
@export var tinnitus_mix_rate := 22050.0

@onready var body: StaticBody3D = $Body
@onready var animator: Node = get_node_or_null("BoiledAnimator")

var state: int = State.WATCHING
var _player: CharacterBody3D
var _camera: Camera3D
var _gaze_timer := 0.0
var _expires_at := 0.0
var _focus_started_at := 0.0
var _focus_total_time := 1.0
var _camera_base_position := Vector3.ZERO

var _tinnitus_player: AudioStreamPlayer
var _tinnitus_playback: AudioStreamGeneratorPlayback
var _tinnitus_phase := 0.0
var _fear_intensity := 0.0

func _ready() -> void:
	add_to_group("ff_monster")
	add_to_group("ff_boiled")

func begin_encounter(player: CharacterBody3D) -> void:
	_player = player
	_camera = player.get_node_or_null("Head/Camera3D") as Camera3D
	if _camera != null:
		_camera_base_position = _camera.position
	GameState.consume_boiled_encounter()
	SaveSystem.save_run()
	_expires_at = _now() + randf_range(untriggered_lifetime.x, untriggered_lifetime.y)
	_face_player_once()

func _process(delta: float) -> void:
	if state == State.VANISHED:
		return

	if state == State.FOCUS:
		_update_focus_fear()
		_pump_tinnitus()
		return

	if _player == null or _camera == null:
		return

	if _is_player_looking_at_me():
		_gaze_timer += delta
		if _gaze_timer >= gaze_confirmation_time:
			_start_focus_sequence()
	else:
		_gaze_timer = 0.0

	if state == State.WATCHING and _now() >= _expires_at:
		_finish_without_trigger()

func _is_player_looking_at_me() -> bool:
	var target := _gaze_point()
	var to_target := target - _camera.global_position
	var distance := to_target.length()
	if distance < 0.1 or distance > gaze_max_distance:
		return false

	var direction := to_target / distance
	var forward := -_camera.global_basis.z
	var angle := rad_to_deg(acos(clampf(forward.dot(direction), -1.0, 1.0)))
	if angle > gaze_trigger_angle_degrees:
		return false

	var query := PhysicsRayQueryParameters3D.create(_camera.global_position, target)
	query.exclude = [_player.get_rid()]
	# Layer 1 = trunks/world collision, layer 4 = Boiled body, layer 8 =
	# dedicated foliage LOS volumes. Dense vegetation therefore blocks gaze.
	query.collision_mask = 1 | 4 | 8
	query.collide_with_areas = false
	query.collide_with_bodies = true
	var hit := get_world_3d().direct_space_state.intersect_ray(query)
	if hit.is_empty():
		return false
	var collider = hit.get("collider")
	if collider == body:
		return true
	if collider is Node and (collider == self or self.is_ancestor_of(collider)):
		return true
	return false

func _start_focus_sequence() -> void:
	if state != State.WATCHING or _player == null or _camera == null:
		return
	state = State.FOCUS
	_focus_started_at = _now()
	_focus_total_time = maxf(0.1, focus_stare_time + eyelid_close_time)
	_player.set_external_speed_scale(remaining_speed_scale)
	_player.set_forced_look_target(self, Vector3.UP * 1.65, forced_look_response)
	_start_tinnitus()
	_run_focus_sequence()

func _run_focus_sequence() -> void:
	var overlay := _make_eyelid_overlay()
	var top_lid := overlay.get_node("TopLid") as ColorRect
	var bottom_lid := overlay.get_node("BottomLid") as ColorRect
	var screen_size := get_viewport().get_visible_rect().size

	await get_tree().create_timer(focus_stare_time).timeout

	var close_tween := create_tween().set_parallel(true)
	close_tween.tween_property(top_lid, "size:y", screen_size.y * 0.52, eyelid_close_time).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	close_tween.tween_property(bottom_lid, "position:y", screen_size.y * 0.48, eyelid_close_time).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	close_tween.tween_property(bottom_lid, "size:y", screen_size.y * 0.52, eyelid_close_time).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	await close_tween.finished

	# Canon: despawn exactly while the eyes are fully closed. The player never
	# gets a frame in which the creature visibly pops out of existence.
	state = State.VANISHED
	visible = false
	body.process_mode = Node.PROCESS_MODE_DISABLED
	_player.clear_forced_look_target()
	_player.set_external_speed_scale(1.0)
	_set_fear_intensity(1.0)

	await get_tree().create_timer(blackout_hold_time).timeout
	var open_tween := create_tween().set_parallel(true)
	open_tween.tween_property(top_lid, "size:y", 0.0, eyelid_open_time).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	open_tween.tween_property(bottom_lid, "position:y", screen_size.y, eyelid_open_time).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	open_tween.tween_property(bottom_lid, "size:y", 0.0, eyelid_open_time).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	await open_tween.finished

	if _camera != null:
		_camera.position = _camera_base_position
	_stop_tinnitus()
	_set_fear_intensity(0.0)
	overlay.queue_free()
	GameState.mark_boiled_influenced()
	SaveSystem.save_run()
	encounter_finished.emit()
	queue_free()

func _update_focus_fear() -> void:
	var progress := clampf((_now() - _focus_started_at) / _focus_total_time, 0.0, 1.0)
	_set_fear_intensity(progress)
	if animator != null and animator.has_method("set_focus_weight"):
		animator.call("set_focus_weight", progress)

	# Visual breathing cue: it accelerates gradually but remains small enough not
	# to break the authored forced-look composition.
	if _camera != null:
		var rate := lerpf(1.4, 4.6, progress)
		var amplitude := lerpf(0.0025, 0.008, progress)
		_camera.position.y = _camera_base_position.y + sin((_now() - _focus_started_at) * rate * TAU) * amplitude

func _set_fear_intensity(value: float) -> void:
	_fear_intensity = clampf(value, 0.0, 1.0)
	fear_intensity_changed.emit(_fear_intensity)
	if _tinnitus_player != null:
		_tinnitus_player.volume_db = lerpf(-42.0, -18.0, _fear_intensity)

func _start_tinnitus() -> void:
	if _tinnitus_player != null:
		return
	var generator := AudioStreamGenerator.new()
	generator.mix_rate = tinnitus_mix_rate
	generator.buffer_length = 0.22
	_tinnitus_player = AudioStreamPlayer.new()
	_tinnitus_player.name = "BoiledTinnitus_Runtime"
	_tinnitus_player.stream = generator
	_tinnitus_player.volume_db = -42.0
	add_child(_tinnitus_player)
	_tinnitus_player.play()
	_tinnitus_playback = _tinnitus_player.get_stream_playback() as AudioStreamGeneratorPlayback

func _pump_tinnitus() -> void:
	if _tinnitus_playback == null or _fear_intensity <= 0.0:
		return
	var frames := mini(_tinnitus_playback.get_frames_available(), 512)
	var phase_step := TAU * tinnitus_frequency_hz / tinnitus_mix_rate
	for _i in frames:
		_tinnitus_phase = fmod(_tinnitus_phase + phase_step, TAU)
		var modulator := 0.82 + sin(_tinnitus_phase * 0.013) * 0.18
		var sample := sin(_tinnitus_phase) * 0.018 * _fear_intensity * modulator
		_tinnitus_playback.push_frame(Vector2(sample, sample))

func _stop_tinnitus() -> void:
	if _tinnitus_player != null:
		_tinnitus_player.stop()
		_tinnitus_player.queue_free()
	_tinnitus_player = null
	_tinnitus_playback = null

func _finish_without_trigger() -> void:
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

func _make_eyelid_overlay() -> CanvasLayer:
	var layer := CanvasLayer.new()
	layer.name = "BoiledEyelids"
	layer.layer = 100
	var screen_size := get_viewport().get_visible_rect().size

	var top := ColorRect.new()
	top.name = "TopLid"
	top.position = Vector2.ZERO
	top.size = Vector2(screen_size.x, 0.0)
	top.mouse_filter = Control.MOUSE_FILTER_IGNORE
	top.color = Color.BLACK
	layer.add_child(top)

	var bottom := ColorRect.new()
	bottom.name = "BottomLid"
	bottom.position = Vector2(0.0, screen_size.y)
	bottom.size = Vector2(screen_size.x, 0.0)
	bottom.mouse_filter = Control.MOUSE_FILTER_IGNORE
	bottom.color = Color.BLACK
	layer.add_child(bottom)

	get_tree().root.add_child(layer)
	return layer

func _now() -> float:
	return Time.get_ticks_msec() / 1000.0
