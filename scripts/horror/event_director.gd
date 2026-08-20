extends Node

const LOCUST_DEATH_CONTROLLER := preload("res://scripts/horror/locust_death_controller.gd")

@export var player_path: NodePath
@export var terrain_path: NodePath
@export var forest_path: NodePath
@export var locust_scene: PackedScene
@export var boiled_scene: PackedScene

@export var base_event_chance := 0.34
@export var check_interval := Vector2(10.0, 19.0)
@export var event_cooldown := 14.0
@export var document_chance_decay := 0.0285
@export_range(0.0, 1.0, 0.01) var rear_weight := 0.35
@export var boiled_relative_chance := 0.20

@export var locust_distance := Vector2(18.0, 42.0)
@export var boiled_distance := Vector2(28.0, 55.0)
@export var final_locust_distance := Vector2(24.0, 48.0)
@export var direct_view_exclusion_angle := 15.0
@export var boiled_open_attempts := 20
@export var boiled_tree_clearance := 4.2
@export var final_locust_count := 3

var _player: CharacterBody3D
var _camera: Camera3D
var _terrain: Node
var _forest: Node
var _rng := RandomNumberGenerator.new()
var _next_check_at := 0.0
var _cooldown_until := 0.0
var _active_encounter: Node
var _final_spawned := false
var _death_busy := false

func _ready() -> void:
	_player = get_node(player_path) as CharacterBody3D
	if _player != null:
		_camera = _player.get_node_or_null("Head/Camera3D") as Camera3D
	_terrain = get_node_or_null(terrain_path)
	_forest = get_node_or_null(forest_path)
	_rng.seed = int(GameState.run_seed) ^ 0x6E624EB7
	_schedule_next_check()
	if not GameState.final_run_started.is_connected(_on_final_run_started):
		GameState.final_run_started.connect(_on_final_run_started)
	if GameState.final_run_active:
		call_deferred("_on_final_run_started")

func _process(_delta: float) -> void:
	if GameState.final_run_active or _death_busy:
		return
	if is_instance_valid(_active_encounter):
		return

	var now := _now()
	if now < _cooldown_until or now < _next_check_at:
		return
	_schedule_next_check()

	var chance := base_event_chance * pow(1.0 - document_chance_decay, float(GameState.documents_collected))
	if _rng.randf() > chance:
		return

	var boiled_allowed := (
		GameState.documents_collected >= 2
		and GameState.documents_collected <= 8
		and not GameState.boiled_encounter_used
	)

	# Canon: Boiled has relative weight 0.20 compared with Locust = exactly five
	# times rarer. Among the two, probability is 0.20 / 1.20 = 1/6.
	var boiled_probability := 0.0
	if boiled_allowed:
		boiled_probability = boiled_relative_chance / (1.0 + boiled_relative_chance)

	var spawned: Node = null
	if boiled_allowed and _rng.randf() < boiled_probability:
		spawned = _spawn_boiled()
		if spawned == null:
			spawned = _spawn_locust(false)
	else:
		spawned = _spawn_locust(false)

	if spawned != null:
		_active_encounter = spawned
		_cooldown_until = _now() + event_cooldown

func _schedule_next_check() -> void:
	_next_check_at = _now() + _rng.randf_range(check_interval.x, check_interval.y)

func _spawn_locust(is_final: bool) -> Node:
	if locust_scene == null or _player == null:
		return null

	var range_values := final_locust_distance if is_final else locust_distance
	var selection := _select_locust_cover(range_values)
	var cover_center := Vector3.INF
	var spawn_position := Vector3.INF
	if not selection.is_empty():
		cover_center = selection.get("cover", Vector3.INF)
		spawn_position = selection.get("spawn", Vector3.INF)

	if spawn_position == Vector3.INF:
		spawn_position = _fallback_ring_point(range_values, true)
	if spawn_position == Vector3.INF:
		return null
	spawn_position = _ground_position(spawn_position)

	var locust := locust_scene.instantiate()
	get_parent().add_child(locust)
	locust.global_position = spawn_position
	if locust.has_signal("encounter_finished"):
		locust.encounter_finished.connect(_on_encounter_finished.bind(locust))
	if locust.has_signal("player_caught"):
		locust.player_caught.connect(_on_player_caught)
	if locust.has_method("begin_encounter"):
		locust.call("begin_encounter", _player, is_final, cover_center)
	return locust

func _spawn_boiled() -> Node:
	if boiled_scene == null or _player == null:
		return null
	var position := _select_boiled_open_point()
	if position == Vector3.INF:
		return null

	var boiled := boiled_scene.instantiate()
	get_parent().add_child(boiled)
	boiled.global_position = position
	if boiled.has_signal("encounter_finished"):
		boiled.encounter_finished.connect(_on_encounter_finished.bind(boiled))
	if boiled.has_method("begin_encounter"):
		boiled.call("begin_encounter", _player)
	return boiled

func _select_locust_cover(range_values: Vector2) -> Dictionary:
	if _forest == null or _player == null:
		return {}
	var positions = _forest.get("tree_positions")
	if positions == null or positions.is_empty():
		return {}

	var candidates: Array[Dictionary] = []
	var total_weight := 0.0
	var camera_forward := _flat_camera_forward()
	var mid := (range_values.x + range_values.y) * 0.5
	var half_span := maxf(1.0, (range_values.y - range_values.x) * 0.5)

	for tree_position: Vector3 in positions:
		var delta := tree_position - _player.global_position
		delta.y = 0.0
		var distance := delta.length()
		if distance < range_values.x or distance > range_values.y or distance < 0.1:
			continue
		var direction := delta / distance
		if _angle_from_camera(direction) < direct_view_exclusion_angle:
			continue

		var hidden := tree_position + direction * 0.95
		hidden = _ground_position(hidden)
		# Locust must really be using cover. The camera ray to the upper body must
		# hit trunk/foliage/world geometry before reaching the hidden spawn point.
		if _camera != null and not _ray_has_blocker(_camera.global_position, hidden + Vector3.UP * 1.65):
			continue

		var rear := camera_forward.dot(direction) < 0.0
		var weight := rear_weight if rear else 1.0
		var distance_preference := 1.0 - clampf(absf(distance - mid) / half_span, 0.0, 1.0) * 0.35
		weight *= distance_preference
		weight = maxf(0.001, weight)
		total_weight += weight
		candidates.append({"cover": tree_position, "spawn": hidden, "cumulative": total_weight})

	if candidates.is_empty() or total_weight <= 0.0:
		return {}
	var pick := _rng.randf() * total_weight
	for candidate: Dictionary in candidates:
		if pick <= float(candidate["cumulative"]):
			return candidate
	return candidates[candidates.size() - 1]

func _select_boiled_open_point() -> Vector3:
	if _player == null:
		return Vector3.INF
	for _attempt in boiled_open_attempts:
		var angle := _rng.randf_range(0.0, TAU)
		var direction := Vector3(cos(angle), 0.0, sin(angle))
		var rear := _flat_camera_forward().dot(direction) < 0.0
		if rear and _rng.randf() > rear_weight:
			continue
		var distance := _rng.randf_range(boiled_distance.x, boiled_distance.y)
		var candidate := _ground_position(_player.global_position + direction * distance)
		if not _forest_is_open(candidate, boiled_tree_clearance):
			continue
		# Never materialise Boiled while the camera is already aimed at it.
		if _angle_from_camera((candidate - _player.global_position).normalized()) < maxf(20.0, direct_view_exclusion_angle):
			continue
		return candidate
	return Vector3.INF

func _fallback_ring_point(range_values: Vector2, avoid_direct_view: bool) -> Vector3:
	if _player == null:
		return Vector3.INF
	for _attempt in 18:
		var angle := _rng.randf_range(0.0, TAU)
		var direction := Vector3(cos(angle), 0.0, sin(angle))
		if avoid_direct_view and _angle_from_camera(direction) < direct_view_exclusion_angle:
			continue
		var distance := _rng.randf_range(range_values.x, range_values.y)
		return _ground_position(_player.global_position + direction * distance)
	return Vector3.INF

func _forest_is_open(position: Vector3, clearance: float) -> bool:
	if _forest == null:
		return true
	var positions = _forest.get("tree_positions")
	if positions == null:
		return true
	var clearance_sq := clearance * clearance
	for tree_position: Vector3 in positions:
		var dx := tree_position.x - position.x
		var dz := tree_position.z - position.z
		if dx * dx + dz * dz < clearance_sq:
			return false
	return true

func _ray_has_blocker(from: Vector3, to: Vector3) -> bool:
	if _player == null:
		return false
	var query := PhysicsRayQueryParameters3D.create(from, to)
	query.exclude = [_player.get_rid()]
	query.collision_mask = 1 | 8
	query.collide_with_areas = false
	query.collide_with_bodies = true
	return not _player.get_world_3d().direct_space_state.intersect_ray(query).is_empty()

func _ground_position(position: Vector3) -> Vector3:
	if _terrain != null and _terrain.has_method("sample_height"):
		position.y = float(_terrain.call("sample_height", position.x, position.z)) + 0.05
	return position

func _flat_camera_forward() -> Vector3:
	if _camera == null:
		return Vector3.FORWARD
	var forward := -_camera.global_basis.z
	forward.y = 0.0
	return forward.normalized() if forward.length_squared() > 0.001 else Vector3.FORWARD

func _angle_from_camera(direction: Vector3) -> float:
	var flat := direction
	flat.y = 0.0
	if flat.length_squared() < 0.001:
		return 180.0
	return rad_to_deg(acos(clampf(_flat_camera_forward().dot(flat.normalized()), -1.0, 1.0)))

func _on_encounter_finished(encounter: Node) -> void:
	if _active_encounter == encounter:
		_active_encounter = null

func _on_final_run_started() -> void:
	if _final_spawned or _player == null:
		return
	_final_spawned = true
	if is_instance_valid(_active_encounter):
		_active_encounter.queue_free()
	_active_encounter = null
	for boiled: Node in get_tree().get_nodes_in_group("ff_boiled"):
		if is_instance_valid(boiled):
			boiled.queue_free()
	for _i in final_locust_count:
		_spawn_locust(true)

func _on_player_caught(locust: Node) -> void:
	if _death_busy or not is_instance_valid(locust):
		return
	_death_busy = true

	for monster: Node in get_tree().get_nodes_in_group("ff_monster"):
		if is_instance_valid(monster):
			monster.set_process(false)
			monster.set_physics_process(false)

	var death_controller := LOCUST_DEATH_CONTROLLER.new()
	death_controller.name = "LocustDeathController_Runtime"
	get_parent().add_child(death_controller)
	await death_controller.call("play_and_recover", _player, locust, _terrain)

	for monster: Node in get_tree().get_nodes_in_group("ff_monster"):
		if is_instance_valid(monster):
			monster.queue_free()
	_active_encounter = null
	if is_instance_valid(death_controller):
		death_controller.queue_free()

	_death_busy = false
	if GameState.final_run_active:
		_final_spawned = false
		call_deferred("_on_final_run_started")
	else:
		_cooldown_until = _now() + event_cooldown
		_schedule_next_check()

func _now() -> float:
	return Time.get_ticks_msec() / 1000.0
