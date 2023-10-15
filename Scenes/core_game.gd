extends Node2D
	
var points: int = 0

func player_death() -> void:
	$Player.die()
	
func player_gain_point(amount) -> void:
	points += amount


func _on_obstacle_spawner_obstacle_spawned(obstacle):
	obstacle.connect("playerDeath", player_death)
	obstacle.connect("playerScorePoint", player_gain_point)
