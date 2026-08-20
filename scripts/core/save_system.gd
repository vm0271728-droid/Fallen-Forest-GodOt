extends Node

const SAVE_PATH := "user://run_save.json"

var last_player_position := Vector3.ZERO
var has_player_position := false
var _force_new_run_pending := false

func begin_new_run() -> void:
	var rng := RandomNumberGenerator.new()
	rng.randomize()
	GameState.begin_new_run(rng.randi_range(100000, 2147483646))
	last_player_position = Vector3.ZERO
	has_player_position = false
	save_run()

func request_new_run() -> void:
	# Keep an in-memory intent flag as a safety net. Even if Android storage
	# refuses to delete an old file, Main must never reinterpret NEW GAME as
	# CONTINUE during this app session.
	_force_new_run_pending = true
	delete_run()

func consume_new_run_request() -> bool:
	var requested := _force_new_run_pending
	_force_new_run_pending = false
	return requested

func has_run() -> bool:
	return FileAccess.file_exists(SAVE_PATH)

func has_valid_run() -> bool:
	return not _read_valid_save_data().is_empty()

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
		"flashlight_acquired": GameState.flashlight_acquired,
		"final_run_active": GameState.final_run_active,
		"has_player_position": has_player_position,
		"player_position": [last_player_position.x, last_player_position.y, last_player_position.z],
	}
	var file := FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	if file == null:
		push_error("Fallen Forest: unable to open save file for writing.")
		return
	file.store_string(JSON.stringify(payload))
	file.flush()
	file.close()

func load_run() -> Dictionary:
	var data := _read_valid_save_data()
	if data.is_empty():
		return {}

	GameState.restore(data)
	has_player_position = bool(data.get("has_player_position", false))
	var position_value = data.get("player_position", null)
	if has_player_position and position_value is Array and position_value.size() >= 3:
		last_player_position = Vector3(
			float(position_value[0]),
			float(position_value[1]),
			float(position_value[2])
		)
	else:
		has_player_position = false
		last_player_position = Vector3.ZERO
	return data

func _read_valid_save_data() -> Dictionary:
	if not has_run():
		return {}
	var file := FileAccess.open(SAVE_PATH, FileAccess.READ)
	if file == null:
		push_warning("Fallen Forest: save file exists but cannot be opened.")
		return {}
	var text := file.get_as_text()
	file.close()
	var parsed = JSON.parse_string(text)
	if typeof(parsed) != TYPE_DICTIONARY:
		push_warning("Fallen Forest: save file is invalid and cannot be continued.")
		return {}

	var data: Dictionary = parsed
	if int(data.get("version", 0)) != 1:
		push_warning("Fallen Forest: unsupported save version; it cannot be continued.")
		return {}
	if not data.has("run_seed") or int(data.get("run_seed", 0)) <= 0:
		push_warning("Fallen Forest: save has no valid run seed; it cannot be continued.")
		return {}
	return data

func delete_run() -> void:
	if FileAccess.file_exists(SAVE_PATH):
		var error := DirAccess.remove_absolute(ProjectSettings.globalize_path(SAVE_PATH))
		if error != OK:
			push_warning("Fallen Forest: unable to remove old save file (error %d)." % error)
	GameState.begin_new_run(0)
	last_player_position = Vector3.ZERO
	has_player_position = false
