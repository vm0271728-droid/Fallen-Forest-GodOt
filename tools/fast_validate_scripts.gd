extends SceneTree

var _failures := PackedStringArray()

func _initialize() -> void:
	_scan_dir("res://scripts")
	_scan_dir("res://tools")
	if _failures.is_empty():
		print("FAST_GDSCRIPT_VALIDATION: PASS")
		quit(0)
	else:
		for failure: String in _failures:
			push_error(failure)
		print("FAST_GDSCRIPT_VALIDATION: FAIL (%d scripts)" % _failures.size())
		quit(1)

func _scan_dir(path: String) -> void:
	var dir := DirAccess.open(path)
	if dir == null:
		_failures.append("Unable to open %s" % path)
		return
	dir.list_dir_begin()
	while true:
		var entry := dir.get_next()
		if entry.is_empty():
			break
		if entry.begins_with("."):
			continue
		var child_path := path.path_join(entry)
		if dir.current_is_dir():
			_scan_dir(child_path)
		elif entry.get_extension().to_lower() == "gd":
			var resource := ResourceLoader.load(child_path, "GDScript", ResourceLoader.CACHE_MODE_IGNORE)
			if resource == null:
				_failures.append("Failed to compile %s" % child_path)
	dir.list_dir_end()
