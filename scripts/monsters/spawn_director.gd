extends Node3D
class_name MonsterSpawnDirector

@export var player: Node3D
@export var min_spawn_distance := 30.0
@export var max_spawn_distance := 90.0

var enabled := true

func can_spawn(point: Vector3) -> bool:
	if player == null:
		return false
	var distance := player.global_position.distance_to(point)
	return distance >= min_spawn_distance and distance <= max_spawn_distance

func get_spawn_point(points: Array[Node3D]) -> Node3D:
	for point in points:
		if can_spawn(point.global_position):
			return point
	return null

# T3 foundation:
# Locust and Boiled spawn separately through event rules.
# Future links: documents, story progression, biome pressure.
