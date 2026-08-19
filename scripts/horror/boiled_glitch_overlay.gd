extends CanvasLayer

@export var minimum_interval := 4.2
@export var maximum_interval := 11.5
@export var minimum_duration := 0.055
@export var maximum_duration := 0.18
@export var strip_count := 10
@export var rare_microburst_chance := 0.08

var _root: Control
var _strips: Array[ColorRect] = []
var _rng := RandomNumberGenerator.new()
var _next_event_at := INF
var _event_until := -1.0
var _active := false

func _ready() -> void:
	layer = 90
	_rng.seed = int(GameState.run_seed) ^ 0xB011ED
	_build_overlay()
	GameState.boiled_influence_changed.connect(_on_influence_changed)
	_on_influence_changed(GameState.boiled_influenced)

func _process(_delta: float) -> void:
	if not _active:
		return
	var now := Time.get_ticks_msec() / 1000.0
	if _event_until > 0.0 and now >= _event_until:
		_hide_all()
		_event_until = -1.0
		_schedule_next(now)
	elif _event_until < 0.0 and now >= _next_event_at:
		_play_glitch(now)

func _on_influence_changed(enabled: bool) -> void:
	_active = enabled
	if not enabled:
		_hide_all()
		_next_event_at = INF
		_event_until = -1.0
		return
	_schedule_next(Time.get_ticks_msec() / 1000.0)

func _build_overlay() -> void:
	_root = Control.new()
	_root.name = "BoiledGlitchRoot"
	_root.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	_root.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(_root)
	for i in strip_count:
		var strip := ColorRect.new()
		strip.name = "GlitchStrip_%02d" % i
		strip.mouse_filter = Control.MOUSE_FILTER_IGNORE
		strip.visible = false
		_root.add_child(strip)
		_strips.append(strip)

func _schedule_next(now: float) -> void:
	_next_event_at = now + _rng.randf_range(minimum_interval, maximum_interval)

func _play_glitch(now: float) -> void:
	_hide_all()
	var viewport_size := get_viewport().get_visible_rect().size
	var active_count := _rng.randi_range(2, 5)
	var indices: Array[int] = []
	for i in _strips.size():
		indices.append(i)
	for i in range(indices.size() - 1, 0, -1):
		var j := _rng.randi_range(0, i)
		var temp := indices[i]
		indices[i] = indices[j]
		indices[j] = temp

	var microburst := _rng.randf() < rare_microburst_chance
	if microburst:
		active_count = mini(_strips.size(), _rng.randi_range(5, 8))

	for n in active_count:
		var strip := _strips[indices[n]]
		var height := _rng.randf_range(2.0, 12.0 if not microburst else 22.0)
		strip.position = Vector2(_rng.randf_range(-18.0, 18.0), _rng.randf_range(0.0, maxf(1.0, viewport_size.y - height)))
		strip.size = Vector2(viewport_size.x + 36.0, height)
		var color_roll := _rng.randf()
		if color_roll < 0.78:
			var gray := _rng.randf_range(0.48, 0.90)
			strip.color = Color(gray, gray, gray, _rng.randf_range(0.035, 0.10))
		elif color_roll < 0.90:
			strip.color = Color(0.12, 0.78, 0.88, _rng.randf_range(0.025, 0.065))
		else:
			strip.color = Color(0.95, 0.08, 0.055, _rng.randf_range(0.025, 0.060))
		strip.visible = true

	_event_until = now + (_rng.randf_range(0.22, 0.70) if microburst else _rng.randf_range(minimum_duration, maximum_duration))

func _hide_all() -> void:
	for strip: ColorRect in _strips:
		strip.visible = false
