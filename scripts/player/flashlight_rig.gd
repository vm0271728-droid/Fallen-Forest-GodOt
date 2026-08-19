extends Node3D

@export var acquired_at_start := false
@export var horizontal_lag := 0.0017
@export var vertical_lag := 0.0012
@export var max_lag_degrees := 5.0
@export var response := 13.0
@export var return_speed := 9.0

@onready var light: SpotLight3D = $SpotLight3D
@onready var visual_root: Node3D = get_node_or_null("CanonicalFlashlight") as Node3D

var acquired := false
var _lag_target := Vector2.ZERO
var _lag_current := Vector2.ZERO

func _ready() -> void:
	acquired = acquired_at_start
	_apply_state()

func _process(delta: float) -> void:
	_lag_target = _lag_target.move_toward(Vector2.ZERO, return_speed * delta)
	var blend := 1.0 - exp(-response * delta)
	_lag_current = _lag_current.lerp(_lag_target, blend)
	rotation.x = _lag_current.y
	rotation.y = _lag_current.x

func feed_look_delta(delta_pixels: Vector2) -> void:
	var max_lag := deg_to_rad(max_lag_degrees)
	_lag_target.x = clampf(_lag_target.x + delta_pixels.x * horizontal_lag, -max_lag, max_lag)
	_lag_target.y = clampf(_lag_target.y + delta_pixels.y * vertical_lag, -max_lag * 0.75, max_lag * 0.75)

func acquire() -> void:
	acquired = true
	_apply_state()

func set_enabled(enabled: bool) -> void:
	if not acquired:
		return
	light.visible = enabled

func _apply_state() -> void:
	light.visible = acquired
	if visual_root != null:
		visual_root.visible = acquired

func beam_origin() -> Vector3:
	return light.global_position

func beam_direction() -> Vector3:
	return -light.global_basis.z
