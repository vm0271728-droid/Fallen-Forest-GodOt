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
@export var locust_distance := Vector2(18.0, 42.0)
@export var boiled_distance := Vector2(24.0, 48.0)
@export var final_locust_count := 3

var _player: CharacterBody3D
var _terrain: Node
var _forest: Node
var _rng := RandomNumberGenerator.new()
var _next_check_at := 0.0
var _cooldown_until := 0.0
var _active_encounter: Node
var _final_spawned := false
var _death_busy := false

func _ready() -> void:
	_player = get_node(player_path)
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
	var chance := base_event_chance * pow(0.9715, float(GameState.documents_collected))
	if _rng.randf() > chance:
		return

	var boiled_allowed := (
		GameState.documents_collected >= 2
		and GameState.documents_collected <= 8
		and not GameState.boiled_encounter_used
	)
	if boiled_allowed and _rng.randf() < 0.20:
		_spawn_boiled()
	else:
		_spawn_locust(false)

func _schedule_next_check() -> void:
	_next_check_at = _now() + _rng.randf_range(check_interval.x, check_interval.y)

func _spawn_locust(is_final: bool) -> Node:
	if locust_scene == null or _player == null:
		return null
	var position := Vector3.INF
	if not is_final and _forest != null and _forest.has_method("find_cover_near"):
		position = _forest.call("find_cover_near", _player.global_position, locust_distance.x, locust_distance.y, _rng)

	if position == Vector3.INF:
		var range_values := Vector2(24.0, 48.0) if is_final else locust_distance
		var angle := _rng.randf_range(0.0, TAU)
		var distance := _rng.randf_range(range_values.x, range_values.y)
		position = _player.global_position + Vector3(cos(angle), 0.0, sin(angle)) * distance

	if _terrain != null and _terrain.has_method("sample_height"):
		position.y = float(_terrain.call("sample_height", position.x, position.z)) + 0.05

	var locust := locust_scene.instantiate()
	get_parent().add_child(locust)
	locust.global_position = position
	if locust.has_signal("encounter_finished"):
		locust.encounter_finished.connect(_on_encounter_finished.bind(locust))
	if locust.has_signal("player_caught"):
		locust.player_caught.connect(_on_player_caught)
	if locust.has_method("begin_encounter"):
		locust.call("begin_encounter", _player, is_final)
	if not is_final:
		_active_encounter = locust
		_cooldown_until = _now() + event_cooldown
	return locust

func _spawn_boiled() -> void:
	if boiled_scene == null or _player == null:
		return
	var angle := _rng.randf_range(0.0, TAU)
	var distance := _rng.randf_range(boiled_distance.x, boiled_distance.y)
	var position := _player.global_position + Vector3(cos(angle), 0.0, sin(angle)) * distance
	if _terrain != null and _terrain.has_method("sample_height"):
		position.y = float(_terrain.call("sample_height", position.x, position.z))

	var boiled := boiled_scene.instantiate()
	get_parent().add_child(boiled)
	boiled.global_position = position
	if boiled.has_signal("encounter_finished"):
		boiled.encounter_finished.connect(_on_encounter_finished.bind(boiled))
	if boiled.has_method("begin_encounter"):
		boiled.call("begin_encounter", _player)
	_active_encounter = boiled
	_cooldown_until = _now() + event_cooldown

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
	for i in final_locust_count:
		_spawn_locust(true)

func _on_player_caught(locust: Node) -> void:
	if _death_busy or not is_instance_valid(locust):
		return
	_death_busy = true

	# Freeze the chase during the authored death shot; keep the caught creature visible.
	for monster: Node in get_tree().get_nodes_in_group("ff_monster"):
		if is_instance_valid(monster):
			monster.set_process(false)
			monster.set_physics_process(false)

	var death_controller := LOCUST_DEATH_CONTROLLER.new()
	death_controller.name = "LocustDeathController_Runtime"
	get_parent().add_child(death_controller)
	await death_controller.call("play_and_recover", _player, locust, _terrain)

	# A restored save starts from a clean encounter state.
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
