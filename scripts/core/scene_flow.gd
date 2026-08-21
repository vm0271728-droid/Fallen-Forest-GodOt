extends Node

const MENU_SCENE := "res://scenes/ui/main_menu.tscn"
const GAME_SCENE := "res://scenes/main/main.tscn"
const LOADING_SCENE := "res://scenes/ui/loading_screen.tscn"

var pending_scene: String = ""

func start_new_game() -> void:
	AudioDirector.release_silence()
	SaveSystem.begin_new_run()
	_load_game()

func continue_game() -> void:
	return

func go_to_main_menu() -> void:
	AudioDirector.release_silence()
	pending_scene = ""
	get_tree().change_scene_to_file(MENU_SCENE)

func quit_game() -> void:
	get_tree().quit()

func _load_game() -> void:
	pending_scene = GAME_SCENE
	var error := get_tree().change_scene_to_file(LOADING_SCENE)
	if error != OK:
		pending_scene = ""
		push_error("Fallen Forest: unable to open loading scene (error %d)." % error)
