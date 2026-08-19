extends CharacterBody3D

@export var walk_speed := 3.25
@export var final_run_multiplier := 2.15
@export var acceleration := 18.0
@export var deceleration := 22.0
@export var gravity := 22.0
@export var pitch_limit_degrees := 82.0
@export var look_radians_per_pixel := 0.0022

@onready var head: Node3D = $Head
@onready var camera: Camera3D = $Head/Camera3D
@onready var flashlight_rig: Node3D = $Head/Camera3D/FlashlightRig

var controls_enabled := true
var look_enabled := true
var _yaw := 0.0
var _pitch := 0.0
var _external_speed_scale := 1.0
var _forced_look_target: Node3D
var _forced_look_offset := Vector3.ZERO
var _forced_look_response := 11.0

func _ready() -> void:
	camera.fov = 75.0
	_yaw = rotation.y
	_pitch = head.rotation.x
	if not OS.has_feature("mobile"):
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion and look_enabled and _forced_look_target == null and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		InputState.add_look_delta(event.relative)
	elif event is InputEventKey and event.pressed and event.keycode == KEY_ESCAPE:
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE if Input.mouse_mode == Input.MOUSE_MODE_CAPTURED else Input.MOUSE_MODE_CAPTURED

func _process(delta: float) -> void:
	if is_instance_valid(_forced_look_target):
		InputState.consume_look_delta()
		_update_forced_look(delta)
		return

	if not look_enabled:
		InputState.consume_look_delta()
		return

	var look := InputState.consume_look_delta()
	if look == Vector2.ZERO:
		return

	var sensitivity := look_radians_per_pixel * Settings.sensitivity
	_yaw -= look.x * sensitivity
	_pitch = clampf(_pitch - look.y * sensitivity, deg_to_rad(-pitch_limit_degrees), deg_to_rad(pitch_limit_degrees))
	_apply_look_rotation()

	if flashlight_rig.has_method("feed_look_delta"):
		flashlight_rig.call("feed_look_delta", look)

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y -= gravity * delta
	else:
		velocity.y = -0.25

	var input_vector := Vector2.ZERO
	if controls_enabled:
		input_vector = InputState.move_vector
		var keyboard := Vector2(
			float(Input.is_key_pressed(KEY_D)) - float(Input.is_key_pressed(KEY_A)),
			float(Input.is_key_pressed(KEY_W)) - float(Input.is_key_pressed(KEY_S))
		)
		if keyboard.length_squared() > input_vector.length_squared():
			input_vector = keyboard.limit_length(1.0)

	var local_direction := Vector3(input_vector.x, 0.0, -input_vector.y)
	var world_direction := (transform.basis * local_direction).normalized() if local_direction.length_squared() > 0.0 else Vector3.ZERO
	var speed := current_max_speed()
	var target := world_direction * speed
	var rate := acceleration if world_direction != Vector3.ZERO else deceleration
	velocity.x = move_toward(velocity.x, target.x, rate * delta)
	velocity.z = move_toward(velocity.z, target.z, rate * delta)
	move_and_slide()

func current_max_speed() -> float:
	return walk_speed * (final_run_multiplier if GameState.final_run_active else 1.0) * _external_speed_scale

func set_external_speed_scale(value: float) -> void:
	_external_speed_scale = clampf(value, 0.0, 2.0)

func set_forced_look_target(target: Node3D, offset := Vector3.ZERO, response := 11.0) -> void:
	_forced_look_target = target
	_forced_look_offset = offset
	_forced_look_response = maxf(0.1, response)

func clear_forced_look_target() -> void:
	_forced_look_target = null

func _update_forced_look(delta: float) -> void:
	var target_position := _forced_look_target.global_position + _forced_look_offset
	var direction := target_position - camera.global_position
	if direction.length_squared() < 0.0001:
		return
	direction = direction.normalized()
	var horizontal := Vector2(direction.x, direction.z).length()
	var desired_yaw := atan2(-direction.x, -direction.z)
	var desired_pitch := atan2(direction.y, maxf(horizontal, 0.0001))
	var blend := 1.0 - exp(-_forced_look_response * delta)
	_yaw = lerp_angle(_yaw, desired_yaw, blend)
	_pitch = lerpf(_pitch, clampf(desired_pitch, deg_to_rad(-pitch_limit_degrees), deg_to_rad(pitch_limit_degrees)), blend)
	_apply_look_rotation()

func _apply_look_rotation() -> void:
	rotation.y = _yaw
	head.rotation.x = _pitch

func set_controls_enabled(enabled: bool) -> void:
	controls_enabled = enabled
	if not enabled:
		InputState.set_move_vector(Vector2.ZERO)

func set_look_enabled(enabled: bool) -> void:
	look_enabled = enabled
	if not enabled:
		InputState.consume_look_delta()

func teleport_to(world_position: Vector3) -> void:
	global_position = world_position
	velocity = Vector3.ZERO

func save_current_position() -> void:
	SaveSystem.save_player_position(global_position)
