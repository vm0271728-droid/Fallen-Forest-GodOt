extends Node

var move_vector := Vector2.ZERO
var _look_delta := Vector2.ZERO

func set_move_vector(value: Vector2) -> void:
	move_vector = value.limit_length(1.0)

func add_look_delta(value: Vector2) -> void:
	_look_delta += value

func consume_look_delta() -> Vector2:
	var value := _look_delta
	_look_delta = Vector2.ZERO
	return value

func reset() -> void:
	move_vector = Vector2.ZERO
	_look_delta = Vector2.ZERO
