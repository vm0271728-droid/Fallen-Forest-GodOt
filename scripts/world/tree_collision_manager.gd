extends StaticBody3D

@export var forest_path: NodePath
@export var player_path: NodePath
@export var activation_radius := 80.0
@export var pool_size := 192
@export var refresh_interval := 0.45
@export var trunk_radius := 0.34
@export var trunk_height := 11.5

var _forest: Node
var _player: Node3D
var _pool: Array[CollisionShape3D] = []
var _elapsed := 999.0

func _ready() -> void:
	collision_layer = 1
	collision_mask = 0
	_forest = get_node_or_null(forest_path)
	_player = get_node_or_null(player_path) as Node3D
	_build_pool()
	call_deferred("refresh_collisions")

func _physics_process(delta: float) -> void:
	_elapsed += delta
	if _elapsed >= refresh_interval:
		_elapsed = 0.0
		refresh_collisions()

func _build_pool() -> void:
	var shared_shape := CylinderShape3D.new()
	shared_shape.radius = trunk_radius
	shared_shape.height = trunk_height
	for i in pool_size:
		var collision := CollisionShape3D.new()
		collision.name = "TreeCollider_%03d" % i
		collision.shape = shared_shape
		collision.disabled = true
		add_child(collision)
		_pool.append(collision)

func refresh_collisions() -> void:
	if _forest == null or _player == null:
		return
	var positions = _forest.get("tree_positions")
	if positions == null or positions.is_empty():
		return

	var radius_squared := activation_radius * activation_radius
	var nearby: Array[Dictionary] = []
	for tree_position: Vector3 in positions:
		var dx := tree_position.x - _player.global_position.x
		var dz := tree_position.z - _player.global_position.z
		var distance_squared := dx * dx + dz * dz
		if distance_squared <= radius_squared:
			nearby.append({"position": tree_position, "distance_squared": distance_squared})

	nearby.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return float(a.distance_squared) < float(b.distance_squared)
	)

	var active_count := mini(_pool.size(), nearby.size())
	for i in _pool.size():
		var collision := _pool[i]
		if i < active_count:
			var tree_position: Vector3 = nearby[i].position
			collision.position = Vector3(tree_position.x, tree_position.y + trunk_height * 0.5, tree_position.z)
			collision.disabled = false
		else:
			collision.disabled = true
