extends StaticBody3D

@export var forest_path: NodePath
@export var player_path: NodePath
@export var activation_radius := 80.0
@export var pool_size := 192
@export var refresh_interval := 0.45
@export var trunk_radius := 0.34
@export var trunk_height := 11.5
@export var foliage_radius := 2.15
@export var foliage_height := 4.9

var _forest: Node
var _player: Node3D
var _trunk_pool: Array[CollisionShape3D] = []
var _foliage_pool: Array[CollisionShape3D] = []
var _foliage_body: StaticBody3D
var _elapsed := 999.0

func _ready() -> void:
	# Layer 1 is real movement collision.
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
	var trunk_shape := CylinderShape3D.new()
	trunk_shape.radius = trunk_radius
	trunk_shape.height = trunk_height

	_foliage_body = StaticBody3D.new()
	_foliage_body.name = "FoliageLOSBlockers"
	# Layer 8 is raycast-only for monster vision. Player collision mask remains layer 1.
	_foliage_body.collision_layer = 8
	_foliage_body.collision_mask = 0
	add_child(_foliage_body)
	var foliage_shape := SphereShape3D.new()
	foliage_shape.radius = foliage_radius

	for i in pool_size:
		var trunk := CollisionShape3D.new()
		trunk.name = "TreeCollider_%03d" % i
		trunk.shape = trunk_shape
		trunk.disabled = true
		add_child(trunk)
		_trunk_pool.append(trunk)

		var foliage := CollisionShape3D.new()
		foliage.name = "FoliageLOS_%03d" % i
		foliage.shape = foliage_shape
		foliage.disabled = true
		_foliage_body.add_child(foliage)
		_foliage_pool.append(foliage)

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

	var active_count := mini(_trunk_pool.size(), nearby.size())
	for i in _trunk_pool.size():
		var trunk := _trunk_pool[i]
		var foliage := _foliage_pool[i]
		if i < active_count:
			var tree_position: Vector3 = nearby[i].position
			trunk.position = Vector3(tree_position.x, tree_position.y + trunk_height * 0.5, tree_position.z)
			trunk.disabled = false
			foliage.position = Vector3(tree_position.x, tree_position.y + foliage_height, tree_position.z)
			foliage.disabled = false
		else:
			trunk.disabled = true
			foliage.disabled = true
