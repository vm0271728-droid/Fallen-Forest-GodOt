extends Node

const LOG_DIR := "/storage/emulated/0/.Fallen-Forest"
const LOG_PATH := LOG_DIR + "/runtime.log"

var log_file: FileAccess

func _ready() -> void:
	_open_log()
	write_log("Fallen Forest started")

func _open_log() -> void:
	DirAccess.make_dir_recursive_absolute(LOG_DIR)
	log_file = FileAccess.open(LOG_PATH, FileAccess.WRITE_READ)
	if log_file:
		log_file.seek_end()

func write_log(message: String) -> void:
	if not log_file:
		return
	log_file.store_line("[%s] %s" % [Time.get_datetime_string_from_system(), message])
	log_file.flush()

func get_log_path() -> String:
	return LOG_PATH

func copy_log_to_clipboard() -> void:
	if FileAccess.file_exists(LOG_PATH):
		DisplayServer.clipboard_set(FileAccess.get_file_as_string(LOG_PATH))
