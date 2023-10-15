extends Node2D
	
var points: int = 0
	
func player_gain_point(amount) -> void:
	points += amount

func _on_obstacle_spawner_obstacle_spawned(obstacle):
	obstacle.connect("playerDeath", player_death)
	obstacle.connect("playerScorePoint", player_gain_point)


func _on_game_boundry_top_body_entered(body):
	player_death()

func _on_game_boundry_bot_body_entered(body):
	player_death()

func player_death() -> void:
	$Player.die()
