extends Control
class_name FloatingJoystick

var value := Vector2.ZERO
var active_touch := -1
var center := Vector2.ZERO
var radius := 92.0
var knob_radius := 38.0
var visible_alpha := 0.0

func _ready() -> void:
	mouse_filter = Control.MOUSE_FILTER_IGNORE
	set_process_input(true)
	set_process(true)

func _process(delta: float) -> void:
	var target := 1.0 if active_touch >= 0 else 0.22
	visible_alpha = lerpf(visible_alpha, target, 1.0 - exp(-7.0 * delta))
	queue_redraw()

func _input(event: InputEvent) -> void:
	var viewport_size := get_viewport_rect().size
	if event is InputEventScreenTouch:
		if event.pressed and active_touch == -1 and event.position.x < viewport_size.x * 0.46 and event.position.y > viewport_size.y * 0.36:
			active_touch = event.index
			center = event.position
			value = Vector2.ZERO
			queue_redraw()
		elif not event.pressed and event.index == active_touch:
			active_touch = -1
			value = Vector2.ZERO
			queue_redraw()
	elif event is InputEventScreenDrag and event.index == active_touch:
		var delta_pos := event.position - center
		if delta_pos.length() > radius:
			delta_pos = delta_pos.normalized() * radius
		value = delta_pos / radius
		queue_redraw()

func _draw() -> void:
	var viewport_size := get_viewport_rect().size
	var c := center
	if active_touch < 0:
		c = Vector2(viewport_size.x * 0.17, viewport_size.y * 0.78)
	var base_col := Color(0.75, 0.82, 0.78, 0.12 * visible_alpha)
	var ring_col := Color(0.82, 0.9, 0.86, 0.28 * visible_alpha)
	var knob_col := Color(0.9, 0.95, 0.92, 0.34 * visible_alpha)
	draw_circle(c, radius, base_col)
	draw_arc(c, radius, 0.0, TAU, 64, ring_col, 2.0, true)
	var knob_pos := c + value * radius
	draw_circle(knob_pos, knob_radius, knob_col)
	draw_arc(knob_pos, knob_radius, 0.0, TAU, 40, Color(1,1,1,0.4 * visible_alpha), 1.5, true)
