extends Node3D
class_name BoiledAI

signal event_started

# Fallen Forest - Boiled One T3 behaviour
# Observe -> Gaze Event -> Vanish

var watching := false
var gaze_time := 0.0
var active_event := false

@export var trigger_time := 5.0

func check_visibility(player_visible: bool, blocked: bool, delta: float):
	if blocked or not player_visible:
		gaze_time = 0.0
		watching = false
		return

	watching = true
	gaze_time += delta

	if gaze_time >= trigger_time and not active_event:
		start_gaze_event()

func start_gaze_event():
	active_event = true
	event_started.emit()

func vanish():
	active_event = false
	gaze_time = 0.0
	watching = false

# T3:
# - real LOS only
# - trees, grass and objects block detection
# - camera fixation
# - movement slowdown
# - tinnitus and environment suppression
# - disappear exactly during eye closing moment
