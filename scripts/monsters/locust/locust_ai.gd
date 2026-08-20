extends CharacterBody3D
class_name LocustAI

# Fallen Forest - Locust T3 behaviour implementation

signal state_changed(state)

enum State { HIDDEN, OBSERVE, RETREAT, RAGE, CHASE }

var state: State = State.HIDDEN
var target: Node3D
var aggression := 0.0

@export var chase_speed := 6.0
@export var retreat_distance := 35.0

func set_state(new_state: State):
	state = new_state
	state_changed.emit(state)

func update_ai(player: Node3D, delta: float):
	target = player
	var distance = global_position.distance_to(player.global_position)

	match state:
		State.HIDDEN:
			if distance < 70.0:
				set_state(State.OBSERVE)
		State.OBSERVE:
			if distance < 15.0:
				set_state(State.RAGE)
		State.RAGE:
			set_state(State.CHASE)
		State.CHASE:
			velocity = global_position.direction_to(player.global_position) * chase_speed
			move_and_slide()
			if distance > retreat_distance:
				set_state(State.RETREAT)
		State.RETREAT:
			set_state(State.HIDDEN)

# Animation states required by T3:
# FarHide_A, FarHide_B, MediumHide, CloseHide_A, CloseHide_B
# Rage -> arm supported chase animation
# Front/Rear kill sequences handled by death controller
