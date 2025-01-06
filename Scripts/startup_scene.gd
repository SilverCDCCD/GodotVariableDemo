extends Control








####################################################################################################
####																							####
####																							####
####								IGNORE THE CODE IN THIS FILE								####
####																							####
####																							####
####################################################################################################








var message_index: int = -1
var messages = ["This project was made to demonstrate what variables are and how they are used in a game design context.",
				"Variables are used to store and manipulate information.",
				"There are many types of variables, each with their unique purposes.",
				"Choose your demo."]


func _input(event: InputEvent) -> void:
	if event is InputEventKey and not event.is_echo():
		match event.physical_keycode:
			KEY_SPACE:
				if event.is_pressed():
					$SkipTimer.stop()


func _ready() -> void:
	$AdvanceTimer.wait_time = 4
	$SkipTimer.wait_time = 2
	
	$SkipTimer.connect("timeout", hide_skip)
	$SkipBar.disappear.connect(hide_skip)
	$SkipBar.skip_tutorial.connect(move_to_main_menu)
	
	$SkipTimer.start()
	advance()


func advance() -> void:
	message_index += 1
	print("Advanced to message {0}".format([message_index]))
	if message_index < len(messages):
		$Text.text = messages[message_index]
		fade_in_text()
	else:
		move_to_main_menu()


func fade_in_text() -> void:
	print("Fade in started")
	
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


func move_to_main_menu() -> void:
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
