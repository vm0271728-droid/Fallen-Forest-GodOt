extends Node

signal hard_silence_started
signal silence_released
signal wind_strength_changed(value: float)

@export var normal_wind_strength := 0.40
@export var final_wind_strength := 0.70

var hard_silenced := false
var current_wind_strength := 0.40

func _ready() -> void:
	current_wind_strength = normal_wind_strength
	if not GameState.final_run_started.is_connected(_on_final_run_started):
		GameState.final_run_started.connect(_on_final_run_started)

func _on_final_run_started() -> void:
	if hard_silenced:
		return
	set_wind_strength(final_wind_strength)

func set_wind_strength(value: float) -> void:
	current_wind_strength = maxf(0.0, value)
	wind_strength_changed.emit(current_wind_strength)

func hard_silence() -> void:
	if hard_silenced:
		return
	hard_silenced = true
	set_wind_strength(0.0)
	_stop_audio_recursive(get_tree().root)
	hard_silence_started.emit()

func release_silence() -> void:
	if not hard_silenced:
		return
	hard_silenced = false
	set_wind_strength(final_wind_strength if GameState.final_run_active else normal_wind_strength)
	silence_released.emit()

func can_play_audio() -> bool:
	return not hard_silenced

func _stop_audio_recursive(node: Node) -> void:
	if node is AudioStreamPlayer:
		(node as AudioStreamPlayer).stop()
	elif node is AudioStreamPlayer2D:
		(node as AudioStreamPlayer2D).stop()
	elif node is AudioStreamPlayer3D:
		(node as AudioStreamPlayer3D).stop()
	for child: Node in node.get_children():
		_stop_audio_recursive(child)
