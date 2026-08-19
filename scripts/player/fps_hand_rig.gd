extends Node

@export var skeleton_root_path: NodePath = NodePath("../ArmsRoot/CanonicalArms")
@export var right_palm_name := "R_palm"
@export var left_palm_name := "L_palm"

var skeleton: Skeleton3D
var right_palm: BoneAttachment3D
var left_palm: BoneAttachment3D
var ready_for_grips := false

func _ready() -> void:
	call_deferred("_initialize_rig")

func _initialize_rig() -> void:
	var root := get_node_or_null(skeleton_root_path)
	if root == null:
		push_warning("Fallen Forest: FPS hand rig could not find canonical arms root.")
		return
	skeleton = _find_skeleton(root)
	if skeleton == null:
		push_warning("Fallen Forest: canonical FPS arms contain no Skeleton3D.")
		return

	var right_index := skeleton.find_bone(right_palm_name)
	var left_index := skeleton.find_bone(left_palm_name)
	if right_index < 0 or left_index < 0:
		push_warning("Fallen Forest: FPS palm bones unavailable (R=%d L=%d)." % [right_index, left_index])
		return

	right_palm = _create_attachment("RightPalmAttachment", right_palm_name)
	left_palm = _create_attachment("LeftPalmAttachment", left_palm_name)
	ready_for_grips = true
	print("Fallen Forest FPS rig: palm attachments active on %s / %s." % [right_palm_name, left_palm_name])

func _find_skeleton(node: Node) -> Skeleton3D:
	if node is Skeleton3D:
		return node as Skeleton3D
	for child: Node in node.get_children():
		var found := _find_skeleton(child)
		if found != null:
			return found
	return null

func _create_attachment(node_name: String, bone_name: String) -> BoneAttachment3D:
	var existing := skeleton.get_node_or_null(node_name) as BoneAttachment3D
	if existing != null:
		existing.bone_name = bone_name
		return existing
	var attachment := BoneAttachment3D.new()
	attachment.name = node_name
	attachment.bone_name = bone_name
	attachment.override_pose = false
	skeleton.add_child(attachment)
	return attachment

func attach_to_right_palm(node: Node3D, local_position: Vector3, local_rotation_degrees: Vector3) -> bool:
	if not ready_for_grips or right_palm == null or node == null:
		return false
	node.reparent(right_palm, false)
	node.position = local_position
	node.rotation_degrees = local_rotation_degrees
	return true

func attach_to_left_palm(node: Node3D, local_position: Vector3, local_rotation_degrees: Vector3) -> bool:
	if not ready_for_grips or left_palm == null or node == null:
		return false
	node.reparent(left_palm, false)
	node.position = local_position
	node.rotation_degrees = local_rotation_degrees
	return true

func detach_to_viewmodel(node: Node3D, viewmodel_root: Node3D, keep_global := true) -> void:
	if node == null or viewmodel_root == null:
		return
	node.reparent(viewmodel_root, keep_global)

func has_bone(bone_name: String) -> bool:
	return skeleton != null and skeleton.find_bone(bone_name) >= 0

func bone_index(bone_name: String) -> int:
	return skeleton.find_bone(bone_name) if skeleton != null else -1
