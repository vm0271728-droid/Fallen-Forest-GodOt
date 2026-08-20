extends SceneTree

var _failures := PackedStringArray()

func _initialize() -> void:
	call_deferred("_run")

func _run() -> void:
	var gameplay_resource := load("res://scenes/main/main.tscn")
	if not gameplay_resource is PackedScene:
		_fail("Gameplay scene could not be loaded as PackedScene")
		_finish()
		return

	var gameplay := (gameplay_resource as PackedScene).instantiate()
	var forest := gameplay.get_node_or_null("ForestBlockout")
	var grass := gameplay.get_node_or_null("GrassSystem")
	var collision_manager := gameplay.get_node_or_null("TreeCollisionManager")
	if forest != null:
		forest.set("tree_count", 640)
	if grass != null:
		grass.set("target_count", 256)
	if collision_manager != null:
		collision_manager.set("pool_size", 96)
		collision_manager.set("activation_radius", 90.0)

	root.add_child(gameplay)
	current_scene = gameplay

	# Let ready/deferred calls, HeightMap registration and CharacterBody settling
	# complete in the actual physics server.
	for _i in 45:
		await physics_frame
		await process_frame

	var terrain := gameplay.get_node_or_null("Terrain")
	var player := gameplay.get_node_or_null("Player") as CharacterBody3D
	forest = gameplay.get_node_or_null("ForestBlockout")
	collision_manager = gameplay.get_node_or_null("TreeCollisionManager")

	_validate_terrain_shape(terrain)
	_validate_player_grounding(player, terrain)
	_validate_terrain_raycast(terrain, player)
	await _validate_tree_collision(forest, collision_manager, player)

	if is_instance_valid(gameplay):
		gameplay.queue_free()
	await process_frame
	_finish()

func _validate_terrain_shape(terrain: Node) -> void:
	if terrain == null:
		_fail("Terrain node is missing")
		return
	if (int(terrain.get("collision_layer")) & 1) == 0:
		_fail("Terrain is not on movement collision layer 1")
	var shape_node := terrain.get_node_or_null("CollisionShape3D") as CollisionShape3D
	if shape_node == null:
		_fail("Terrain CollisionShape3D is missing")
		return
	if shape_node.disabled:
		_fail("Terrain CollisionShape3D is disabled")
	if not shape_node.shape is HeightMapShape3D:
		_fail("Terrain collision is not HeightMapShape3D")
	var s := shape_node.scale
	if absf(s.x - s.y) > 0.0001 or absf(s.y - s.z) > 0.0001:
		_fail("Terrain collision shape uses non-uniform scale: %s" % s)

func _validate_player_grounding(player: CharacterBody3D, terrain: Node) -> void:
	if player == null:
		_fail("Player node is missing")
		return
	if (player.collision_mask & 1) == 0:
		_fail("Player collision mask does not include world layer 1")
	if terrain == null or not terrain.has_method("sample_height"):
		return
	var ground_y := float(terrain.call("sample_height", player.global_position.x, player.global_position.z))
	if player.global_position.y < ground_y - 0.25:
		_fail("Player fell through terrain: player_y=%.3f ground_y=%.3f" % [player.global_position.y, ground_y])
	if absf(player.global_position.y - ground_y) > 0.30:
		_fail("Player did not settle onto terrain: player_y=%.3f ground_y=%.3f" % [player.global_position.y, ground_y])
	if not player.is_on_floor():
		_fail("CharacterBody3D does not report is_on_floor() after settling")

func _validate_terrain_raycast(terrain: Node, player: CharacterBody3D) -> void:
	if terrain == null or not terrain.has_method("sample_height"):
		return
	var probe_x := 9.0
	var probe_z := 7.0
	var h := float(terrain.call("sample_height", probe_x, probe_z))
	var query := PhysicsRayQueryParameters3D.create(
		Vector3(probe_x, h + 8.0, probe_z),
		Vector3(probe_x, h - 8.0, probe_z)
	)
	query.collision_mask = 1
	if player != null:
		query.exclude = [player.get_rid()]
	var hit := terrain.get_world_3d().direct_space_state.intersect_ray(query)
	if hit.is_empty():
		_fail("Physics ray did not hit terrain")
		return
	if hit.get("collider") != terrain:
		_fail("Terrain ray hit unexpected collider: %s" % hit.get("collider"))

func _validate_tree_collision(forest: Node, manager: Node, player: CharacterBody3D) -> void:
	if forest == null:
		_fail("ForestBlockout node is missing")
		return
	var positions = forest.get("tree_positions")
	if positions == null or positions.is_empty():
		_fail("Forest generated no tree positions")
		return
	if manager == null:
		_fail("TreeCollisionManager node is missing")
		return
	if (int(manager.get("collision_layer")) & 1) == 0:
		_fail("TreeCollisionManager is not on movement collision layer 1")
	if not manager.has_method("get_active_trunk_shape"):
		_fail("TreeCollisionManager has no active-trunk test hook")
		return

	manager.call("refresh_collisions")
	for _i in 4:
		await physics_frame
		await process_frame

	var active_count := int(manager.get("active_trunk_count"))
	if active_count <= 0:
		_fail("No nearby tree collision shapes became active")
		return
	var trunk := manager.call("get_active_trunk_shape") as CollisionShape3D
	if trunk == null or trunk.disabled:
		_fail("Active tree trunk CollisionShape3D is missing or disabled")
		return
	if not trunk.shape is CylinderShape3D:
		_fail("Tree trunk collision is not CylinderShape3D")
		return

	var cylinder := trunk.shape as CylinderShape3D
	var ground_y := trunk.global_position.y - cylinder.height * 0.5
	var probe_y := ground_y + minf(1.15, cylinder.height * 0.25)
	var query := PhysicsRayQueryParameters3D.create(
		Vector3(trunk.global_position.x - cylinder.radius - 1.25, probe_y, trunk.global_position.z),
		Vector3(trunk.global_position.x + cylinder.radius + 1.25, probe_y, trunk.global_position.z)
	)
	query.collision_mask = 1
	if player != null:
		query.exclude = [player.get_rid()]
	var hit := manager.get_world_3d().direct_space_state.intersect_ray(query)
	if hit.is_empty():
		_fail("Physics ray passed through an active tree trunk collider")
		return
	if hit.get("collider") != manager:
		_fail("Tree collision ray hit unexpected collider: %s" % hit.get("collider"))

func _fail(message: String) -> void:
	_failures.append(message)
	push_error("RUNTIME_PHYSICS: %s" % message)

func _finish() -> void:
	if _failures.is_empty():
		print("RUNTIME_PHYSICS_VALIDATION: PASS")
		quit(0)
	else:
		print("RUNTIME_PHYSICS_VALIDATION: FAIL (%d problems)" % _failures.size())
		for failure: String in _failures:
			print(" - %s" % failure)
		quit(1)
