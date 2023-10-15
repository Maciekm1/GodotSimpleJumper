extends Node2D
class_name ObstacleRingBase

signal playerDeath
signal playerScorePoint(amount)

@export var speed:int = 0
@export var pointGain: int = 1:
	set(value):
		pointGain = value
	get:
		return pointGain

func _process(delta):
	position.x -= speed * delta


func _on_death_area_2d_body_entered(body):
	playerDeath.emit()


func _on_score_point_area_2d_body_entered(body):
	playerScorePoint.emit(pointGain)
