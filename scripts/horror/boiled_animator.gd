extends Node

@export var visual_root_path: NodePath = NodePath("../Visual")
@export var sway_speed_primary := 0.47
@export var sway_speed_secondary := 0.19
@export var sway_degrees_primary := 0.70
@export var sway_degrees_secondary := 0.35
@export var focus_amplitude_multiplier := 1.10

var _visual_root: Node3D
var _base_rotation := Vector3.ZERO
var _time := 0.0
var _focus_weight := 0.0

func _ready() -> void:
	_visual_root = get_node_or_null(visual_root_path) as Node3D
	if _visual_root != null:
		_base_rotation = _visual_root.rotation

func _process(delta: float) -> void:
	if _visual_root == null:
		return
	_time += delta
	# Boiled is deliberately non-humanoid. This is the entire baseline body
	# animation: a tiny irregular lean with no walking, breathing cycle or
	# human weight shift.
	var amplitude := lerpf(1.0, focus_amplitude_multiplier, _focus_weight)
	var z_sway := (
		sin(_time * sway_speed_primary) * deg_to_rad(sway_degrees_primary)
		+ sin(_time * sway_speed_secondary + 1.7) * deg_to_rad(sway_degrees_secondary)
	) * amplitude
	var x_sway := sin(_time * 0.13 + 0.9) * deg_to_rad(0.16) * amplitude
	_visual_root.rotation = _base_rotation + Vector3(x_sway, 0.0, z_sway)

func set_focus_weight(value: float) -> void:
	_focus_weight = clampf(value, 0.0, 1.0)

func reset_pose() -> void:
	_focus_weight = 0.0
	if _visual_root != null:
		_visual_root.rotation = _base_rotation
