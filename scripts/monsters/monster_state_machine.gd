class_name MonsterStateMachine
extends Node

signal state_changed(old_state, new_state)

var state := "idle"

func change_state(new_state: String):
	if state == new_state:
		return
	var old = state
	state = new_state
	state_changed.emit(old, new_state)

func is_state(value: String) -> bool:
	return state == value
