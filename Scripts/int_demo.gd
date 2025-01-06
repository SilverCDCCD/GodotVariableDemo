extends Control

############################################################################
####																	####
####	This is an int. It's a whole number.							####
####	These are generally used whenever you need a number.			####
####	Typically, these are better than floats whenever possible.		####
####	This value is set to increase when you press RIGHT (max 10)		####
####		and decrease when you press LEFT.							####
####	This number controls the number of floaters in the scene.		####
####																	####
############################################################################
var floaters: int = 1









####################################################################################################
####																							####
####																							####
####								IGNORE CODE BEYOND THIS POINT								####
####																							####
####																							####
####################################################################################################
@onready var pf_floater = preload("res://Scenes/bouncer.tscn")


func _input(event: InputEvent) -> void:
	if event is InputEventKey and event.is_pressed() and not event.is_echo():
		match event.physical_keycode:
			KEY_LEFT:
				if floaters > 0:
					floaters -= 1
					$Label.text = "Number of Floaters: {0}".format([floaters])
					var floaters = $Floaters.get_children()
					var last_floater = floaters[-1]
					$Floaters.remove_child(last_floater)
			KEY_RIGHT:
				if floaters < 10:
					floaters += 1
					$Label.text = "Number of Floaters: {0}".format([floaters])
					spawn_floater()
			KEY_ESCAPE:
				get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")


func spawn_floater():
	var new_floater = pf_floater.instantiate()
	$Floaters.add_child(new_floater)
