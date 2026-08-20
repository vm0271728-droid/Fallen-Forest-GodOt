extends CharacterBody3D
class_name LocustAI

# Fallen Forest - Locust T3 behaviour implementation
# Hidden / Observe / Retreat / Rage / Chase

signal state_changed(state)

enum State { HIDDEN, OBSERVE, RETREAT, RAGE, CHASE }

var state: State = State.HIDDEN
var target: Node3D
var aggression := 0.0

@export var observe_distance := 70.0
@export var rage_distance := 15.0
@export var retreat_distance := 35.0
@export var chase_speed := 6.0

func set_state(new_state: State):
	state = new_state
	state_changed.emit(state)

func update_ai(player: Node3D, delta: float):
	target = player
	var distance := global_position.distance_to(player.global_position)

	match state:
		State.HIDDEN:
			if distance < observe_distance:
				set_state(State.OBSERVE)
		State.OBSERVE:
			if distance < rage_distance:
				set_state(State.RAGE)
		State.RETREAT:
			if distance < rage_distance:
				set_state(State.RAGE)
			elif distance > retreat_distance:
				set_state(State.HIDDEN)
		State.RAGE:
			set_state(State.CHASE)
		State.CHASE:
			velocity = global_position.direction_to(player.global_position) * chase_speed
			move_and_slide()

func trigger_retreat():
	set_state(State.RETREAT)

func trigger_rage():
	set_state(State.RAGE)

# T3 animation hooks:
# FarHide_A / FarHide_B / MediumHide / CloseHide_A / CloseHide_B
# Rage -> arm supported chase
# FrontKill / RearKill delegated to death controller
