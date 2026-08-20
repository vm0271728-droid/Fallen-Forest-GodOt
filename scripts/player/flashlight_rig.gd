extends Node3D

const FLASHLIGHT_MODEL_PATH := "res://assets/player/flashlight/source/flashlightfbx.fbx"

@export var acquired_at_start := false
@export var horizontal_lag := 0.0017
@export var vertical_lag := 0.0012
@export var max_lag_degrees := 5.0
@export var response := 13.0
@export var return_speed := 9.0

@onready var light: SpotLight3D = $SpotLight3D

var acquired := false
var placed_for_ending := false
var death_dropped := false
var _lag_target := Vector2.ZERO
var _lag_current := Vector2.ZERO
var _ending_visual: Node3D
var _death_prop: Node3D

func _ready() -> void:
	acquired = acquired_at_start or GameState.flashlight_acquired
	if acquired_at_start and not GameState.flashlight_acquired:
		GameState.acquire_flashlight()
	_apply_state()

func _process(delta: float) -> void:
	if placed_for_ending or death_dropped:
		return
	_lag_target = _lag_target.move_toward(Vector2.ZERO, return_speed * delta)
	var blend := 1.0 - exp(-response * delta)
	_lag_current = _lag_current.lerp(_lag_target, blend)
	rotation.x = _lag_current.y
	rotation.y = _lag_current.x

func feed_look_delta(delta_pixels: Vector2) -> void:
	if placed_for_ending or death_dropped:
		return
	var max_lag := deg_to_rad(max_lag_degrees)
	_lag_target.x = clampf(_lag_target.x + delta_pixels.x * horizontal_lag, -max_lag, max_lag)
	_lag_target.y = clampf(_lag_target.y + delta_pixels.y * vertical_lag, -max_lag * 0.75, max_lag * 0.75)

func acquire(turn_on := true) -> void:
	var newly_acquired := not acquired
	acquired = true
	light.visible = turn_on
	if newly_acquired:
		GameState.acquire_flashlight()
		SaveSystem.save_run()

func set_enabled(enabled: bool) -> void:
	if not acquired:
		return
	light.visible = enabled and not death_dropped

func drop_for_death(world_position: Vector3, direction: Vector3) -> void:
	if not acquired or placed_for_ending:
		return
	restore_after_death()
	death_dropped = true
	light.visible = false
	var scene_root := get_tree().current_scene
	if scene_root == null:
		return

	_death_prop = Node3D.new()
	_death_prop.name = "DroppedFlashlight_Death"
	scene_root.add_child(_death_prop)
	_death_prop.global_position = world_position + Vector3.UP * 0.09
	var forward := Vector3(direction.x, -0.08, direction.z).normalized()
	if forward.length_squared() < 0.001:
		forward = Vector3.FORWARD
	_death_prop.look_at(_death_prop.global_position + forward, Vector3.UP)

	var model := _instantiate_flashlight_model()
	if model != null:
		_death_prop.add_child(model)
		model.rotation_degrees = Vector3(-90.0, 0.0, 0.0)

	var dropped_light := SpotLight3D.new()
	dropped_light.name = "DroppedBeam"
	dropped_light.light_color = light.light_color
	dropped_light.light_energy = light.light_energy
	dropped_light.spot_range = light.spot_range
	dropped_light.spot_angle = light.spot_angle
	dropped_light.spot_angle_attenuation = light.spot_angle_attenuation
	dropped_light.shadow_enabled = light.shadow_enabled
	dropped_light.position = Vector3(0.0, 0.04, -0.18)
	_death_prop.add_child(dropped_light)

func restore_after_death() -> void:
	if is_instance_valid(_death_prop):
		_death_prop.queue_free()
	_death_prop = null
	death_dropped = false
	if is_instance_valid(light):
		light.visible = acquired and not placed_for_ending

func place_for_ending(world_position: Vector3, direction: Vector3) -> void:
	if not acquired or placed_for_ending:
		return
	restore_after_death()
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

	_ending_visual = _instantiate_flashlight_model()
	if _ending_visual != null:
		add_child(_ending_visual)
		_ending_visual.rotation_degrees = Vector3(-90.0, 0.0, 0.0)

func _instantiate_flashlight_model() -> Node3D:
	var resource := ResourceLoader.load(FLASHLIGHT_MODEL_PATH)
	if not resource is PackedScene:
		push_warning("Fallen Forest: flashlight FBX is not available as PackedScene: %s" % FLASHLIGHT_MODEL_PATH)
		return null
	return (resource as PackedScene).instantiate() as Node3D

func _apply_state() -> void:
	light.visible = acquired

func beam_origin() -> Vector3:
	return light.global_position

func beam_direction() -> Vector3:
	return -light.global_basis.z
