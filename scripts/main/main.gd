extends Node3D

@onready var player: CharacterBody3D = $Player

func _ready() -> void:
	if SaveSystem.has_run():
		SaveSystem.load_run()
	else:
		SaveSystem.begin_new_run()

	if SaveSystem.has_player_position:
		player.global_position = SaveSystem.last_player_position

	GameState.final_run_started.connect(_on_final_run_started)

func _on_final_run_started() -> void:
	print("Fallen Forest: final run started (10/10 documents).")
