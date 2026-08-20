extends CharacterBody3D

signal encounter_finished
signal player_caught(locust: CharacterBody3D)
signal state_changed(state: int, hide_variant: int)
signal warning_distance_entered

enum State { HIDE, RETREAT, RAGE, CHASE, ATTACK }

@export var gravity := 22.0
@export var warning_distance := 14.0
@export var rage_distance := 8.5
@export var attack_distance := 1.65
@export var flashlight_retreat_distance := 30.0
@export var far_hide_distance := 31.0
@export var medium_hide_distance := 23.0
@export_range(0.5, 1.0, 0.01) var safe_retreat_factor := 0.85
@export var approach_rage_delta := 1.15
@export var hide_hold_range := Vector2(1.8, 3.6)
@export var retreat_timeout_range := Vector2(1.4, 2.8)
@export var rage_windup := 0.28
@export var peek_speed := 1.55
@export var retreat_speed := 3.1
@export var normal_chase_speed := 6.0
@export var final_speed_ratio := 0.975
@export var chase_acceleration := 18.0
@export var turn_response := 8.0

@onready var rig_animator: Node = $RigAnimator
@onready var navigation_agent: NavigationAgent3D = get_node_or_null("NavigationAgent3D") as NavigationAgent3D

var state: int = State.HIDE
var final_chase := false

var _player: CharacterBody3D
var _caught := false
var _hide_variant := 0
var _initial_distance := INF
var _state_entered_at := 0.0
var _state_until := 0.0
var _warning_emitted := false
var _close_encounter := false
var _safe_retreat_reached := false
var _approach_pressure := 0.0
var _last_player_cover_distance := INF

var _cover_center := Vector3.INF
var _hide_target := Vector3.INF
var _peek_target := Vector3.INF
var _retreat_target := Vector3.INF

func _ready() -> void:
	add_to_group("ff_monster")
	add_to_group("ff_locust")
	if navigation_agent != null:
		navigation_agent.path_desired_distance = 0.7
		navigation_agent.target_desired_distance = 0.9

func begin_encounter(player: CharacterBody3D, is_final_chase := false, cover_center := Vector3.INF) -> void:
	_player = player
	final_chase = is_final_chase
	_caught = false
	_warning_emitted = false
	_approach_pressure = 0.0
	_initial_distance = _flat_distance_to_player()
	_close_encounter = _initial_distance < medium_hide_distance
	_safe_retreat_reached = not _close_encounter
	_configure_cover(cover_center)
	_last_player_cover_distance = _player_distance_to_cover()

	if final_chase:
		_enter_state(State.CHASE, 9999.0)
	else:
		_hide_variant = _choose_hide_variant(_initial_distance)
		if _hide_target != Vector3.INF:
			global_position = _hide_target
		_enter_state(State.HIDE, randf_range(hide_hold_range.x, hide_hold_range.y))
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
		State.ATTACK:
			velocity.x = 0.0
			velocity.z = 0.0

	move_and_slide()

func _process_hide(delta: float) -> void:
	var distance := _flat_distance_to_player()
	_evaluate_hide_distance_rules(distance, delta)
	if state != State.HIDE:
		return

	_face_player()
	if _peek_target != Vector3.INF:
		_move_toward_world_point(_peek_target, peek_speed, 8.0, delta)
	else:
		_damp_horizontal_velocity(14.0, delta)

	if _now() >= _state_until:
		_enter_state(State.RETREAT, randf_range(retreat_timeout_range.x, retreat_timeout_range.y))

func _process_retreat(delta: float) -> void:
	var distance := _flat_distance_to_player()
	_evaluate_hide_distance_rules(distance, delta)
	if state != State.RETREAT:
		return

	var reached_target := false
	if _retreat_target != Vector3.INF:
		reached_target = _move_toward_world_point(_retreat_target, retreat_speed, 10.0, delta)
	else:
		var away := global_position - _player.global_position
		away.y = 0.0
		if away.length_squared() > 0.001:
			away = away.normalized()
			velocity.x = move_toward(velocity.x, away.x * retreat_speed, 10.0 * delta)
			velocity.z = move_toward(velocity.z, away.z * retreat_speed, 10.0 * delta)

	var minimum_retreat_time := 0.42
	var time_ready := _now() - _state_entered_at >= minimum_retreat_time
	if _close_encounter:
		# Canon: a close Locust can disengage only after the player backs away to
		# roughly 85% of the configured medium-distance threshold.
		if _safe_retreat_reached and time_ready and (reached_target or _now() >= _state_until):
			_finish_encounter()
	else:
		if time_ready and (reached_target or _now() >= _state_until):
			_finish_encounter()

func _process_rage(delta: float) -> void:
	_face_player()
	_damp_horizontal_velocity(18.0, delta)
	if _now() >= _state_until:
		_enter_state(State.CHASE, 9999.0)

func _process_chase(delta: float) -> void:
	var to_player := _player.global_position - global_position
	to_player.y = 0.0
	var distance := to_player.length()
	if distance <= attack_distance:
		_attack()
		return
	if distance < 0.001:
		return

	var direction := _resolve_chase_direction(to_player / distance)
	var speed := normal_chase_speed
	if final_chase and _player.has_method("current_max_speed"):
		# Canon: final Locust remains exactly 2.5% slower than the player's
		# current top speed, including the final-run multiplier.
		speed = float(_player.call("current_max_speed")) * final_speed_ratio

	velocity.x = move_toward(velocity.x, direction.x * speed, chase_acceleration * delta)
	velocity.z = move_toward(velocity.z, direction.z * speed, chase_acceleration * delta)
	rotation.y = lerp_angle(rotation.y, atan2(-direction.x, -direction.z), 1.0 - exp(-turn_response * delta))

func _evaluate_hide_distance_rules(distance: float, delta: float) -> void:
	if distance <= attack_distance:
		_attack()
		return
	if distance <= rage_distance:
		_enter_state(State.RAGE, rage_windup)
		return

	if not _warning_emitted and distance <= warning_distance:
		_warning_emitted = true
		warning_distance_entered.emit()

	if _close_encounter and distance >= medium_hide_distance * safe_retreat_factor:
		_safe_retreat_reached = true

	# Hiding is never an animation lock. Rage is based on the player's movement
	# toward the cover point, so the Locust's own retreat motion cannot falsely
	# count as player aggression.
	var cover_distance := _player_distance_to_cover()
	if _last_player_cover_distance < INF and cover_distance < INF:
		var approach := _last_player_cover_distance - cover_distance
		if approach > 0.0:
			_approach_pressure += approach
		else:
			_approach_pressure = maxf(0.0, _approach_pressure - delta * 1.4)
		if _approach_pressure >= approach_rage_delta:
			_enter_state(State.RAGE, rage_windup)
			return
	_last_player_cover_distance = cover_distance

func on_flashlight_exposed() -> void:
	if state != State.HIDE:
		return
	if _flat_distance_to_player() < flashlight_retreat_distance:
		return
	_enter_state(State.RETREAT, maxf(0.65, randf_range(retreat_timeout_range.x, retreat_timeout_range.y) * 0.68))

func trigger_retreat() -> void:
	if state == State.HIDE:
		_enter_state(State.RETREAT, randf_range(retreat_timeout_range.x, retreat_timeout_range.y))

func trigger_rage() -> void:
	if state == State.HIDE or state == State.RETREAT:
		_enter_state(State.RAGE, rage_windup)

func _configure_cover(cover_center: Vector3) -> void:
	_cover_center = cover_center
	if cover_center == Vector3.INF or _player == null:
		_hide_target = Vector3.INF
		_peek_target = Vector3.INF
		_retreat_target = Vector3.INF
		return

	var from_player := cover_center - _player.global_position
	from_player.y = 0.0
	if from_player.length_squared() < 0.001:
		from_player = -_player.global_basis.z
	from_player = from_player.normalized()
	var side := Vector3.UP.cross(from_player).normalized()
	if randf() < 0.5:
		side = -side

	# Spawn behind the tree relative to the player, peek around one side, then
	# withdraw deeper into the forest on retreat.
	_hide_target = cover_center + from_player * 0.95
	_peek_target = cover_center + from_player * 0.58 + side * 0.72
	_retreat_target = cover_center + from_player * 3.6 + side * 0.35
	_hide_target.y = cover_center.y + 0.05
	_peek_target.y = cover_center.y + 0.05
	_retreat_target.y = cover_center.y + 0.05

func _resolve_chase_direction(direct_direction: Vector3) -> Vector3:
	if navigation_agent != null:
		navigation_agent.target_position = _player.global_position
		var nav_map := navigation_agent.get_navigation_map()
		if nav_map.is_valid() and NavigationServer3D.map_get_iteration_id(nav_map) > 0:
			var next_point := navigation_agent.get_next_path_position()
			var path_delta := next_point - global_position
			path_delta.y = 0.0
			if path_delta.length_squared() > 0.16:
				return path_delta.normalized()
	return direct_direction

func _move_toward_world_point(target: Vector3, speed: float, acceleration_value: float, delta: float) -> bool:
	var flat := target - global_position
	flat.y = 0.0
	var distance := flat.length()
	if distance <= 0.28:
		_damp_horizontal_velocity(acceleration_value, delta)
		return true
	var direction := flat / distance
	velocity.x = move_toward(velocity.x, direction.x * speed, acceleration_value * delta)
	velocity.z = move_toward(velocity.z, direction.z * speed, acceleration_value * delta)
	rotation.y = lerp_angle(rotation.y, atan2(-direction.x, -direction.z), 1.0 - exp(-turn_response * delta))
	return false

func _damp_horizontal_velocity(rate: float, delta: float) -> void:
	velocity.x = move_toward(velocity.x, 0.0, rate * delta)
	velocity.z = move_toward(velocity.z, 0.0, rate * delta)

func _choose_hide_variant(distance: float) -> int:
	if distance >= far_hide_distance:
		return randi_range(0, 1) # two far variants
	if distance >= medium_hide_distance:
		return 2 # one medium variant
	return randi_range(3, 4) # two close variants

func _enter_state(next_state: int, duration: float) -> void:
	if _caught:
		return
	state = next_state
	_state_entered_at = _now()
	_state_until = _state_entered_at + duration
	state_changed.emit(state, _hide_variant)
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
		State.ATTACK:
			if rig_animator.has_method("set_attack"):
				rig_animator.call("set_attack")

func _attack() -> void:
	if _caught:
		return
	_caught = true
	state = State.ATTACK
	velocity = Vector3.ZERO
	if rig_animator != null and rig_animator.has_method("set_attack"):
		rig_animator.call("set_attack")
	player_caught.emit(self)

func _finish_encounter() -> void:
	if _caught:
		return
	encounter_finished.emit()
	queue_free()

func _flat_distance_to_player() -> float:
	if _player == null:
		return INF
	return Vector2(global_position.x - _player.global_position.x, global_position.z - _player.global_position.z).length()

func _player_distance_to_cover() -> float:
	if _player == null:
		return INF
	var reference := _cover_center if _cover_center != Vector3.INF else global_position
	return Vector2(_player.global_position.x - reference.x, _player.global_position.z - reference.z).length()

func _face_player() -> void:
	if _player == null:
		return
	var direction := _player.global_position - global_position
	direction.y = 0.0
	if direction.length_squared() > 0.001:
		rotation.y = atan2(-direction.x, -direction.z)

func _now() -> float:
	return Time.get_ticks_msec() / 1000.0
