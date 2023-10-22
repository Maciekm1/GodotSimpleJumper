extends ObstacleRingBase

@export var move_speed_y:float = 1
var timer: float = 0

func _process(delta):
	super._process(delta)
	timer += delta
	position.y += sin(timer * move_speed_y) * 300 * delta
