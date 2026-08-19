extends Node

@export var total_duration := 5.2
@export var low_head_height := 0.58
@export var start_pitch_degrees := -24.0
@export var start_roll_degrees := -11.0

var _overlay: CanvasLayer
var _top_lid: ColorRect
var _bottom_lid: ColorRect
var _veil: ColorRect

func play(player: CharacterBody3D) -> void:
	if player == null:
		return
	var head := player.get_node_or_null("Head") as Node3D
	if head == null:
		return

	player.set_controls_enabled(false)
	player.set_look_enabled(false)
	player.velocity = Vector3.ZERO

	var base_position := head.position
	var base_rotation := head.rotation
	head.position = Vector3(base_position.x, low_head_height, base_position.z)
	head.rotation = Vector3(deg_to_rad(start_pitch_degrees), base_rotation.y, deg_to_rad(start_roll_degrees))
	_build_eyelids()

	# Phase 1: almost-black first slit. The player should read darkness before forest detail.
	await get_tree().create_timer(total_duration * 0.14).timeout
	await _open_lids_to(0.38, total_duration * 0.14)
	await get_tree().create_timer(total_duration * 0.08).timeout
	await _close_lids_to(0.46, total_duration * 0.055)

	# Phase 2: more deliberate second opening while the head begins to lift.
	var rise := create_tween().set_parallel(true)
	rise.tween_property(head, "position", Vector3(base_position.x, lerpf(low_head_height, base_position.y, 0.58), base_position.z), total_duration * 0.28).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	rise.tween_property(head, "rotation", Vector3(deg_to_rad(-9.0), base_rotation.y, deg_to_rad(-4.0)), total_duration * 0.28).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	var lids := _lids_tween(0.19, total_duration * 0.24)
	await lids.finished
	await rise.finished
	await get_tree().create_timer(total_duration * 0.06).timeout

	# Final opening and physical settle into normal eye height.
	var final := create_tween().set_parallel(true)
	final.tween_property(head, "position", base_position, total_duration * 0.18).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	final.tween_property(head, "rotation", base_rotation, total_duration * 0.18).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	final.tween_property(_top_lid, "anchor_bottom", 0.0, total_duration * 0.18).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	final.tween_property(_bottom_lid, "anchor_top", 1.0, total_duration * 0.18).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	final.tween_property(_veil, "color:a", 0.0, total_duration * 0.18)
	await final.finished

	head.position = base_position
	head.rotation = base_rotation
	player.set_look_enabled(true)
	player.set_controls_enabled(true)
	if is_instance_valid(_overlay):
		_overlay.queue_free()

func _build_eyelids() -> void:
	_overlay = CanvasLayer.new()
	_overlay.name = "WakeUpEyelids"
	_overlay.layer = 115

	_veil = ColorRect.new()
	_veil.name = "WakeVeil"
	_veil.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	_veil.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_veil.color = Color(0.0, 0.0, 0.0, 0.36)
	_overlay.add_child(_veil)

	_top_lid = ColorRect.new()
	_top_lid.name = "TopEyelid"
	_top_lid.anchor_right = 1.0
	_top_lid.anchor_bottom = 0.50
	_top_lid.color = Color.BLACK
	_top_lid.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_overlay.add_child(_top_lid)

	_bottom_lid = ColorRect.new()
	_bottom_lid.name = "BottomEyelid"
	_bottom_lid.anchor_top = 0.50
	_bottom_lid.anchor_right = 1.0
	_bottom_lid.anchor_bottom = 1.0
	_bottom_lid.color = Color.BLACK
	_bottom_lid.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_overlay.add_child(_bottom_lid)

	get_tree().root.add_child(_overlay)

func _open_lids_to(coverage: float, duration: float) -> void:
	var tween := _lids_tween(coverage, duration)
	await tween.finished

func _close_lids_to(coverage: float, duration: float) -> void:
	var tween := _lids_tween(coverage, duration)
	await tween.finished

func _lids_tween(coverage: float, duration: float) -> Tween:
	var half_gap := clampf(0.5 - coverage, 0.0, 0.49)
	var top_bottom := 0.5 - half_gap
	var bottom_top := 0.5 + half_gap
	var tween := create_tween().set_parallel(true)
	tween.tween_property(_top_lid, "anchor_bottom", top_bottom, duration).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(_bottom_lid, "anchor_top", bottom_top, duration).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	return tween
