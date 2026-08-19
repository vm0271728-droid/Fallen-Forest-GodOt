extends Node3D

signal forest_exited(player: CharacterBody3D, boundary_point: Vector3, outward_direction: Vector3)

@export var player_path: NodePath
@export var half_extent := 358.0
@export var wall_height := 12.0
@export var wall_thickness := 1.0
@export var exit_margin := 1.5

var _player: CharacterBody3D
var _walls: Array[StaticBody3D] = []
var _exit_emitted := false

func _ready() -> void:
	_player = get_node(player_path)
	_build_walls()
	if not GameState.final_run_started.is_connected(_on_final_run_started):
		GameState.final_run_started.connect(_on_final_run_started)
	if GameState.final_run_active:
		_on_final_run_started()

func _physics_process(_delta: float) -> void:
	if _exit_emitted or not GameState.final_run_active or _player == null:
		return
	var p := _player.global_position
	if absf(p.x) <= half_extent + exit_margin and absf(p.z) <= half_extent + exit_margin:
		return

	_exit_emitted = true
	var outward := Vector3.ZERO
	var boundary := p
	if absf(p.x) > absf(p.z):
		outward = Vector3(signf(p.x), 0.0, 0.0)
		boundary.x = signf(p.x) * half_extent
	else:
		outward = Vector3(0.0, 0.0, signf(p.z))
		boundary.z = signf(p.z) * half_extent
	forest_exited.emit(_player, boundary, outward)

func _on_final_run_started() -> void:
	for wall in _walls:
		wall.collision_layer = 0
		wall.collision_mask = 0

func _build_walls() -> void:
	_create_wall("North", Vector3(0.0, wall_height * 0.5, -half_extent), Vector3(half_extent * 2.0, wall_height, wall_thickness))
	_create_wall("South", Vector3(0.0, wall_height * 0.5, half_extent), Vector3(half_extent * 2.0, wall_height, wall_thickness))
	_create_wall("West", Vector3(-half_extent, wall_height * 0.5, 0.0), Vector3(wall_thickness, wall_height, half_extent * 2.0))
	_create_wall("East", Vector3(half_extent, wall_height * 0.5, 0.0), Vector3(wall_thickness, wall_height, half_extent * 2.0))

func _create_wall(label: String, position: Vector3, size: Vector3) -> void:
	var wall := StaticBody3D.new()
	wall.name = "Boundary" + label
	wall.collision_layer = 1
	wall.collision_mask = 1
	wall.position = position
	var collision := CollisionShape3D.new()
	var shape := BoxShape3D.new()
	shape.size = size
	collision.shape = shape
	wall.add_child(collision)
	add_child(wall)
	_walls.append(wall)
