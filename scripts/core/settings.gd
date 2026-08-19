extends Node

signal language_changed(locale: String)
signal sensitivity_changed(value: float)
signal camera_shake_changed(value: float)

const CONFIG_PATH := "user://settings.cfg"
const DEFAULT_SENSITIVITY := 1.0
const DEFAULT_CAMERA_SHAKE := 0.70
const DEFAULT_LANGUAGE := "en"

var sensitivity: float = DEFAULT_SENSITIVITY
var camera_shake: float = DEFAULT_CAMERA_SHAKE
var language: String = DEFAULT_LANGUAGE

func _ready() -> void:
	load_settings()

func set_sensitivity(value: float) -> void:
	sensitivity = clampf(value, 0.3, 2.5)
	sensitivity_changed.emit(sensitivity)
	save_settings()

func set_camera_shake(value: float) -> void:
	camera_shake = clampf(value, 0.0, 1.0)
	camera_shake_changed.emit(camera_shake)
	save_settings()

func set_language(locale: String) -> void:
	language = "ru" if locale == "ru" else "en"
	TranslationServer.set_locale(language)
	language_changed.emit(language)
	save_settings()

func load_settings() -> void:
	var cfg := ConfigFile.new()
	if cfg.load(CONFIG_PATH) != OK:
		TranslationServer.set_locale(language)
		return
	sensitivity = clampf(float(cfg.get_value("controls", "sensitivity", DEFAULT_SENSITIVITY)), 0.3, 2.5)
	camera_shake = clampf(float(cfg.get_value("camera", "shake", DEFAULT_CAMERA_SHAKE)), 0.0, 1.0)
	language = str(cfg.get_value("localization", "language", DEFAULT_LANGUAGE))
	if language != "ru":
		language = "en"
	TranslationServer.set_locale(language)

func save_settings() -> void:
	var cfg := ConfigFile.new()
	cfg.set_value("controls", "sensitivity", sensitivity)
	cfg.set_value("camera", "shake", camera_shake)
	cfg.set_value("localization", "language", language)
	cfg.save(CONFIG_PATH)
