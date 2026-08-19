extends Area3D

@export var pickup_delay := 0.35
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
	await get_tree().create_timer(pickup_delay).timeout
	if is_instance_valid(rig):
		rig.call("acquire")
	queue_free()
