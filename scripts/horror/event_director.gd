extends Node

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
	if _death_busy:
		return
	_death_busy = true
	_player.set_controls_enabled(false)
	_player.set_look_enabled(false)

	# Temporary playable recovery until the authored front/rear death cinematics are implemented.
	var overlay := _make_blackout()
	var black: ColorRect = overlay.get_node("Black")
	var fade_in := create_tween()
	fade_in.tween_property(black, "color:a", 1.0, 0.25)
	await fade_in.finished
	await get_tree().create_timer(0.35).timeout

	if SaveSystem.has_run():
		SaveSystem.load_run()
	if SaveSystem.has_player_position:
		_player.teleport_to(SaveSystem.last_player_position)
	elif _terrain != null and _terrain.has_method("sample_height"):
		_player.teleport_to(Vector3(0.0, float(_terrain.call("sample_height", 0.0, 0.0)) + 0.06, 0.0))

	if is_instance_valid(locust):
		locust.queue_free()
	_player.set_look_enabled(true)
	_player.set_controls_enabled(true)
	var fade_out := create_tween()
	fade_out.tween_property(black, "color:a", 0.0, 0.35)
	await fade_out.finished
	overlay.queue_free()
	_death_busy = false

func _make_blackout() -> CanvasLayer:
	var layer := CanvasLayer.new()
	layer.layer = 120
	var black := ColorRect.new()
	black.name = "Black"
	black.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	black.mouse_filter = Control.MOUSE_FILTER_IGNORE
	black.color = Color(0.0, 0.0, 0.0, 0.0)
	layer.add_child(black)
	get_tree().root.add_child(layer)
	return layer

func _now() -> float:
	return Time.get_ticks_msec() / 1000.0
