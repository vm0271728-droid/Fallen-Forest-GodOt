extends VehicleBody3D

signal route_finished

@export var cruise_speed := 11.5
@export var approach_speed := 5.2
@export var route_point_radius := 2.3
@export var final_stop_distance := 1.4
@export var max_steer_degrees := 28.0
@export var max_engine_force := 120.0
@export var hard_brake_force := 42.0
@export var steering_response := 5.5
@export var speed_response := 3.2

var _route: Array[Vector3] = []
var _route_index := 0
var _driving := false
var _stopping := false
var _current_steer := 0.0
var _current_throttle := 0.0

func _ready() -> void:
	add_to_group("ff_finale_vehicle")
	set_lights(false)

func start_drive(points: Array[Vector3]) -> void:
	if points.is_empty():
		push_warning("Fallen Forest pickup: route is empty.")
		return
	_route = points.duplicate()
	_route_index = 0
	_driving = true
	_stopping = false
	brake = 0.0
	set_lights(true)

func _physics_process(delta: float) -> void:
	if _driving:
		_drive_route(delta)
	elif _stopping:
		engine_force = 0.0
		brake = hard_brake_force

func _drive_route(delta: float) -> void:
	if _route.is_empty():
		stop_now()
		return

	_route_index = clampi(_route_index, 0, _route.size() - 1)
	var target := _route[_route_index]
	var flat := target - global_position
	flat.y = 0.0
	var distance := flat.length()
	var final_point := _route_index == _route.size() - 1

	if not final_point and distance <= route_point_radius:
		_route_index += 1
		return
	if final_point and distance <= final_stop_distance:
		stop_now()
		route_finished.emit()
		return
	if distance < 0.001:
		return

	var direction := flat / distance
	var local_direction := global_basis.inverse() * direction
	var desired_steer := clampf(atan2(local_direction.x, local_direction.z), -deg_to_rad(max_steer_degrees), deg_to_rad(max_steer_degrees))
	_current_steer = lerp_angle(_current_steer, desired_steer, 1.0 - exp(-steering_response * delta))
	steering = _current_steer

	var desired_speed := cruise_speed
	if final_point:
		var slow_zone := maxf(7.0, cruise_speed * 1.2)
		desired_speed = lerpf(0.0, approach_speed, clampf(inverse_lerp(final_stop_distance, slow_zone, distance), 0.0, 1.0))

	var speed := linear_velocity.length()
	var normalized_error := clampf((desired_speed - speed) / maxf(1.0, cruise_speed), -1.0, 1.0)
	_current_throttle = lerpf(_current_throttle, normalized_error, 1.0 - exp(-speed_response * delta))
	if _current_throttle >= 0.0:
		brake = 0.0
		engine_force = _current_throttle * max_engine_force
	else:
		engine_force = 0.0
		brake = absf(_current_throttle) * hard_brake_force

func stop_now(keep_lights_on := true) -> void:
	_driving = false
	_stopping = true
	_current_throttle = 0.0
	engine_force = 0.0
	brake = hard_brake_force
	set_lights(keep_lights_on)

func set_lights(enabled: bool) -> void:
	for node in get_tree().get_nodes_in_group("ff_pickup_headlight"):
		if is_ancestor_of(node) and node is Light3D:
			(node as Light3D).visible = enabled
	for node in get_tree().get_nodes_in_group("ff_pickup_taillight"):
		if is_ancestor_of(node) and node is Light3D:
			(node as Light3D).visible = enabled
