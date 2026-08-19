extends Area3D

@export var slot := -1
@export var fallback_pickup_delay := 0.15

var _collected := false

func configure(document_slot: int) -> void:
	slot = document_slot
	if GameState.is_document_collected(slot):
		queue_free()

func _ready() -> void:
	body_entered.connect(_on_body_entered)
	if slot >= 0 and GameState.is_document_collected(slot):
		queue_free()

func _on_body_entered(body: Node3D) -> void:
	if _collected or slot < 0 or not body.has_method("save_current_position"):
		return
	_collected = true

	var world_visual := get_node_or_null("CanonicalModel") as Node3D
	if world_visual != null:
		world_visual.visible = false

	var viewmodel := body.get_node_or_null("ViewmodelLayer/ViewmodelContainer/ViewmodelViewport/ViewmodelWorld")
	if viewmodel != null and viewmodel.has_method("play_document_pickup"):
		await viewmodel.call("play_document_pickup", posmod(slot, 3))
	else:
		await get_tree().create_timer(fallback_pickup_delay).timeout

	if not is_instance_valid(body):
		_collected = false
		if world_visual != null:
			world_visual.visible = true
		return

	if SaveSystem.mark_document(slot, body.global_position):
		queue_free()
	else:
		_collected = false
		if world_visual != null:
			world_visual.visible = true
