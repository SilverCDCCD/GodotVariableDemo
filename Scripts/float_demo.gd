extends Control

####################################################################################################
####																							####
####	This value is a float. It's a decimal number.											####
####	This is useful when you need more precision than an int can provide.					####
####	This value is set up to control how many bars are filled								####
####		and how full they are.																####
####																							####
####################################################################################################
var fill_amount: float = 0.0











####################################################################################################
####																							####
####																							####
####								IGNORE CODE BEYOND THIS POINT								####
####																							####
####																							####
####################################################################################################












func _input(event: InputEvent) -> void:
	if event is InputEventKey and event.is_pressed() and not event.is_echo():
		match event.physical_keycode:
			KEY_LEFT:
				adjust_fill(-.1)
			KEY_RIGHT:
				adjust_fill(.1)
			KEY_UP:
				adjust_fill(1)
			KEY_DOWN:
				adjust_fill(-1)
			KEY_ESCAPE:
				get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")


func adjust_fill(amt: float) -> void:
	fill_amount = clampf(fill_amount + amt, 0, 5)
	$Bars/Bar1.value = 100 * (fill_amount - 4)
	$Bars/Bar2.value = 100 * (fill_amount - 3)
	$Bars/Bar3.value = 100 * (fill_amount - 2)
	$Bars/Bar4.value = 100 * (fill_amount - 1)
	$Bars/Bar5.value = 100 * fill_amount
	$FillLabel.text = "Bars Filled: {percent}".format({"percent": "%0.1f" % fill_amount})
