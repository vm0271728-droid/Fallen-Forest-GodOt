extends Node

const ANDROID_LOG_DIR := "/storage/emulated/0/.Fallen-Forest"
const USER_LOG_DIR := "user://.Fallen-Forest"

var log_path: String
var file: FileAccess
var started_at := Time.get_datetime_string_from_system()

func _ready() -> void:
	log_path = _get_log_path()
	DirAccess.make_dir_recursive_absolute(log_path.get_base_dir())
	file = FileAccess.open(log_path, FileAccess.WRITE)
	write("=== Fallen Forest started ===")
	write("Time: " + started_at)
	write("Godot: " + Engine.get_version_info().string)
	write("Log path: " + log_path)

func _get_log_path() -> String:
	if OS.get_name() == "Android":
		return ANDROID_LOG_DIR + "/runtime.log"
	return USER_LOG_DIR + "/runtime.log"

func write(message: String) -> void:
	if file == null:
		return
	file.store_line("[%s] %s" % [Time.get_time_string_from_system(), message])
	file.flush()

func copy_logs() -> void:
	if FileAccess.file_exists(log_path):
		DisplayServer.clipboard_set(FileAccess.get_file_as_string(log_path))

func _notification(what: int) -> void:
	if what == NOTIFICATION_WM_CLOSE_REQUEST:
		write("Window close requested")
	elif what == NOTIFICATION_CRASH:
		write("Crash detected")
