extends Node

@export var model_root_path: NodePath = NodePath("../Visual/CanonicalModel")
@export var chase_contact_frequency := 4.2
@export var pose_blend_speed := 8.0
@export var attack_blend_speed := 13.0

var skeleton: Skeleton3D
var _state := "neutral"
var _hide_variant := 0
var _time := 0.0
var _bone_indices: Dictionary = {}
var _pose_targets: Dictionary = {}
var _initialized := false

const CONTROL_BONES = [
	"spine", "spine.001", "spine.002", "spine.003", "spine.004",
	"shoulder.L", "shoulder.R",
	"upper_arm.L", "upper_arm.R",
	"forearm.L", "forearm.R",
	"hand.L", "hand.R",
]

func _ready() -> void:
	call_deferred("_initialize")

func _initialize() -> void:
	var model_root := get_node_or_null(model_root_path)
	if model_root == null:
		push_warning("Fallen Forest: Locust animator cannot find canonical model root.")
		return
	skeleton = _find_skeleton(model_root)
	if skeleton == null:
		push_warning("Fallen Forest: Locust canonical model contains no Skeleton3D.")
		return

	for bone_name: String in CONTROL_BONES:
		var index := skeleton.find_bone(bone_name)
		if index >= 0:
			_bone_indices[bone_name] = index
			_pose_targets[bone_name] = Quaternion.IDENTITY

	var animation_player := _find_animation_player(model_root)
	if animation_player != null:
		animation_player.stop()
	_initialized = true
	_apply_state_targets()

func _process(delta: float) -> void:
	if not _initialized:
		return
	_time += delta
	_apply_state_targets()
	var response := attack_blend_speed if _state == "attack" else pose_blend_speed
	var blend := 1.0 - exp(-response * delta)
	for bone_name_variant in _bone_indices.keys():
		var bone_name := str(bone_name_variant)
		var index := int(_bone_indices[bone_name])
		var current := skeleton.get_bone_pose_rotation(index)
		var target: Quaternion = _pose_targets[bone_name]
		skeleton.set_bone_pose_rotation(index, current.slerp(target, blend))

func set_hide_variant(variant: int) -> void:
	_hide_variant = clampi(variant, 0, 4)
	_state = "hide"

func set_retreat() -> void:
	_state = "retreat"

func set_rage() -> void:
	_state = "rage"

func set_chase() -> void:
	_state = "chase"

func set_attack() -> void:
	_state = "attack"

func set_neutral() -> void:
	_state = "neutral"

func _apply_state_targets() -> void:
	_reset_targets()
	match _state:
		"hide":
			_apply_hide_pose(_hide_variant)
		"retreat":
			_apply_retreat_pose()
		"rage":
			_apply_rage_pose()
		"chase":
			_apply_arm_supported_chase()
		"attack":
			_apply_attack_pose()

func _reset_targets() -> void:
	for bone_name_variant in _pose_targets.keys():
		_pose_targets[str(bone_name_variant)] = Quaternion.IDENTITY

func _apply_hide_pose(variant: int) -> void:
	# Canonical set: two far silhouettes, one medium silhouette, two close
	# silhouettes. They are intentionally different poses, not retimed copies.
	var tiny_sway := sin(_time * 0.58 + float(variant) * 0.73) * deg_to_rad(0.8)
	match variant:
		0: # FarHide_A: tall, uneven shoulder line, one arm low
			_set_pose("spine.002", Vector3(deg_to_rad(-3.0), tiny_sway, deg_to_rad(2.0)))
			_set_pose("shoulder.L", Vector3(deg_to_rad(8.0), 0.0, deg_to_rad(7.0)))
			_set_pose("upper_arm.R", Vector3(deg_to_rad(-11.0), deg_to_rad(4.0), 0.0))
		1: # FarHide_B: narrow hunched silhouette
			_set_pose("spine.001", Vector3(deg_to_rad(6.0), tiny_sway, 0.0))
			_set_pose("spine.003", Vector3(deg_to_rad(8.0), 0.0, deg_to_rad(-2.0)))
			_set_pose("upper_arm.L", Vector3(deg_to_rad(13.0), deg_to_rad(-5.0), deg_to_rad(4.0)))
			_set_pose("upper_arm.R", Vector3(deg_to_rad(13.0), deg_to_rad(5.0), deg_to_rad(-4.0)))
		2: # MediumHide: asymmetric tree-peek
			_set_pose("spine.002", Vector3(deg_to_rad(5.0), deg_to_rad(8.0) + tiny_sway, deg_to_rad(7.0)))
			_set_pose("shoulder.L", Vector3(deg_to_rad(-5.0), deg_to_rad(4.0), deg_to_rad(10.0)))
			_set_pose("forearm.L", Vector3(deg_to_rad(18.0), deg_to_rad(-9.0), 0.0))
		3: # CloseHide_A: lowered mass, right arm reaching forward
			_set_pose("spine.001", Vector3(deg_to_rad(11.0), tiny_sway, deg_to_rad(-4.0)))
			_set_pose("spine.003", Vector3(deg_to_rad(9.0), 0.0, 0.0))
			_set_pose("upper_arm.R", Vector3(deg_to_rad(28.0), deg_to_rad(7.0), deg_to_rad(-10.0)))
			_set_pose("forearm.R", Vector3(deg_to_rad(-24.0), 0.0, deg_to_rad(8.0)))
		4: # CloseHide_B: opposite-side predatory lean
			_set_pose("spine.002", Vector3(deg_to_rad(13.0), deg_to_rad(-7.0) + tiny_sway, deg_to_rad(5.0)))
			_set_pose("upper_arm.L", Vector3(deg_to_rad(30.0), deg_to_rad(-6.0), deg_to_rad(11.0)))
			_set_pose("forearm.L", Vector3(deg_to_rad(-26.0), 0.0, deg_to_rad(-8.0)))

func _apply_retreat_pose() -> void:
	var retreat_sway := sin(_time * 1.8) * deg_to_rad(1.2)
	_set_pose("spine.002", Vector3(deg_to_rad(7.0), retreat_sway, 0.0))
	_set_pose("upper_arm.L", Vector3(deg_to_rad(12.0), 0.0, deg_to_rad(5.0)))
	_set_pose("upper_arm.R", Vector3(deg_to_rad(12.0), 0.0, deg_to_rad(-5.0)))
	_set_pose("forearm.L", Vector3(deg_to_rad(-8.0), 0.0, 0.0))
	_set_pose("forearm.R", Vector3(deg_to_rad(-8.0), 0.0, 0.0))

func _apply_rage_pose() -> void:
	var tremor := sin(_time * 18.0) * deg_to_rad(1.1)
	_set_pose("spine.001", Vector3(deg_to_rad(10.0), 0.0, 0.0))
	_set_pose("spine.003", Vector3(deg_to_rad(-7.0), tremor, 0.0))
	_set_pose("shoulder.L", Vector3(deg_to_rad(-10.0), 0.0, deg_to_rad(7.0)))
	_set_pose("shoulder.R", Vector3(deg_to_rad(-10.0), 0.0, deg_to_rad(-7.0)))
	_set_pose("upper_arm.L", Vector3(deg_to_rad(22.0), 0.0, 0.0))
	_set_pose("upper_arm.R", Vector3(deg_to_rad(22.0), 0.0, 0.0))

func _apply_arm_supported_chase() -> void:
	# Canonical chase: the long arms are load-bearing locomotion limbs. The
	# contact load alternates left/right while the torso surges between supports.
	var cycle := sin(_time * chase_contact_frequency)
	var left_contact := maxf(0.0, cycle)
	var right_contact := maxf(0.0, -cycle)
	var torso_bob := absf(cycle) * deg_to_rad(2.5)
	var surge := sin(_time * chase_contact_frequency * 0.5) * deg_to_rad(1.6)

	_set_pose("spine.001", Vector3(deg_to_rad(14.0) + torso_bob, surge, 0.0))
	_set_pose("spine.002", Vector3(deg_to_rad(10.0), 0.0, 0.0))
	_set_pose("upper_arm.L", Vector3(deg_to_rad(34.0 + left_contact * 14.0), deg_to_rad(-7.0), deg_to_rad(9.0)))
	_set_pose("forearm.L", Vector3(deg_to_rad(-31.0 - left_contact * 12.0), 0.0, deg_to_rad(-5.0)))
	_set_pose("hand.L", Vector3(deg_to_rad(8.0 + left_contact * 10.0), 0.0, 0.0))
	_set_pose("upper_arm.R", Vector3(deg_to_rad(34.0 + right_contact * 14.0), deg_to_rad(7.0), deg_to_rad(-9.0)))
	_set_pose("forearm.R", Vector3(deg_to_rad(-31.0 - right_contact * 12.0), 0.0, deg_to_rad(5.0)))
	_set_pose("hand.R", Vector3(deg_to_rad(8.0 + right_contact * 10.0), 0.0, 0.0))

func _apply_attack_pose() -> void:
	# Fast forward mass transfer used immediately before the player death
	# controller takes over the authored first-person kill sequence.
	var snap := clampf((_time * 6.0) - floor(_time * 6.0), 0.0, 1.0)
	_set_pose("spine.001", Vector3(deg_to_rad(19.0 + snap * 5.0), 0.0, 0.0))
	_set_pose("spine.002", Vector3(deg_to_rad(14.0), 0.0, 0.0))
	_set_pose("upper_arm.L", Vector3(deg_to_rad(46.0), deg_to_rad(-5.0), deg_to_rad(10.0)))
	_set_pose("upper_arm.R", Vector3(deg_to_rad(46.0), deg_to_rad(5.0), deg_to_rad(-10.0)))
	_set_pose("forearm.L", Vector3(deg_to_rad(-37.0), 0.0, 0.0))
	_set_pose("forearm.R", Vector3(deg_to_rad(-37.0), 0.0, 0.0))

func _set_pose(bone_name: String, euler: Vector3) -> void:
	if not _pose_targets.has(bone_name):
		return
	_pose_targets[bone_name] = Quaternion.from_euler(euler)

func _find_skeleton(node: Node) -> Skeleton3D:
	if node is Skeleton3D:
		return node as Skeleton3D
	for child: Node in node.get_children():
		var found := _find_skeleton(child)
		if found != null:
			return found
	return null

func _find_animation_player(node: Node) -> AnimationPlayer:
	if node is AnimationPlayer:
		return node as AnimationPlayer
	for child: Node in node.get_children():
		var found := _find_animation_player(child)
		if found != null:
			return found
	return null
