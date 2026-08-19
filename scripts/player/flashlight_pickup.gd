extends Area3D

@export var fallback_pickup_delay := 0.35
var _busy := false

func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node3D) -> void:
	if _busy:
		return
	var rig := body.get_node_or_null("Head/Camera3D/FlashlightRig")
	if rig == null or not rig.has_method("acquire"):
		return

	_busy = true
	var pickup_visual := get_node_or_null("CanonicalFlashlight") as Node3D
	if pickup_visual != null:
		pickup_visual.visible = false

	var viewmodel := body.get_node_or_null("ViewmodelLayer/ViewmodelContainer/ViewmodelViewport/ViewmodelWorld")
	if viewmodel != null and viewmodel.has_method("play_flashlight_pickup"):
		await viewmodel.call("play_flashlight_pickup")
	else:
		await get_tree().create_timer(fallback_pickup_delay).timeout
		if is_instance_valid(rig):
			rig.call("acquire")

	queue_free()
