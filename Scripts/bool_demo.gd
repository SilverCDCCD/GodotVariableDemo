extends Control

########################################################################################################
####																								####
####	This is a bool value. It can either be true or false.										####
####	We can use bools to control whether or not something is happening in the game.				####
####	When this value is true, the screen screen's color will slowly pulse.						####
####	When false, the screen's color will remain constant.										####
####	I have this value set to switch between true and false every time you press the space bar.	####
####																								####
########################################################################################################
var pulsing: bool = false










####################################################################################################
####																							####
####																							####
####							IGNORE CODE BEYOND THIS POINT!									####
####																							####
####																							####
####################################################################################################









var intensity = 1
var rising: bool = false
var color: Color = Color8(0, 160, 200)


func _input(event: InputEvent) -> void:
	if event is InputEventKey and event.is_pressed() and not event.is_echo():
		match event.physical_keycode:
			KEY_SPACE:
				pulsing = not pulsing
				$Label.text = "Pulsing: {0}".format([str(pulsing).capitalize()])
			KEY_ESCAPE:
				get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if pulsing:
		intensity += (delta if rising else -delta) * .2
		color.a = 1
		$Background.color = color * intensity
		if (rising and intensity >= 1) or (not rising and intensity <= .7):
			rising = not rising


func _ready() -> void:
	$Background.color = color
