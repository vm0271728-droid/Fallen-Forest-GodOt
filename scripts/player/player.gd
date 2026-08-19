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

func _ready() -> void:
	camera.fov = 75.0
	_yaw = rotation.y
	_pitch = head.rotation.x
	if not OS.has_feature("mobile"):
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion and look_enabled and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		InputState.add_look_delta(event.relative)
	elif event is InputEventKey and event.pressed and event.keycode == KEY_ESCAPE:
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE if Input.mouse_mode == Input.MOUSE_MODE_CAPTURED else Input.MOUSE_MODE_CAPTURED

func _process(_delta: float) -> void:
	if not look_enabled:
		InputState.consume_look_delta()
		return

	var look := InputState.consume_look_delta()
	if look == Vector2.ZERO:
		return

	var sensitivity := look_radians_per_pixel * Settings.sensitivity
	_yaw -= look.x * sensitivity
	_pitch = clampf(_pitch - look.y * sensitivity, deg_to_rad(-pitch_limit_degrees), deg_to_rad(pitch_limit_degrees))
	rotation.y = _yaw
	head.rotation.x = _pitch

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
	var speed := walk_speed * (final_run_multiplier if GameState.final_run_active else 1.0)
	var target := world_direction * speed
	var rate := acceleration if world_direction != Vector3.ZERO else deceleration
	velocity.x = move_toward(velocity.x, target.x, rate * delta)
	velocity.z = move_toward(velocity.z, target.z, rate * delta)
	move_and_slide()

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
