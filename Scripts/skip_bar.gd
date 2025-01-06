extends ProgressBar








####################################################################################################
####																							####
####																							####
####								IGNORE THE CODE IN THIS FILE								####
####																							####
####																							####
####################################################################################################










signal disappear
signal skip_tutorial


var skipping: bool = false


func _input(event: InputEvent) -> void:
	if event is InputEventKey and not event.is_echo():
		match event.physical_keycode:
			KEY_SPACE:
				if event.is_pressed():
					get("theme_override_styles/fill").set("bg_color", Color8(0, 255, 200, 255))
					$"../SkipLabel".get("label_settings").set("font_color", Color(1, 1, 1, 1))
					value = 0
					skipping = true
				elif event.is_released():
					skipping = false
					disappear.emit()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if skipping:
		value += 1
		if value >= max_value:
			skip_tutorial.emit()
