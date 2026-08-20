extends Node
class_name MonsterAnimationController

# Shared animation state bridge for Locust and Boiled

var current_animation := "Idle"

func play_locust_state(state: String):
	current_animation = state
	# AnimationTree hookup point:
	# Hidden, Observe, Retreat, Rage, Chase, FrontKill, RearKill

func play_boiled_state(state: String):
	current_animation = state
	# AnimationTree hookup point:
	# IdleSway, Gaze, Distort, Vanish
