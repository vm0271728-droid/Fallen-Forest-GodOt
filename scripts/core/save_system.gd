extends Node

const SAVE_PATH := "user://run_save.json"

var last_player_position := Vector3.ZERO
var has_player_position := false

func begin_new_run() -> void:
	var rng := RandomNumberGenerator.new()
	rng.randomize()
	GameState.begin_new_run(rng.randi_range(100000, 2147483646))
	last_player_position = Vector3.ZERO
	has_player_position = false
	save_run()

func has_run() -> bool:
	return FileAccess.file_exists(SAVE_PATH)

func save_player_position(position: Vector3) -> void:
	last_player_position = position
	has_player_position = true
	save_run()

func mark_document(slot: int, player_position: Vector3) -> bool:
	if not GameState.collect_document(slot):
		return false
	last_player_position = player_position
	has_player_position = true
	save_run()
	return true

func save_run() -> void:
	var payload := {
		"version": 1,
		"run_seed": GameState.run_seed,
		"documents_collected": GameState.documents_collected,
		"document_mask": GameState.document_mask,
		"boiled_encounter_used": GameState.boiled_encounter_used,
		"boiled_influenced": GameState.boiled_influenced,
		"final_run_active": GameState.final_run_active,
		"has_player_position": has_player_position,
		"player_position": [last_player_position.x, last_player_position.y, last_player_position.z],
	}
	var file := FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	if file == null:
		push_error("Fallen Forest: unable to open save file for writing.")
		return
	file.store_string(JSON.stringify(payload))

func load_run() -> Dictionary:
	if not has_run():
		return {}
	var file := FileAccess.open(SAVE_PATH, FileAccess.READ)
	if file == null:
		return {}
	var parsed = JSON.parse_string(file.get_as_text())
	if typeof(parsed) != TYPE_DICTIONARY:
		push_warning("Fallen Forest: save file is invalid; starting fresh is recommended.")
		return {}

	var data: Dictionary = parsed
	GameState.restore(data)
	has_player_position = bool(data.get("has_player_position", false))
	var p: Array = data.get("player_position", [0.0, 0.0, 0.0])
	if p.size() >= 3:
		last_player_position = Vector3(float(p[0]), float(p[1]), float(p[2]))
	return data

func delete_run() -> void:
	if FileAccess.file_exists(SAVE_PATH):
		DirAccess.remove_absolute(ProjectSettings.globalize_path(SAVE_PATH))
	GameState.begin_new_run(0)
	last_player_position = Vector3.ZERO
	has_player_position = false
