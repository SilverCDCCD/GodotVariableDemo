extends TextureRect








####################################################################################################
####																							####
####																							####
####								IGNORE THE CODE IN THIS FILE								####
####																							####
####																							####
####################################################################################################










var direction: Vector2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position = (get_viewport_rect().size - size) * .5
	randomize_direction()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	move()


func move():
	position += direction
	if position.x <= 0 or position.x >= 1056:
		direction.x *= -1
	if position.y <= 0 or position.y >= 552:
		direction.y *= -1


func randomize_direction():
	var theta = randf() * 2 * PI
	direction = Vector2(cos(theta), sin(theta)) * sqrt(randf())
