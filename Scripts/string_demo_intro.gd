extends Control









####################################################################################################
####																							####
####																							####
####								IGNORE THE CODE IN THIS FILE								####
####																							####
####																							####
####################################################################################################








var message_index: int = -1
var messages = ["This demo shows how strings are used.",
				"\"String\" is short for \"String of Characters\".",
				"These typically represent words, phrases, and sentences.",
				"In the following example, you'll type your name to receive a custom greeting.",
				"Your name is tracked using a string variable that will update itself as you type.",
				"Press ESCAPE to return to the main menu."]


func _input(event: InputEvent) -> void:
	if event is InputEventKey and not event.is_echo():
		match event.physical_keycode:
			KEY_SPACE:
				if event.is_pressed():
					$SkipTimer.stop()


func _ready() -> void:
	$AdvanceTimer.wait_time = 3
	$SkipTimer.wait_time = 2
	
	$SkipTimer.connect("timeout", hide_skip)
	$SkipBar.disappear.connect(hide_skip)
	$SkipBar.skip_tutorial.connect(move_to_demo)
	
	$SkipTimer.start()
	advance()


func advance() -> void:
	message_index += 1
	if message_index < len(messages):
		$Text.text = messages[message_index]
		fade_in_text()
	else:
		move_to_demo()


func fade_in_text() -> void:
	var alpha_tween = create_tween()
	alpha_tween.tween_property($Text.get("label_settings"), "font_color", Color(1, 1, 1, 1), 1)
	await alpha_tween.finished
	
	$AdvanceTimer.start()
	await $AdvanceTimer.timeout
	fade_out($Text, 1)


func fade_out(component: Control, fade_time: float) -> void:
	var init_color: Color
	var end_color: Color
	var source: String
	var output: String
	
	if component is Label:
		init_color = Color8(255, 255, 255, 255)
		end_color = Color8(255, 255, 255, 0)
		source = "label_settings"
		output = "font_color"
	elif component is ProgressBar:
		init_color = Color8(0, 255, 200, 255)
		end_color = Color8(0, 255, 200, 0)
		source = "theme_override_styles/fill"
		output = "bg_color"
	
	var alpha_tween = create_tween()
	alpha_tween.tween_property(component.get(source), output, end_color, fade_time)
	
	await alpha_tween.finished
	if component.name == "Text":
		advance()


func hide_skip() -> void:
	fade_out($SkipBar, 1)
	fade_out($SkipLabel, 1)


func move_to_demo() -> void:
	get_tree().change_scene_to_file("res://Scenes/string_demo.tscn")
