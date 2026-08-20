extends Node3D

const WAKE_UP_SEQUENCE := preload("res://scripts/cinematics/wake_up_sequence.gd")
const ANDROID_TREE_COUNT := 2200
const ANDROID_GRASS_COUNT := 8000
const ANDROID_COLLISION_POOL_SIZE := 160
const ANDROID_COLLISION_RADIUS := 64.0
const ANDROID_PERF_SAMPLE_INTERVAL := 5.0
const BYTES_PER_MIB := 1048576.0
const ANDROID_PERF_REPORT_PATH := "user://android_performance.csv"

@onready var terrain: Node = $Terrain
@onready var player: CharacterBody3D = $Player
@onready var flashlight_pickup: Node3D = $FlashlightPickup

var _fresh_run := false
var _android_perf_enabled := false
var _android_perf_elapsed := 0.0
var _android_perf_frame_time_total_ms := 0.0
var _android_perf_frame_count := 0
var _android_perf_worst_frame_ms := 0.0
var _android_perf_started_msec := 0
var _android_perf_file: FileAccess

func _enter_tree() -> void:
	_apply_android_runtime_profile()
	_start_android_performance_probe()

	# NEW GAME has priority over any stale file left behind by storage failure.
	if SaveSystem.consume_new_run_request():
		_fresh_run = true
		SaveSystem.begin_new_run()
	elif SaveSystem.has_run():
		var loaded := SaveSystem.load_run()
		if loaded.is_empty():
			SaveSystem.delete_run()
			_fresh_run = true
			SaveSystem.begin_new_run()
		else:
			_fresh_run = false
	else:
		_fresh_run = true
		SaveSystem.begin_new_run()

func _ready() -> void:
	if terrain != null and terrain.has_method("generate") and not bool(terrain.get("generated")):
		terrain.call("generate")

	if SaveSystem.has_player_position:
		player.global_position = SaveSystem.last_player_position
	elif terrain != null and terrain.has_method("sample_height"):
		player.global_position = Vector3(0.0, float(terrain.call("sample_height", 0.0, 0.0)) + 0.06, 0.0)

	if is_instance_valid(flashlight_pickup):
		if GameState.flashlight_acquired:
			flashlight_pickup.queue_free()
		elif terrain != null and terrain.has_method("sample_height"):
			var p := flashlight_pickup.global_position
			p.y = float(terrain.call("sample_height", p.x, p.z)) + 0.16
			flashlight_pickup.global_position = p

	if not GameState.final_run_started.is_connected(_on_final_run_started):
		GameState.final_run_started.connect(_on_final_run_started)

	if _fresh_run:
		call_deferred("_play_fresh_run_wake_up")

func _process(delta: float) -> void:
	if not _android_perf_enabled:
		return

	var frame_ms := delta * 1000.0
	_android_perf_elapsed += delta
	_android_perf_frame_time_total_ms += frame_ms
	_android_perf_frame_count += 1
	_android_perf_worst_frame_ms = maxf(_android_perf_worst_frame_ms, frame_ms)

	if _android_perf_elapsed < ANDROID_PERF_SAMPLE_INTERVAL:
		return

	_write_android_performance_sample()
	_android_perf_elapsed = 0.0
	_android_perf_frame_time_total_ms = 0.0
	_android_perf_frame_count = 0
	_android_perf_worst_frame_ms = 0.0

func _exit_tree() -> void:
	if _android_perf_file != null:
		_android_perf_file.flush()
		_android_perf_file.close()

func _apply_android_runtime_profile() -> void:
	if not OS.has_feature("android"):
		return

	var forest := get_node_or_null("ForestBlockout")
	if forest != null:
		forest.set("tree_count", mini(int(forest.get("tree_count")), ANDROID_TREE_COUNT))

	var grass := get_node_or_null("GrassSystem")
	if grass != null:
		grass.set("target_count", mini(int(grass.get("target_count")), ANDROID_GRASS_COUNT))

	var collision_manager := get_node_or_null("TreeCollisionManager")
	if collision_manager != null:
		collision_manager.set("pool_size", mini(int(collision_manager.get("pool_size")), ANDROID_COLLISION_POOL_SIZE))
		collision_manager.set("activation_radius", minf(float(collision_manager.get("activation_radius")), ANDROID_COLLISION_RADIUS))

	print("Fallen Forest Android profile: trees<=%d grass<=%d collision_pool<=%d radius<=%.1f." % [ANDROID_TREE_COUNT, ANDROID_GRASS_COUNT, ANDROID_COLLISION_POOL_SIZE, ANDROID_COLLISION_RADIUS])

func _start_android_performance_probe() -> void:
	if not OS.has_feature("android"):
		return

	_android_perf_enabled = true
	_android_perf_started_msec = Time.get_ticks_msec()
	_android_perf_file = FileAccess.open(ANDROID_PERF_REPORT_PATH, FileAccess.WRITE)
	if _android_perf_file == null:
		push_warning("Fallen Forest Android perf: cannot open %s (error %s)." % [ANDROID_PERF_REPORT_PATH, error_string(FileAccess.get_open_error())])
		return

	_android_perf_file.store_line("elapsed_s,fps,avg_frame_ms,worst_frame_ms,godot_static_mib,vram_mib,draw_calls,render_objects,player_x,player_y,player_z")
	_android_perf_file.flush()
	print("Fallen Forest Android perf: sampling every %.1fs to %s." % [ANDROID_PERF_SAMPLE_INTERVAL, ANDROID_PERF_REPORT_PATH])

func _write_android_performance_sample() -> void:
	var elapsed_s := float(Time.get_ticks_msec() - _android_perf_started_msec) / 1000.0
	var avg_frame_ms := 0.0
	if _android_perf_frame_count > 0:
		avg_frame_ms = _android_perf_frame_time_total_ms / float(_android_perf_frame_count)

	var fps := float(Engine.get_frames_per_second())
	var godot_static_mib := float(Performance.get_monitor(Performance.MEMORY_STATIC)) / BYTES_PER_MIB
	var vram_mib := float(Performance.get_monitor(Performance.RENDER_VIDEO_MEM_USED)) / BYTES_PER_MIB
	var draw_calls := int(Performance.get_monitor(Performance.RENDER_TOTAL_DRAW_CALLS_IN_FRAME))
	var render_objects := int(Performance.get_monitor(Performance.RENDER_TOTAL_OBJECTS_IN_FRAME))
	var player_position := Vector3.ZERO
	if is_instance_valid(player):
		player_position = player.global_position

	var row := "%.2f,%.1f,%.3f,%.3f,%.1f,%.1f,%d,%d,%.2f,%.2f,%.2f" % [
		elapsed_s,
		fps,
		avg_frame_ms,
		_android_perf_worst_frame_ms,
		godot_static_mib,
		vram_mib,
		draw_calls,
		render_objects,
		player_position.x,
		player_position.y,
		player_position.z,
	]

	if _android_perf_file != null:
		_android_perf_file.store_line(row)
		_android_perf_file.flush()

	print("Fallen Forest Android perf: fps=%.1f avg=%.2fms worst=%.2fms static=%.1fMiB vram=%.1fMiB draws=%d objects=%d." % [fps, avg_frame_ms, _android_perf_worst_frame_ms, godot_static_mib, vram_mib, draw_calls, render_objects])

func _play_fresh_run_wake_up() -> void:
	var wake := WAKE_UP_SEQUENCE.new()
	wake.name = "WakeUpSequence_Runtime"
	add_child(wake)
	await wake.call("play", player)
	if is_instance_valid(wake):
		wake.queue_free()

func _on_final_run_started() -> void:
	print("Fallen Forest: final run started (10/10 documents).")
