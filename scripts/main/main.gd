extends Node3D

const WAKE_UP_SEQUENCE := preload("res://scripts/cinematics/wake_up_sequence.gd")
const ANDROID_TREE_COUNT := 2200
const ANDROID_GRASS_COUNT := 8000
const ANDROID_COLLISION_POOL_SIZE := 160
const ANDROID_COLLISION_RADIUS := 64.0

@onready var terrain: Node = $Terrain
@onready var player: CharacterBody3D = $Player
@onready var flashlight_pickup: Node3D = $FlashlightPickup

var _fresh_run := false

func _enter_tree() -> void:
	_apply_android_runtime_profile()

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

func _play_fresh_run_wake_up() -> void:
	var wake := WAKE_UP_SEQUENCE.new()
	wake.name = "WakeUpSequence_Runtime"
	add_child(wake)
	await wake.call("play", player)
	if is_instance_valid(wake):
		wake.queue_free()

func _on_final_run_started() -> void:
	print("Fallen Forest: final run started (10/10 documents).")
