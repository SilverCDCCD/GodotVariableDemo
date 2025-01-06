extends Control








####################################################################################################
####																							####
####																							####
####								IGNORE THE CODE IN THIS FILE								####
####																							####
####																							####
####################################################################################################











# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Buttons/BoolDemoButton.pressed.connect(load_scene.bind("bool"))
	$Buttons/FloatDemoButton.pressed.connect(load_scene.bind("float"))
	$Buttons/IntDemoButton.pressed.connect(load_scene.bind("int"))
	$Buttons/StringDemoButton.pressed.connect(load_scene.bind("string"))


func load_scene(scene: String) -> void:
	get_tree().change_scene_to_file("res://Scenes/{0}_demo_intro.tscn".format([scene]))
