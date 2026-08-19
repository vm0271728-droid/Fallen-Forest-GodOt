extends CharacterBody3D

signal encounter_finished
signal player_caught(locust: CharacterBody3D)

enum State { HIDE, RETREAT, RAGE, CHASE }

@export var gravity := 22.0
@export var rage_distance := 8.5
@export var retreat_speed := 2.8
@export var normal_chase_speed := 6.0
@export var final_speed_ratio := 0.975
@export var attack_distance := 1.65
@export var hide_duration := Vector2(1.8, 3.6)
@export var retreat_duration := Vector2(1.4, 2.4)
@export var far_hide_distance := 31.0
@export var medium_hide_distance := 23.0

@onready var rig_animator: Node = $RigAnimator

var state: int = State.HIDE
var final_chase := false
var _player: CharacterBody3D
var _initial_distance := 0.0
var _state_until := 0.0
var _caught := false
var _hide_variant := 0

func _ready() -> void:
	add_to_group("ff_monster")
	add_to_group("ff_locust")

func begin_encounter(player: CharacterBody3D, is_final_chase := false) -> void:
	_player = player
	final_chase = is_final_chase
	_initial_distance = _flat_distance_to_player()
	if final_chase:
		_enter_state(State.CHASE, 9999.0)
	else:
		_hide_variant = _choose_hide_variant(_initial_distance)
		_enter_state(State.HIDE, randf_range(hide_duration.x, hide_duration.y))
	_face_player()

func _physics_process(delta: float) -> void:
	if _player == null or _caught:
		return
	if not is_on_floor():
		velocity.y -= gravity * delta
	else:
		velocity.y = -0.25

	match state:
		State.HIDE:
			_process_hide(delta)
		State.RETREAT:
			_process_retreat(delta)
		State.RAGE:
			_process_rage(delta)
		State.CHASE:
			_process_chase(delta)

	move_and_slide()

func _process_hide(delta: float) -> void:
	velocity.x = move_toward(velocity.x, 0.0, 14.0 * delta)
	velocity.z = move_toward(velocity.z, 0.0, 14.0 * delta)
	_face_player()
	var distance := _flat_distance_to_player()
	if distance <= rage_distance or distance < _initial_distance - 2.0:
		_enter_state(State.RAGE, 0.32)
		return
	if _now() >= _state_until:
		_enter_state(State.RETREAT, randf_range(retreat_duration.x, retreat_duration.y))

func _process_retreat(delta: float) -> void:
	var distance := _flat_distance_to_player()
	if distance <= rage_distance:
		_enter_state(State.RAGE, 0.28)
		return
	var away := global_position - _player.global_position
	away.y = 0.0
	if away.length_squared() > 0.001:
		away = away.normalized()
		velocity.x = move_toward(velocity.x, away.x * retreat_speed, 10.0 * delta)
		velocity.z = move_toward(velocity.z, away.z * retreat_speed, 10.0 * delta)
	if _now() >= _state_until:
		encounter_finished.emit()
		queue_free()

func _process_rage(delta: float) -> void:
	_face_player()
	velocity.x = move_toward(velocity.x, 0.0, 18.0 * delta)
	velocity.z = move_toward(velocity.z, 0.0, 18.0 * delta)
	if _now() >= _state_until:
		_enter_state(State.CHASE, 9999.0)

func _process_chase(delta: float) -> void:
	var to_player := _player.global_position - global_position
	to_player.y = 0.0
	var distance := to_player.length()
	if distance <= attack_distance:
		_caught = true
		velocity = Vector3.ZERO
		player_caught.emit(self)
		return
	if distance < 0.001:
		return
	var direction := to_player / distance
	var speed := normal_chase_speed
	if final_chase and _player.has_method("current_max_speed"):
		speed = float(_player.call("current_max_speed")) * final_speed_ratio
	velocity.x = move_toward(velocity.x, direction.x * speed, 18.0 * delta)
	velocity.z = move_toward(velocity.z, direction.z * speed, 18.0 * delta)
	rotation.y = lerp_angle(rotation.y, atan2(-direction.x, -direction.z), 1.0 - exp(-8.0 * delta))

func _choose_hide_variant(distance: float) -> int:
	if distance >= far_hide_distance:
		return randi_range(0, 1)
	if distance >= medium_hide_distance:
		return 2
	return randi_range(3, 4)

func _enter_state(next_state: int, duration: float) -> void:
	state = next_state
	_state_until = _now() + duration
	if rig_animator == null:
		return
	match state:
		State.HIDE:
			if rig_animator.has_method("set_hide_variant"):
				rig_animator.call("set_hide_variant", _hide_variant)
		State.RETREAT:
			if rig_animator.has_method("set_retreat"):
				rig_animator.call("set_retreat")
		State.RAGE:
			if rig_animator.has_method("set_rage"):
				rig_animator.call("set_rage")
		State.CHASE:
			if rig_animator.has_method("set_chase"):
				rig_animator.call("set_chase")

func _flat_distance_to_player() -> float:
	if _player == null:
		return INF
	return Vector2(global_position.x - _player.global_position.x, global_position.z - _player.global_position.z).length()

func _face_player() -> void:
	if _player == null:
		return
	var direction := _player.global_position - global_position
	direction.y = 0.0
	if direction.length_squared() > 0.001:
		rotation.y = atan2(-direction.x, -direction.z)

func _now() -> float:
	return Time.get_ticks_msec() / 1000.0
