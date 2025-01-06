extends Control

################################################################################
####																		####
####	This is a string. They're used to represent words and phrases.		####
####	This is useful for displaying information to the player.			####
####	This string will update itself as you type.							####
####																		####
################################################################################
var user_name: String = ""













####################################################################################################
####																							####
####																							####
####								IGNORE CODE BEYOND THIS POINT								####
####																							####
####																							####
####################################################################################################

var pairs = {KEY_A: "A", KEY_B: "B", KEY_C: "C", KEY_D: "D", KEY_E: "E", KEY_F: "F", KEY_G: "G",
			KEY_H: "H", KEY_I: "I", KEY_J: "J", KEY_K: "K", KEY_L: "L", KEY_M: "M", KEY_N: "N",
			KEY_O: "O", KEY_P: "P", KEY_Q: "Q", KEY_R: "R", KEY_S: "S", KEY_T: "T", KEY_U: "U",
			KEY_V: "V", KEY_W: "W", KEY_X: "X", KEY_Y: "Y", KEY_Z: "Z", KEY_SPACE: " ", KEY_0: "0",
			KEY_1: "1", KEY_2: "2", KEY_3: "3", KEY_4: "4", KEY_5: "5", KEY_6: "6", KEY_7: "7",
			KEY_8: "8", KEY_9: "9"}

func _input(event: InputEvent) -> void:
	if event is InputEventKey and event.is_pressed() and not event.is_echo():
		if event.keycode in pairs.keys():
			user_name += pairs[event.keycode]
			$NameLabel.text = user_name.capitalize()
			print(user_name)
		else:
			match event.keycode:
				KEY_BACKSPACE:
					user_name = user_name.substr(0, len(user_name) - 1)
					$NameLabel.text = user_name.capitalize()
				KEY_ENTER:
					$GreetingLabel.text = "Hello {0}!".format([user_name.capitalize()])
					$Timer.start()
				KEY_ESCAPE:
					get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")


func _ready() -> void:
	$Timer.wait_time = 2
	$Timer.timeout.connect(reset)


func reset() -> void:
	$NameLabel.text = ""
	$GreetingLabel.text = ""
	user_name = ""
