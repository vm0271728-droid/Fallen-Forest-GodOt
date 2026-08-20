extends Node3D
class_name BoiledAI

signal event_started

# Fallen Forest - Boiled One T3 behaviour

var watching := false
var gaze_time := 0.0

@export var trigger_time := 5.0

func check_visibility(player_camera: Camera3D, blocked: bool, delta: float):
	if blocked:
		gaze_time = 0.0
		watching = false
		return

	watching = true
	gaze_time += delta

	if gaze_time >= trigger_time:
		start_gaze_event()

func start_gaze_event():
	event_started.emit()
	gaze_time = 0.0

# T3:
# - activates only through real line of sight
# - vegetation and objects can block detection
# - camera focus event
# - player slowdown
# - tinnitus / environment suppression
# - disappear during eye closing moment
