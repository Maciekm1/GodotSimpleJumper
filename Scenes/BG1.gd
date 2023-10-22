extends Sprite2D

@export var scroll_speed: int = 250
var bg_width: int = 1440

func _process(delta):
	position.x -= scroll_speed * delta
	if position.x <= -(bg_width/2):
		position.x += bg_width * 2
