extends MultiMeshInstance3D

@export var tree_count := 3250
@export var world_half_extent := 345.0
@export var start_clear_radius := 18.0
@export var min_scale := 0.80
@export var max_scale := 1.35

func _ready() -> void:
	build_forest()

func build_forest() -> void:
	var trunk := CylinderMesh.new()
	trunk.top_radius = 0.18
	trunk.bottom_radius = 0.28
	trunk.height = 7.0
	trunk.radial_segments = 6
	trunk.rings = 1

	var material := StandardMaterial3D.new()
	material.albedo_color = Color(0.035, 0.022, 0.012, 1.0)
	material.roughness = 1.0
	trunk.material = material

	var mm := MultiMesh.new()
	mm.transform_format = MultiMesh.TRANSFORM_3D
	mm.instance_count = tree_count
	mm.mesh = trunk

	var rng := RandomNumberGenerator.new()
	rng.seed = int(GameState.run_seed) ^ 0x1F0A57

	var placed := 0
	var attempts := 0
	while placed < tree_count and attempts < tree_count * 12:
		attempts += 1
		var x := rng.randf_range(-world_half_extent, world_half_extent)
		var z := rng.randf_range(-world_half_extent, world_half_extent)
		if Vector2(x, z).length() < start_clear_radius:
			continue

		# Coarse clustering: some areas are intentionally much denser than others.
		var density := 0.5 + 0.5 * sin(x * 0.021 + sin(z * 0.013) * 2.4)
		if rng.randf() > lerpf(0.35, 0.96, density):
			continue

		var scale := rng.randf_range(min_scale, max_scale)
		var basis := Basis(Vector3.UP, rng.randf_range(0.0, TAU))
		basis = basis.scaled(Vector3(scale, rng.randf_range(0.9, 1.2) * scale, scale))
		var transform := Transform3D(basis, Vector3(x, 3.5 * scale, z))
		mm.set_instance_transform(placed, transform)
		placed += 1

	mm.instance_count = placed
	multimesh = mm
	print("Fallen Forest blockout: %d trees generated with MultiMesh." % placed)
