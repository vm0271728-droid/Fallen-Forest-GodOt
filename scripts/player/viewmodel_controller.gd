extends Node3D

@export var viewmodel_fov := 61.0
@export var pickup_duration := 2.55
@export var flashlight_light_delay := 0.08
@export var idle_breath_amplitude := 0.006
@export var walk_sway_amplitude := Vector2(0.010, 0.007)
@export var run_sway_amplitude := Vector2(0.017, 0.012)

@onready var viewmodel_camera: Camera3D = $ViewmodelCamera
@onready var arms_root: Node3D = $ArmsRoot
@onready var flashlight_visual_root: Node3D = $FlashlightVisualRoot
@onready var flashlight_model: Node3D = $FlashlightVisualRoot/CanonicalFlashlight
@onready var document_visual_root: Node3D = $DocumentVisualRoot
@onready var document_model: Node3D = $DocumentVisualRoot/CanonicalDocument

var _player: CharacterBody3D
var _world_flashlight_rig: Node3D
var _arms_base := Vector3.ZERO
var _flashlight_base := Vector3.ZERO
var _document_base := Vector3.ZERO
var _time := 0.0
var _pickup_playing := false
var _document_playing := false

func _ready() -> void:
	_player = get_node("../../../..") as CharacterBody3D
	_world_flashlight_rig = _player.get_node("Head/Camera3D/FlashlightRig") as Node3D
	viewmodel_camera.fov = viewmodel_fov
	_arms_base = arms_root.position
	_flashlight_base = flashlight_visual_root.position
	_document_base = document_visual_root.position
	document_visual_root.visible = false
	_sync_flashlight_visibility()

func _process(delta: float) -> void:
	_time += delta
	if _world_flashlight_rig != null and not _pickup_playing:
		flashlight_visual_root.rotation.x = _world_flashlight_rig.rotation.x
		flashlight_visual_root.rotation.y = _world_flashlight_rig.rotation.y
	_sync_flashlight_visibility()

	if _pickup_playing or _document_playing or _player == null:
		return

	var flat_speed := Vector2(_player.velocity.x, _player.velocity.z).length()
	var walk_ratio := clampf(flat_speed / 3.25, 0.0, 1.0)
	var final_ratio := clampf(flat_speed / 6.5, 0.0, 1.0)
	var running := flat_speed > 4.2
	var sway := run_sway_amplitude if running else walk_sway_amplitude
	var movement_weight := final_ratio if running else walk_ratio

	# Two mixed frequencies avoid a generic weapon-bob sine loop.
	var side := (sin(_time * 7.1) * 0.62 + sin(_time * 3.8 + 1.1) * 0.38) * sway.x * movement_weight
	var vertical := (abs(sin(_time * 6.4 + 0.35)) - 0.48) * sway.y * movement_weight
	var breath := sin(_time * 1.35) * idle_breath_amplitude * (1.0 - movement_weight * 0.55)
	var target := _arms_base + Vector3(side, vertical + breath, 0.0)
	arms_root.position = arms_root.position.lerp(target, 1.0 - exp(-10.0 * delta))

	var flashlight_offset := Vector3(side * 0.60, vertical * 0.72 + breath * 0.45, 0.0)
	flashlight_visual_root.position = flashlight_visual_root.position.lerp(_flashlight_base + flashlight_offset, 1.0 - exp(-11.0 * delta))

func play_flashlight_pickup() -> void:
	if _pickup_playing or _document_playing or _world_flashlight_rig == null:
		return
	if bool(_world_flashlight_rig.get("acquired")):
		return

	_pickup_playing = true
	_player.set_controls_enabled(false)
	flashlight_model.visible = true

	var arms_start := _arms_base + Vector3(-0.035, -0.20, 0.10)
	var flashlight_start := _flashlight_base + Vector3(0.08, -0.55, -0.18)
	arms_root.position = arms_start
	flashlight_visual_root.position = flashlight_start
	flashlight_visual_root.rotation = Vector3(deg_to_rad(24.0), deg_to_rad(-11.0), deg_to_rad(13.0))

	var lift := create_tween().set_parallel(true)
	lift.tween_property(arms_root, "position", _arms_base + Vector3(-0.012, -0.025, 0.025), 1.48).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	lift.tween_property(flashlight_visual_root, "position", _flashlight_base + Vector3(0.018, 0.018, 0.035), 1.48).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
	lift.tween_property(flashlight_visual_root, "rotation", Vector3(deg_to_rad(4.0), deg_to_rad(-2.5), deg_to_rad(2.0)), 1.48).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
	await lift.finished

	var regrip := create_tween()
	regrip.tween_property(arms_root, "position", _arms_base + Vector3(0.006, -0.010, 0.015), 0.34).set_trans(Tween.TRANS_SINE)
	regrip.tween_property(arms_root, "position", _arms_base, 0.24).set_trans(Tween.TRANS_SINE)
	await regrip.finished

	_world_flashlight_rig.call("acquire", false)
	await get_tree().create_timer(flashlight_light_delay).timeout
	_world_flashlight_rig.call("set_enabled", true)

	var settle_time := maxf(0.12, pickup_duration - 1.48 - 0.34 - 0.24 - flashlight_light_delay)
	var settle := create_tween().set_parallel(true)
	settle.tween_property(flashlight_visual_root, "position", _flashlight_base, settle_time).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	settle.tween_property(flashlight_visual_root, "rotation", Vector3.ZERO, settle_time).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	settle.tween_property(arms_root, "position", _arms_base, settle_time).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	await settle.finished

	_pickup_playing = false
	_player.set_controls_enabled(true)
	_sync_flashlight_visibility()

func play_document_pickup(variant: int) -> void:
	if _document_playing or _pickup_playing:
		return
	_document_playing = true
	_player.set_controls_enabled(false)
	document_visual_root.visible = true

	var variant_id := posmod(variant, 3)
	var duration := [2.12, 2.34, 2.56][variant_id]
	var side_offset := [-0.055, -0.025, -0.075][variant_id]
	var roll := [deg_to_rad(-12.0), deg_to_rad(-4.0), deg_to_rad(-18.0)][variant_id]
	var pitch := [deg_to_rad(-8.0), deg_to_rad(4.0), deg_to_rad(-2.0)][variant_id]

	document_visual_root.position = _document_base + Vector3(-0.42, -0.42, -0.12)
	document_visual_root.rotation = Vector3(deg_to_rad(26.0), deg_to_rad(-18.0), deg_to_rad(-24.0))
	arms_root.position = _arms_base + Vector3(-0.05, -0.12, 0.04)

	var raise_time := duration * 0.56
	var raise := create_tween().set_parallel(true)
	raise.tween_property(document_visual_root, "position", _document_base + Vector3(side_offset, -0.02, 0.02), raise_time).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
	raise.tween_property(document_visual_root, "rotation", Vector3(pitch, deg_to_rad(-3.0), roll), raise_time).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
	raise.tween_property(arms_root, "position", _arms_base + Vector3(-0.018, -0.025, 0.02), raise_time).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	await raise.finished

	var grip_time := duration * 0.20
	var grip := create_tween()
	grip.tween_property(arms_root, "position", _arms_base + Vector3(0.008, -0.008, 0.018), grip_time * 0.55).set_trans(Tween.TRANS_SINE)
	grip.tween_property(arms_root, "position", _arms_base, grip_time * 0.45).set_trans(Tween.TRANS_SINE)
	await grip.finished

	var lower_time := maxf(0.22, duration - raise_time - grip_time)
	var lower := create_tween().set_parallel(true)
	lower.tween_property(document_visual_root, "position", _document_base + Vector3(-0.16, -0.55, -0.08), lower_time).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN)
	lower.tween_property(document_visual_root, "rotation", Vector3(deg_to_rad(18.0), 0.0, deg_to_rad(-8.0)), lower_time).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN)
	lower.tween_property(arms_root, "position", _arms_base, lower_time).set_trans(Tween.TRANS_SINE)
	await lower.finished

	document_visual_root.visible = false
	document_visual_root.position = _document_base
	document_visual_root.rotation = Vector3.ZERO
	arms_root.position = _arms_base
	_document_playing = false
	_player.set_controls_enabled(true)

func hide_for_ending() -> void:
	flashlight_model.visible = false
	document_visual_root.visible = false

func _sync_flashlight_visibility() -> void:
	if flashlight_model == null or _world_flashlight_rig == null:
		return
	if _pickup_playing:
		flashlight_model.visible = true
		return
	var acquired := bool(_world_flashlight_rig.get("acquired"))
	var ending := bool(_world_flashlight_rig.get("placed_for_ending"))
	flashlight_model.visible = acquired and not ending
