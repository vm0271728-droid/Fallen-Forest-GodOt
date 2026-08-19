extends Node

const MENU_SCENE := "res://scenes/ui/main_menu.tscn"
const GAME_SCENE := "res://scenes/main/main.tscn"

func start_new_game() -> void:
	AudioDirector.release_silence()
	SaveSystem.clear_run()
	get_tree().change_scene_to_file(GAME_SCENE)

func continue_game() -> void:
	if not SaveSystem.has_run():
		return
	AudioDirector.release_silence()
	get_tree().change_scene_to_file(GAME_SCENE)

func go_to_main_menu() -> void:
	AudioDirector.release_silence()
	get_tree().change_scene_to_file(MENU_SCENE)

func quit_game() -> void:
	get_tree().quit()
