extends Node

var last_player_position := Vector3.ZERO
var has_player_position := false

func begin_new_run() -> void:
	GameState.begin_new_run(randi())
	last_player_position = Vector3.ZERO
	has_player_position = false

func request_new_run() -> void:
	begin_new_run()

func consume_new_run_request() -> bool:
	return true

func has_run() -> bool:
	return false

func has_valid_run() -> bool:
	return false

func save_player_position(_position: Vector3) -> void:
	return

func mark_document(slot: int, _player_position: Vector3) -> bool:
	return GameState.collect_document(slot)

func save_run() -> void:
	return

func load_run() -> Dictionary:
	return {}

func delete_run() -> void:
	begin_new_run()
