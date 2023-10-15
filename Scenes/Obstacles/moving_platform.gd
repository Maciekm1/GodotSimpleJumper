extends StaticBody2D

@export var scroll_speed: int = 250

func _process(delta):
	position.x -= scroll_speed * delta
