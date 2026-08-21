extends Node

const LOG_DIR := "user://.Fallen-Forest"
const LOG_FILE := "user://.Fallen-Forest/runtime.log"

var file: FileAccess
var started_at := Time.get_datetime_string_from_system()

func _ready() -> void:
	DirAccess.make_dir_recursive_absolute(ProjectSettings.globalize_path(LOG_DIR))
	file = FileAccess.open(LOG_FILE, FileAccess.WRITE)
	write("=== Fallen Forest started ===")
	write("Time: " + started_at)
	write("Godot: " + Engine.get_version_info().string)

func write(message: String) -> void:
	if file == null:
		return
	file.store_line("[%s] %s" % [Time.get_time_string_from_system(), message])
	file.flush()

func copy_logs() -> void:
	if FileAccess.file_exists(LOG_FILE):
		DisplayServer.clipboard_set(FileAccess.get_file_as_string(LOG_FILE))

func _notification(what: int) -> void:
	if what == NOTIFICATION_WM_CLOSE_REQUEST:
		write("Window close requested")
	elif what == NOTIFICATION_CRASH:
		write("Crash detected")
