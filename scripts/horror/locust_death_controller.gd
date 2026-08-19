extends Node

const FRONT_SCREAMER := preload("res://assets/audio/screamers/jakes-screamer.mp3")
const REAR_SCREAMER := preload("res://assets/audio/screamers/the-screamer-shared-between-mallie-and-jenny.mp3")

@export var red_peak_alpha := 0.22
@export var black_fade_time := 0.62

var _overlay: CanvasLayer
var _red: ColorRect
var _black: ColorRect
var _audio: AudioStreamPlayer

func play_and_recover(player: CharacterBody3D, locust: Node3D, terrain: Node) -> void:
	if player == null or locust == null:
		return
	player.set_controls_enabled(false)
	player.set_look_enabled(false)
	player.velocity = Vector3.ZERO

	var head := player.get_node("Head") as Node3D
	var viewmodel := player.get_node_or_null("ViewmodelLayer/ViewmodelContainer/ViewmodelViewport/ViewmodelWorld") as Node3D
	var arms: Node3D = null
	var flashlight_visual: Node3D = null
	if viewmodel != null:
		arms = viewmodel.get_node_or_null("ArmsRoot") as Node3D
		flashlight_visual = viewmodel.get_node_or_null("FlashlightVisualRoot/CanonicalFlashlight") as Node3D
	var flashlight_rig := player.get_node_or_null("Head/Camera3D/FlashlightRig")

	var head_position := head.position
	var head_rotation := head.rotation
	var arms_position := arms.position if arms != null else Vector3.ZERO
	var arms_rotation := arms.rotation if arms != null else Vector3.ZERO

	var front_death := _is_front_attack(player, locust)
	_build_overlay()
	_play_screamer(front_death)

	if flashlight_rig != null and flashlight_rig.has_method("drop_for_death"):
		var side := player.global_basis.x * (-0.22 if front_death else 0.25)
		var drop_position := player.global_position + side + (-player.global_basis.z * 0.28)
		var drop_direction := (-player.global_basis.z + player.global_basis.x * (0.18 if front_death else -0.22)).normalized()
		flashlight_rig.call("drop_for_death", drop_position, drop_direction)
	if flashlight_visual != null:
		flashlight_visual.visible = false

	if front_death:
		await _play_front(player, head, arms, locust)
	else:
		await _play_rear(player, head, arms)

	var fade := create_tween().set_parallel(true)
	fade.tween_property(_black, "color:a", 1.0, black_fade_time).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN)
	fade.tween_property(_red, "color:a", 0.05, black_fade_time)
	await fade.finished
	await get_tree().create_timer(0.24).timeout

	# Restore save while the screen is fully black.
	if SaveSystem.has_run():
		SaveSystem.load_run()
	if SaveSystem.has_player_position:
		player.teleport_to(SaveSystem.last_player_position)
	elif terrain != null and terrain.has_method("sample_height"):
		player.teleport_to(Vector3(0.0, float(terrain.call("sample_height", 0.0, 0.0)) + 0.06, 0.0))

	head.position = head_position
	head.rotation = head_rotation
	if arms != null:
		arms.position = arms_position
		arms.rotation = arms_rotation
	if flashlight_rig != null and flashlight_rig.has_method("restore_after_death"):
		flashlight_rig.call("restore_after_death")
	if flashlight_visual != null and flashlight_rig != null:
		flashlight_visual.visible = bool(flashlight_rig.get("acquired"))

	player.set_look_enabled(true)
	player.set_controls_enabled(true)
	var recover := create_tween()
	recover.tween_property(_black, "color:a", 0.0, 0.38).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	await recover.finished
	_overlay.queue_free()

func _is_front_attack(player: Node3D, locust: Node3D) -> bool:
	var to_locust := locust.global_position - player.global_position
	to_locust.y = 0.0
	if to_locust.length_squared() < 0.001:
		return true
	return (-player.global_basis.z).dot(to_locust.normalized()) >= 0.0

func _play_front(player: CharacterBody3D, head: Node3D, arms: Node3D, locust: Node3D) -> void:
	# Chest impact: player sees the creature, defensive hands rise, then the body folds.
	var to_locust := locust.global_position - player.global_position
	to_locust.y = 0.0
	if to_locust.length_squared() > 0.001:
		var target_yaw := atan2(-to_locust.normalized().x, -to_locust.normalized().z)
		var turn := create_tween()
		turn.tween_property(player, "rotation:y", target_yaw, 0.16).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		await turn.finished

	var impact := create_tween().set_parallel(true)
	impact.tween_property(head, "position", head.position + Vector3(0.0, -0.10, 0.10), 0.18).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
	impact.tween_property(head, "rotation", head.rotation + Vector3(deg_to_rad(-8.0), 0.0, deg_to_rad(5.0)), 0.18)
	if arms != null:
		impact.tween_property(arms, "position", arms.position + Vector3(0.0, 0.16, -0.13), 0.18).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
		impact.tween_property(arms, "rotation", arms.rotation + Vector3(deg_to_rad(-18.0), 0.0, deg_to_rad(4.0)), 0.18)
	await impact.finished

	var collapse := create_tween().set_parallel(true)
	collapse.tween_property(head, "position", head.position + Vector3(0.05, -0.72, 0.18), 1.18).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN)
	collapse.tween_property(head, "rotation", head.rotation + Vector3(deg_to_rad(31.0), 0.0, deg_to_rad(-13.0)), 1.18)
	if arms != null:
		collapse.tween_property(arms, "position", arms.position + Vector3(0.06, -0.08, -0.04), 1.05)
		collapse.tween_property(arms, "rotation", arms.rotation + Vector3(deg_to_rad(16.0), deg_to_rad(-7.0), deg_to_rad(-8.0)), 1.05)
	await collapse.finished
	await _pulse_red(0.16)

func _play_rear(_player: CharacterBody3D, head: Node3D, arms: Node3D) -> void:
	# Rear impalement: no convenient turn-around reveal. Camera is pulled forward/down,
	# hands snap toward the center as if trying to grab the limb behind the chest.
	var hit := create_tween().set_parallel(true)
	hit.tween_property(head, "position", head.position + Vector3(-0.04, -0.05, -0.17), 0.12).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
	hit.tween_property(head, "rotation", head.rotation + Vector3(deg_to_rad(11.0), 0.0, deg_to_rad(-7.0)), 0.12)
	if arms != null:
		hit.tween_property(arms, "position", arms.position + Vector3(0.0, 0.14, -0.18), 0.14).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
		hit.tween_property(arms, "rotation", arms.rotation + Vector3(deg_to_rad(-26.0), 0.0, 0.0), 0.14)
	await hit.finished
	await _pulse_red(0.18)

	var weaken := create_tween().set_parallel(true)
	weaken.tween_property(head, "position", head.position + Vector3(0.08, -0.78, 0.06), 1.32).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN)
	weaken.tween_property(head, "rotation", head.rotation + Vector3(deg_to_rad(38.0), deg_to_rad(5.0), deg_to_rad(16.0)), 1.32)
	if arms != null:
		weaken.tween_property(arms, "position", arms.position + Vector3(-0.02, -0.10, -0.02), 1.08)
		weaken.tween_property(arms, "rotation", arms.rotation + Vector3(deg_to_rad(21.0), 0.0, deg_to_rad(9.0)), 1.08)
	await weaken.finished

func _pulse_red(duration: float) -> void:
	var pulse := create_tween()
	pulse.tween_property(_red, "color:a", red_peak_alpha, duration * 0.35)
	pulse.tween_property(_red, "color:a", 0.08, duration * 0.65)
	await pulse.finished

func _play_screamer(front: bool) -> void:
	_audio = AudioStreamPlayer.new()
	_audio.name = "LocustDeathScreamer"
	_audio.stream = FRONT_SCREAMER if front else REAR_SCREAMER
	_audio.volume_db = -1.5
	add_child(_audio)
	_audio.play()

func _build_overlay() -> void:
	_overlay = CanvasLayer.new()
	_overlay.layer = 120
	_red = ColorRect.new()
	_red.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	_red.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_red.color = Color(0.52, 0.0, 0.0, 0.04)
	_overlay.add_child(_red)
	_black = ColorRect.new()
	_black.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	_black.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_black.color = Color(0.0, 0.0, 0.0, 0.0)
	_overlay.add_child(_black)
	get_tree().root.add_child(_overlay)
