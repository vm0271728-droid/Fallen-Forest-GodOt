extends Control

@export var joystick_radius := 105.0
@export var look_scale := 1.0

var _move_touch := -1
var _look_touch := -1
var _move_origin := Vector2.ZERO
var _move_position := Vector2.ZERO

func _ready() -> void:
	mouse_filter = Control.MOUSE_FILTER_IGNORE
	set_process_input(true)
	queue_redraw()

func _input(event: InputEvent) -> void:
	if event is InputEventScreenTouch:
		_handle_touch(event)
	elif event is InputEventScreenDrag:
		_handle_drag(event)

func _handle_touch(event: InputEventScreenTouch) -> void:
	var half := get_viewport_rect().size.x * 0.5
	if event.pressed:
		if event.position.x < half and _move_touch == -1:
			_move_touch = event.index
			_move_origin = event.position
			_move_position = event.position
			InputState.set_move_vector(Vector2.ZERO)
			queue_redraw()
		elif event.position.x >= half and _look_touch == -1:
			_look_touch = event.index
	else:
		if event.index == _move_touch:
			_move_touch = -1
			InputState.set_move_vector(Vector2.ZERO)
			queue_redraw()
		if event.index == _look_touch:
			_look_touch = -1

func _handle_drag(event: InputEventScreenDrag) -> void:
	if event.index == _move_touch:
		_move_position = event.position
		var delta := (_move_position - _move_origin).limit_length(joystick_radius)
		InputState.set_move_vector(Vector2(delta.x, -delta.y) / joystick_radius)
		queue_redraw()
	elif event.index == _look_touch:
		InputState.add_look_delta(event.relative * look_scale)

func _draw() -> void:
	if _move_touch == -1:
		return
	draw_circle(_move_origin, joystick_radius, Color(0.78, 0.82, 0.86, 0.10))
	var delta := (_move_position - _move_origin).limit_length(joystick_radius)
	draw_circle(_move_origin + delta, joystick_radius * 0.38, Color(0.88, 0.91, 0.94, 0.28))

func _exit_tree() -> void:
	InputState.reset()
