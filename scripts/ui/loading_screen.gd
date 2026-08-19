extends Control

@onready var title_label: Label = $Center/Title
@onready var loading_label: Label = $Center/Loading
@onready var progress_fill: ColorRect = $ProgressFill

var _target := ""
var _progress := []

func _ready() -> void:
	_target = str(SceneFlow.pending_scene)
	var ru := str(Settings.get("language")) == "ru"
	title_label.text = "FALLEN FOREST"
	loading_label.text = "Загрузка..." if ru else "Loading..."
	progress_fill.anchor_right = 0.0
	if _target.is_empty():
		push_error("Fallen Forest loading screen opened without pending scene.")
		SceneFlow.go_to_main_menu()
		return
	var error := ResourceLoader.load_threaded_request(_target, "", true)
	if error != OK:
		push_error("Fallen Forest: threaded scene load could not start: %s" % _target)
		SceneFlow.go_to_main_menu()

func _process(_delta: float) -> void:
	if _target.is_empty():
		return
	_progress.clear()
	var status := ResourceLoader.load_threaded_get_status(_target, _progress)
	var value := 0.0
	if not _progress.is_empty():
		value = clampf(float(_progress[0]), 0.0, 1.0)
	progress_fill.anchor_right = value

	match status:
		ResourceLoader.THREAD_LOAD_LOADED:
			var resource := ResourceLoader.load_threaded_get(_target)
			_target = ""
			SceneFlow.pending_scene = ""
			if resource is PackedScene:
				get_tree().change_scene_to_packed(resource as PackedScene)
			else:
				push_error("Fallen Forest: loaded gameplay resource is not PackedScene.")
				SceneFlow.go_to_main_menu()
		ResourceLoader.THREAD_LOAD_FAILED, ResourceLoader.THREAD_LOAD_INVALID_RESOURCE:
			push_error("Fallen Forest: threaded scene load failed.")
			_target = ""
			SceneFlow.pending_scene = ""
			SceneFlow.go_to_main_menu()
