extends Control

@onready var title_label: Label = $Layout/Title
@onready var continue_button: Button = $Layout/Buttons/Continue
@onready var new_game_button: Button = $Layout/Buttons/NewGame
@onready var settings_button: Button = $Layout/Buttons/Settings
@onready var credits_button: Button = $Layout/Buttons/Credits
@onready var quit_button: Button = $Layout/Buttons/Quit

func _ready() -> void:
	new_game_button.pressed.connect(SceneFlow.start_new_game)
	continue_button.pressed.connect(SceneFlow.continue_game)
	settings_button.pressed.connect(_show_settings)
	credits_button.pressed.connect(_show_credits)
	quit_button.pressed.connect(SceneFlow.quit_game)
	continue_button.disabled = not SaveSystem.has_valid_run()
	_apply_language()
	if not Engine.has_meta("fallen_forest_warning_shown"):
		Engine.set_meta("fallen_forest_warning_shown", true)
		call_deferred("_show_startup_warning")

func _apply_language() -> void:
	var ru := Settings.language == "ru"
	title_label.text = "FALLEN FOREST"
	new_game_button.text = "НОВАЯ ИГРА" if ru else "NEW GAME"
	continue_button.text = "ПРОДОЛЖИТЬ" if ru else "CONTINUE"
	settings_button.text = "НАСТРОЙКИ" if ru else "SETTINGS"
	credits_button.text = "АВТОРЫ" if ru else "CREDITS"
	quit_button.text = "ВЫХОД" if ru else "QUIT"

func _show_startup_warning() -> void:
	var ru := Settings.language == "ru"
	var body := (
		"Игра содержит скримеры, резкие громкие звуки, мигающие изображения и сцены, которые могут быть нежелательны при фоточувствительной эпилепсии.\n\nРекомендуются наушники."
		if ru else
		"This game contains jumpscares, sudden loud sounds, flashing imagery, and scenes that may be unsuitable for people with photosensitive epilepsy.\n\nHeadphones are recommended."
	)
	var accept := "ПОНЯТНО" if ru else "I UNDERSTAND"
	_show_modal("ПРЕДУПРЕЖДЕНИЕ" if ru else "WARNING", body, accept)

func _show_settings() -> void:
	var ru := Settings.language == "ru"
	var overlay := _new_overlay("SettingsOverlay")
	var panel := _new_panel(overlay, Vector2(520, 430))
	var box := VBoxContainer.new()
	box.add_theme_constant_override("separation", 18)
	panel.add_child(box)

	var heading := Label.new()
	heading.text = "НАСТРОЙКИ" if ru else "SETTINGS"
	heading.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	heading.add_theme_font_size_override("font_size", 30)
	box.add_child(heading)

	var sensitivity_label := Label.new()
	sensitivity_label.text = "Чувствительность" if ru else "Sensitivity"
	box.add_child(sensitivity_label)
	var sensitivity := HSlider.new()
	sensitivity.min_value = 0.30
	sensitivity.max_value = 2.50
	sensitivity.step = 0.05
	sensitivity.value = Settings.sensitivity
	sensitivity.value_changed.connect(func(value: float):
		Settings.set_sensitivity(value)
	)
	box.add_child(sensitivity)

	var shake_label := Label.new()
	shake_label.text = "Тряска камеры" if ru else "Camera shake"
	box.add_child(shake_label)
	var shake := HSlider.new()
	shake.min_value = 0.0
	shake.max_value = 1.0
	shake.step = 0.05
	shake.value = Settings.camera_shake
	shake.value_changed.connect(func(value: float):
		Settings.set_camera_shake(value)
	)
	box.add_child(shake)

	var language := Button.new()
	language.text = ("Язык: Русский" if ru else "Language: English")
	language.pressed.connect(func():
		var next := "en" if Settings.language == "ru" else "ru"
		Settings.set_language(next)
		overlay.queue_free()
		_apply_language()
		_show_settings()
	)
	box.add_child(language)

	var fov_note := Label.new()
	fov_note.text = "FOV: 75° (фиксировано)" if ru else "FOV: 75° (fixed)"
	fov_note.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	fov_note.modulate = Color(0.65, 0.65, 0.68, 1)
	box.add_child(fov_note)

	var close := Button.new()
	close.text = "НАЗАД" if ru else "BACK"
	close.pressed.connect(overlay.queue_free)
	box.add_child(close)

func _show_credits() -> void:
	var ru := Settings.language == "ru"
	var text := (
		"Идея: Meric23\nРеализовал: Meric23\n\nНекоммерческий фанатский проект.\nМодели существ: Doctor Nowhere / соответствующие авторы исходных ассетов.\nПолные лицензии и атрибуции хранятся вместе с проектом."
		if ru else
		"Idea by: Meric23\nDeveloped by: Meric23\n\nFree non-commercial fan project.\nCreature concepts/assets: Doctor Nowhere / respective source asset authors.\nFull licenses and attribution are stored with the project."
	)
	_show_modal("АВТОРЫ" if ru else "CREDITS", text, "НАЗАД" if ru else "BACK")

func _show_modal(heading_text: String, body_text: String, button_text: String) -> void:
	var overlay := _new_overlay("ModalOverlay")
	var panel := _new_panel(overlay, Vector2(650, 430))
	var box := VBoxContainer.new()
	box.add_theme_constant_override("separation", 20)
	panel.add_child(box)
	var heading := Label.new()
	heading.text = heading_text
	heading.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	heading.add_theme_font_size_override("font_size", 32)
	box.add_child(heading)
	var body := Label.new()
	body.text = body_text
	body.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	body.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	body.custom_minimum_size = Vector2(0, 245)
	body.add_theme_font_size_override("font_size", 19)
	box.add_child(body)
	var close := Button.new()
	close.text = button_text
	close.custom_minimum_size = Vector2(0, 54)
	close.pressed.connect(overlay.queue_free)
	box.add_child(close)

func _new_overlay(node_name: String) -> Control:
	var overlay := ColorRect.new()
	overlay.name = node_name
	overlay.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	overlay.color = Color(0.0, 0.0, 0.0, 0.84)
	overlay.mouse_filter = Control.MOUSE_FILTER_STOP
	add_child(overlay)
	return overlay

func _new_panel(overlay: Control, size: Vector2) -> PanelContainer:
	var panel := PanelContainer.new()
	panel.custom_minimum_size = size
	panel.set_anchors_preset(Control.PRESET_CENTER)
	panel.position = -size * 0.5
	panel.add_theme_constant_override("margin_left", 28)
	panel.add_theme_constant_override("margin_right", 28)
	panel.add_theme_constant_override("margin_top", 24)
	panel.add_theme_constant_override("margin_bottom", 24)
	overlay.add_child(panel)
	return panel
