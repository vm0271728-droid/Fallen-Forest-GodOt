class_name ForestWind
extends Node3D

@export var forest_path: NodePath
@export var grass_path: NodePath
@export_file("*.gdshader") var wind_shader_path := "res://shaders/vegetation_wind.gdshader"
@export var tree_amplitude := 0.085
@export var grass_amplitude := 0.045
@export var tree_speed := 0.72
@export var grass_speed := 1.85
@export var gust_strength := 0.58
@export var reference_wind_strength := 0.40

var _forest: Node
var _grass: Node
var _shader: Shader
var _wind_materials: Array[ShaderMaterial] = []
var _wind_time := 0.0

func _ready() -> void:
	_forest = get_node_or_null(forest_path)
	_grass = get_node_or_null(grass_path)
	_shader = ResourceLoader.load(wind_shader_path) as Shader
	if AudioDirector.wind_strength_changed.is_connected(_on_wind_strength_changed) == false:
		AudioDirector.wind_strength_changed.connect(_on_wind_strength_changed)
	call_deferred("_apply_after_generation")

func _process(delta: float) -> void:
	_wind_time += delta

func _apply_after_generation() -> void:
	# Forest and grass are generated at runtime. Give both scatterers a few
	# frames to finish creating their MultiMeshes before swapping materials.
	for _frame in 4:
		await get_tree().process_frame
	_wind_materials.clear()
	_apply_to_root(_forest, false)
	_apply_to_root(_grass, true)
	_on_wind_strength_changed(AudioDirector.current_wind_strength)

func _apply_to_root(root: Node, grass_mode: bool) -> void:
	if root == null or _shader == null:
		return
	_apply_recursive(root, grass_mode)

func _apply_recursive(node: Node, grass_mode: bool) -> void:
	if node is MultiMeshInstance3D:
		_apply_to_multimesh(node as MultiMeshInstance3D, grass_mode)
	for child: Node in node.get_children():
		_apply_recursive(child, grass_mode)

func _apply_to_multimesh(instance: MultiMeshInstance3D, grass_mode: bool) -> void:
	if instance.multimesh == null or instance.multimesh.mesh == null:
		return
	var source_mesh := instance.multimesh.mesh
	var duplicated_resource := source_mesh.duplicate(true)
	if not duplicated_resource is Mesh:
		return
	var wind_mesh := duplicated_resource as Mesh
	var object_height := maxf(0.15, source_mesh.get_aabb().size.y)
	var amplitude := grass_amplitude if grass_mode else tree_amplitude
	var speed := grass_speed if grass_mode else tree_speed

	if wind_mesh is ArrayMesh:
		var array_mesh := wind_mesh as ArrayMesh
		for surface_index in array_mesh.get_surface_count():
			var source_material := source_mesh.surface_get_material(surface_index)
			array_mesh.surface_set_material(surface_index, _make_wind_material(source_material, object_height, amplitude, speed))
		instance.multimesh.mesh = array_mesh
	else:
		var source_material := source_mesh.surface_get_material(0) if source_mesh.get_surface_count() > 0 else null
		instance.material_override = _make_wind_material(source_material, object_height, amplitude, speed)

func _make_wind_material(source_material: Material, object_height: float, amplitude: float, speed: float) -> ShaderMaterial:
	var material := ShaderMaterial.new()
	material.shader = _shader
	material.set_shader_parameter("object_height", object_height)
	material.set_shader_parameter("wind_amplitude", amplitude)
	material.set_shader_parameter("wind_speed", speed)
	material.set_shader_parameter("gust_strength", gust_strength)

	if source_material is BaseMaterial3D:
		var base := source_material as BaseMaterial3D
		material.set_shader_parameter("albedo_color", base.albedo_color)
		material.set_shader_parameter("roughness_value", base.roughness)
		material.set_shader_parameter("metallic_value", base.metallic)
		if base.albedo_texture != null:
			material.set_shader_parameter("use_albedo_texture", true)
			material.set_shader_parameter("albedo_texture", base.albedo_texture)
		if base.normal_texture != null:
			material.set_shader_parameter("use_normal_texture", true)
			material.set_shader_parameter("normal_texture", base.normal_texture)

	_wind_materials.append(material)
	return material

func _on_wind_strength_changed(value: float) -> void:
	var reference := maxf(0.01, reference_wind_strength)
	var master := clampf(value / reference, 0.0, 2.0)
	for material: ShaderMaterial in _wind_materials:
		if is_instance_valid(material):
			material.set_shader_parameter("master_strength", master)

func get_wind_value(position: Vector3) -> float:
	return sin(_wind_time * 0.72 + position.x * 0.05 + position.z * 0.05) * AudioDirector.current_wind_strength

func get_gust_value(position := Vector3.ZERO) -> float:
	return sin(_wind_time * 0.21 + position.x * 0.011 + position.z * 0.017) * gust_strength

func get_leaf_motion(position: Vector3) -> float:
	return get_wind_value(position) * tree_amplitude

func get_grass_motion(position: Vector3) -> float:
	return sin(_wind_time * grass_speed + position.x * 0.20 + position.z * 0.20) * grass_amplitude * maxf(0.0, AudioDirector.current_wind_strength / maxf(reference_wind_strength, 0.01))
