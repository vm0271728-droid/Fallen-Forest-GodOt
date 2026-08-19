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
var placed_for_ending := false
var _lag_target := Vector2.ZERO
var _lag_current := Vector2.ZERO

func _ready() -> void:
	acquired = acquired_at_start
	_apply_state()

func _process(delta: float) -> void:
	if placed_for_ending:
		return
	_lag_target = _lag_target.move_toward(Vector2.ZERO, return_speed * delta)
	var blend := 1.0 - exp(-response * delta)
	_lag_current = _lag_current.lerp(_lag_target, blend)
	rotation.x = _lag_current.y
	rotation.y = _lag_current.x

func feed_look_delta(delta_pixels: Vector2) -> void:
	if placed_for_ending:
		return
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

func place_for_ending(world_position: Vector3, direction: Vector3) -> void:
	if not acquired or placed_for_ending:
		return
	placed_for_ending = true
	var scene_root := get_tree().current_scene
	if scene_root == null:
		return
	reparent(scene_root, true)
	global_position = world_position + Vector3.UP * 0.10
	var forward := Vector3(direction.x, 0.035, direction.z).normalized()
	if forward.length_squared() < 0.001:
		forward = Vector3.FORWARD
	look_at(global_position + forward, Vector3.UP)
	light.visible = true
	if visual_root != null:
		visual_root.visible = true

func _apply_state() -> void:
	light.visible = acquired
	if visual_root != null:
		visual_root.visible = acquired

func beam_origin() -> Vector3:
	return light.global_position

func beam_direction() -> Vector3:
	return -light.global_basis.z
