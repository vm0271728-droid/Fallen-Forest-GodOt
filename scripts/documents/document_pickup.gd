extends Area3D

@export var slot := -1
@export var auto_pickup_delay := 0.15

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
	await get_tree().create_timer(auto_pickup_delay).timeout
	if not is_instance_valid(body):
		_collected = false
		return
	if SaveSystem.mark_document(slot, body.global_position):
		queue_free()
	else:
		_collected = false
