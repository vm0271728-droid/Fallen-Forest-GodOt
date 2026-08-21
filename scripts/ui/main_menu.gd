extends Control

@onready var title_label: Label = $Layout/Title
@onready var new_game_button: Button = $Layout/Buttons/NewGame
@onready var settings_button: Button = $Layout/Buttons/Settings
@onready var credits_button: Button = $Layout/Buttons/Credits
@onready var quit_button: Button = $Layout/Buttons/Quit

func _ready() -> void:
	new_game_button.pressed.connect(SceneFlow.start_new_game)
	settings_button.pressed.connect(_show_settings)
	credits_button.pressed.connect(_show_credits)
	quit_button.pressed.connect(SceneFlow.quit_game)
	_apply_language()

func _apply_language() -> void:
	var ru := Settings.language == "ru"
	title_label.text = "FALLEN FOREST"
	new_game_button.text = "НОВАЯ ИГРА" if ru else "NEW GAME"
	settings_button.text = "НАСТРОЙКИ" if ru else "SETTINGS"
	credits_button.text = "АВТОРЫ" if ru else "CREDITS"
	quit_button.text = "ВЫХОД" if ru else "QUIT"

func _show_settings() -> void:
	var ru := Settings.language == "ru"
	var overlay := _new_overlay("SettingsOverlay")
	var panel := _new_panel(overlay, Vector2(520, 360))
	var box := VBoxContainer.new()
	box.add_theme_constant_override("separation", 18)
	panel.add_child(box)

	var heading := Label.new()
	heading.text = "НАСТРОЙКИ" if ru else "SETTINGS"
	heading.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	box.add_child(heading)

	var sensitivity := HSlider.new()
	sensitivity.min_value = 0.30
	sensitivity.max_value = 2.50
	sensitivity.value = Settings.sensitivity
	sensitivity.value_changed.connect(Settings.set_sensitivity)
	box.add_child(sensitivity)

	var shake := HSlider.new()
	shake.min_value = 0.0
	shake.max_value = 1.0
	shake.value = Settings.camera_shake
	shake.value_changed.connect(Settings.set_camera_shake)
	box.add_child(shake)

	var language := Button.new()
	language.text = "Язык" if ru else "Language"
	language.pressed.connect(func():
		Settings.set_language("en" if Settings.language == "ru" else "ru")
		overlay.queue_free()
		_apply_language()
		_show_settings()
	)
	box.add_child(language)

	var close := Button.new()
	close.text = "НАЗАД" if ru else "BACK"
	close.pressed.connect(overlay.queue_free)
	box.add_child(close)

func _show_credits() -> void:
	_show_modal("АВТОРЫ", "Idea and development: Meric23", "НАЗАД")

func _show_modal(title_text: String, body_text: String, button_text: String) -> void:
	var overlay := _new_overlay("ModalOverlay")
	var panel := _new_panel(overlay, Vector2(620, 320))
	var box := VBoxContainer.new()
	panel.add_child(box)
	var title := Label.new()
	title.text = title_text
	box.add_child(title)
	var body := Label.new()
	body.text = body_text
	body.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	box.add_child(body)
	var close := Button.new()
	close.text = button_text
	close.pressed.connect(overlay.queue_free)
	box.add_child(close)

func _new_overlay(node_name: String) -> Control:
	var overlay := ColorRect.new()
	overlay.name = node_name
	overlay.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	overlay.color = Color(0,0,0,0.84)
	overlay.mouse_filter = Control.MOUSE_FILTER_STOP
	add_child(overlay)
	return overlay

func _new_panel(overlay: Control, size: Vector2) -> PanelContainer:
	var panel := PanelContainer.new()
	panel.custom_minimum_size = size
	panel.set_anchors_preset(Control.PRESET_CENTER)
	panel.position = -size * 0.5
	overlay.add_child(panel)
	return panel
