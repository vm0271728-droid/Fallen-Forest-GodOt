extends Node3D

const WAKE_UP_SEQUENCE := preload("res://scripts/cinematics/wake_up_sequence.gd")

@onready var terrain: Node = $Terrain
@onready var player: CharacterBody3D = $Player
@onready var flashlight_pickup: Node3D = $FlashlightPickup

func _ready() -> void:
	SaveSystem.begin_new_run()

	if terrain != null and terrain.has_method("generate") and not bool(terrain.get("generated")):
		terrain.call("generate")

	if terrain != null and terrain.has_method("sample_height"):
		player.global_position = Vector3(0.0, float(terrain.call("sample_height", 0.0, 0.0)) + 0.06, 0.0)

	if is_instance_valid(flashlight_pickup) and GameState.flashlight_acquired:
		flashlight_pickup.queue_free()

	call_deferred("_play_fresh_run_wake_up")

func _play_fresh_run_wake_up() -> void:
	var wake := WAKE_UP_SEQUENCE.new()
	wake.name = "WakeUpSequence_Runtime"
	add_child(wake)
	await wake.call("play", player)
	if is_instance_valid(wake):
		wake.queue_free()

func _on_final_run_started() -> void:
	print("Fallen Forest: final run started (10/10 documents).")
