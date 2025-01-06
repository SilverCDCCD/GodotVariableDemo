extends Control








####################################################################################################
####																							####
####																							####
####								IGNORE THE CODE IN THIS FILE								####
####																							####
####																							####
####################################################################################################











func _input(event: InputEvent) -> void:
	if event is InputEventKey and event.is_pressed() and not event.is_echo() and event.physical_keycode == KEY_ESCAPE:
		get_tree().quit()
