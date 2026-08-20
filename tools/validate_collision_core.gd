extends SceneTree

const TERRAIN_SCRIPT := preload("res://scripts/world/terrain_generator.gd")
const TREE_COLLISION_SCRIPT := preload("res://scripts/world/tree_collision_manager.gd")

class FakeForest:
	extends Node3D
	var tree_positions := PackedVector3Array()

var _failures := PackedStringArray()

func _initialize() -> void:
	call_deferred("_run")

func _run() -> void:
	var world := Node3D.new()
	world.name = "CollisionCoreWorld"
	root.add_child(world)

	var terrain := StaticBody3D.new()
	terrain.name = "Terrain"
	terrain.set_script(TERRAIN_SCRIPT)
	var terrain_mesh := MeshInstance3D.new()
	terrain_mesh.name = "MeshInstance3D"
	terrain.add_child(terrain_mesh)
	var terrain_collision := CollisionShape3D.new()
	terrain_collision.name = "CollisionShape3D"
	terrain.add_child(terrain_collision)
	world.add_child(terrain)

	await process_frame
	await physics_frame
	if not bool(terrain.get("generated")):
		_fail("Terrain generator did not complete")
		_finish(world)
		return

	var shape_node := terrain.get_node("CollisionShape3D") as CollisionShape3D
	if shape_node.shape == null or not shape_node.shape is HeightMapShape3D:
		_fail("Terrain has no active HeightMapShape3D")
	if shape_node.disabled:
		_fail("Terrain collision is disabled")
	var shape_scale := shape_node.scale
	if absf(shape_scale.x - shape_scale.y) > 0.0001 or absf(shape_scale.y - shape_scale.z) > 0.0001:
		_fail("Terrain collision scale is non-uniform: %s" % shape_scale)
	if (terrain.collision_layer & 1) == 0:
		_fail("Terrain does not publish movement collision layer 1")

	var ground_y := float(terrain.call("sample_height", 0.0, 0.0))
	var player := CharacterBody3D.new()
	player.name = "Player"
	player.collision_layer = 1
	player.collision_mask = 1
	var player_shape := CollisionShape3D.new()
	var capsule := CapsuleShape3D.new()
	capsule.radius = 0.33
	capsule.height = 1.76
	player_shape.shape = capsule
	player_shape.position = Vector3(0.0, 0.88, 0.0)
	player.add_child(player_shape)
	world.add_child(player)

	await physics_frame
	var test_from := Transform3D(Basis.IDENTITY, Vector3(0.0, ground_y + 3.0, 0.0))
	if not player.test_move(test_from, Vector3(0.0, -6.0, 0.0)):
		_fail("CharacterBody3D test_move passed through the terrain")

	var terrain_query := PhysicsRayQueryParameters3D.create(
		Vector3(0.0, ground_y + 6.0, 0.0),
		Vector3(0.0, ground_y - 6.0, 0.0)
	)
	terrain_query.collision_mask = 1
	terrain_query.exclude = [player.get_rid()]
	var terrain_hit: Dictionary = terrain.get_world_3d().direct_space_state.intersect_ray(terrain_query)
	if terrain_hit.is_empty() or terrain_hit.get("collider") != terrain:
		_fail("Layer-1 ray did not hit the generated terrain")

	var forest := FakeForest.new()
	forest.name = "Forest"
	var tree_x := 4.0
	var tree_z := 0.0
	var tree_y := float(terrain.call("sample_height", tree_x, tree_z))
	forest.tree_positions.append(Vector3(tree_x, tree_y, tree_z))
	world.add_child(forest)

	var manager := StaticBody3D.new()
	manager.name = "TreeCollisionManager"
	manager.set_script(TREE_COLLISION_SCRIPT)
	manager.set("forest_path", NodePath("../Forest"))
	manager.set("player_path", NodePath("../Player"))
	manager.set("pool_size", 8)
	manager.set("activation_radius", 24.0)
	world.add_child(manager)
	player.global_position = Vector3.ZERO

	for _i in 4:
		await physics_frame
		await process_frame
	manager.call("refresh_collisions")
	for _i in 3:
		await physics_frame

	if int(manager.get("active_trunk_count")) < 1:
		_fail("Tree collision manager did not activate a trunk collider")
	else:
		var trunk := manager.call("get_active_trunk_shape") as CollisionShape3D
		if trunk == null or trunk.disabled or not trunk.shape is CylinderShape3D:
			_fail("Active tree trunk does not have an enabled CylinderShape3D")
		else:
			var cylinder := trunk.shape as CylinderShape3D
			var half_height := cylinder.height * 0.5
			var tree_query := PhysicsRayQueryParameters3D.create(
				trunk.global_position + Vector3.UP * (half_height + 1.0),
				trunk.global_position - Vector3.UP * (half_height - 0.5)
			)
			tree_query.collision_mask = 1
			tree_query.exclude = [player.get_rid()]
			var tree_hit: Dictionary = manager.get_world_3d().direct_space_state.intersect_ray(tree_query)
			if tree_hit.is_empty() or tree_hit.get("collider") != manager:
				_fail("Layer-1 ray passed through the active tree trunk")

	_finish(world)

func _fail(message: String) -> void:
	_failures.append(message)
	push_error("COLLISION_CORE: %s" % message)

func _finish(world: Node) -> void:
	if is_instance_valid(world):
		world.queue_free()
	if _failures.is_empty():
		print("COLLISION_CORE_VALIDATION: PASS")
		quit(0)
	else:
		print("COLLISION_CORE_VALIDATION: FAIL (%d problems)" % _failures.size())
		for failure: String in _failures:
			print(" - %s" % failure)
		quit(1)
