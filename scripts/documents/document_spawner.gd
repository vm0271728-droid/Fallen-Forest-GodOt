extends Node3D

@export var document_scene: PackedScene
@export var count := 10
@export var world_half_extent := 330.0
@export var minimum_spacing := 28.0
@export var minimum_from_start := 34.0
@export var candidate_count := 220
@export var ground_y := 0.03

func _ready() -> void:
	spawn_documents()

func spawn_documents() -> void:
	if document_scene == null:
		push_error("Fallen Forest: DocumentSpawner has no document_scene.")
		return

	var rng := RandomNumberGenerator.new()
	rng.seed = int(GameState.run_seed) ^ 0x5F3759DF

	var candidates: Array[Vector3] = []
	for i in candidate_count:
		var point := Vector3(
			rng.randf_range(-world_half_extent, world_half_extent),
			ground_y,
			rng.randf_range(-world_half_extent, world_half_extent)
		)
		if Vector2(point.x, point.z).length() >= minimum_from_start:
			candidates.append(point)

	# Fisher-Yates shuffle with the run RNG so Continue reproduces the same world.
	for i in range(candidates.size() - 1, 0, -1):
		var j := rng.randi_range(0, i)
		var tmp := candidates[i]
		candidates[i] = candidates[j]
		candidates[j] = tmp

	var chosen: Array[Vector3] = []
	for candidate in candidates:
		if chosen.size() >= count:
			break
		var valid := true
		for previous in chosen:
			if Vector2(previous.x - candidate.x, previous.z - candidate.z).length() < minimum_spacing:
				valid = false
				break
		if not valid:
			continue

		var slot := chosen.size()
		chosen.append(candidate)
		if GameState.is_document_collected(slot):
			continue

		var document := document_scene.instantiate()
		document.position = candidate
		document.rotation.y = rng.randf_range(0.0, TAU)
		add_child(document)
		if document.has_method("configure"):
			document.call("configure", slot)

	if chosen.size() < count:
		push_warning("Fallen Forest: only %d/%d document positions were generated." % [chosen.size(), count])
