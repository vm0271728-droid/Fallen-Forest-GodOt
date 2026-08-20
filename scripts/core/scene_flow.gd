extends Node

const MENU_SCENE := "res://scenes/ui/main_menu.tscn"
const LOADING_SCENE := "res://scenes/ui/loading_screen.tscn"
const GAME_SCENE := "res://scenes/main/main.tscn"

var pending_scene := ""

func start_new_game() -> void:
	AudioDirector.release_silence()
	SaveSystem.request_new_run()
	_load_scene_through_loading_screen(GAME_SCENE)

func continue_game() -> void:
	if not SaveSystem.has_valid_run():
		return
	AudioDirector.release_silence()
	_load_scene_through_loading_screen(GAME_SCENE)

func go_to_main_menu() -> void:
	pending_scene = ""
	AudioDirector.release_silence()
	var error := get_tree().change_scene_to_file(MENU_SCENE)
	if error != OK:
		push_error("Fallen Forest: unable to return to main menu (error %d)." % error)

func quit_game() -> void:
	get_tree().quit()

func _load_scene_through_loading_screen(scene_path: String) -> void:
	if scene_path.is_empty():
		return
	pending_scene = scene_path
	var error := get_tree().change_scene_to_file(LOADING_SCENE)
	if error != OK:
		pending_scene = ""
		push_error("Fallen Forest: unable to open loading screen for %s (error %d)." % [scene_path, error])
