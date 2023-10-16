extends ObstacleRingBase

@export var rotation_speed: int = 60

func _process(delta):
	super._process(delta)
	rotation_degrees += (rotation_speed * randf_range(0.8, 1.2)) * delta
