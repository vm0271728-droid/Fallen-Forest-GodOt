extends CanvasLayer

var _label: Label
var _fade_tween: Tween

func _ready() -> void:
	_label = Label.new()
	_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	_label.set_anchors_preset(Control.PRESET_CENTER_TOP)
	_label.position = Vector2(-220.0, 45.0)
	_label.size = Vector2(440.0, 90.0)
	_label.add_theme_font_size_override("font_size", 30)
	_label.modulate.a = 0.0
	add_child(_label)
	GameState.documents_changed.connect(_on_documents_changed)

func _on_documents_changed(collected: int, required: int) -> void:
	_label.text = ("ДОКУМЕНТЫ\n%d / %d" if Settings.language == "ru" else "DOCUMENTS\n%d / %d") % [collected, required]
	if _fade_tween != null:
		_fade_tween.kill()
	_label.modulate.a = 0.0
	_fade_tween = create_tween()
	_fade_tween.set_pause_mode(Tween.TWEEN_PAUSE_PROCESS)
	_fade_tween.tween_property(_label, "modulate:a", 1.0, 0.2)
	_fade_tween.tween_interval(1.8)
	_fade_tween.tween_property(_label, "modulate:a", 0.0, 0.35)
