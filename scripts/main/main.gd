extends Node3D

@onready var terrain: Node = $Terrain
@onready var player: CharacterBody3D = $Player
@onready var flashlight_pickup: Node3D = $FlashlightPickup

func _enter_tree() -> void:
	# World/document children need a valid deterministic seed before their _ready() methods run.
	if SaveSystem.has_run():
		SaveSystem.load_run()
	else:
		SaveSystem.begin_new_run()

func _ready() -> void:
	if terrain != null and terrain.has_method("generate") and not bool(terrain.get("generated")):
		terrain.call("generate")

	if SaveSystem.has_player_position:
		player.global_position = SaveSystem.last_player_position
	elif terrain != null and terrain.has_method("sample_height"):
		player.global_position = Vector3(0.0, float(terrain.call("sample_height", 0.0, 0.0)) + 0.06, 0.0)

	if is_instance_valid(flashlight_pickup) and terrain != null and terrain.has_method("sample_height"):
		var p := flashlight_pickup.global_position
		p.y = float(terrain.call("sample_height", p.x, p.z)) + 0.16
		flashlight_pickup.global_position = p

	if not GameState.final_run_started.is_connected(_on_final_run_started):
		GameState.final_run_started.connect(_on_final_run_started)

func _on_final_run_started() -> void:
	print("Fallen Forest: final run started (10/10 documents).")
