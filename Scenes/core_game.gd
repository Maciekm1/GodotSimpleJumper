extends Node2D
	
var points: int = 0
	
func player_gain_point(amount) -> void:
	points += amount
	$UI.update_points_counter(points)

func _on_obstacle_spawner_obstacle_spawned(obstacle):
	obstacle.connect("playerDeath", player_death)
	obstacle.connect("playerScorePoint", player_gain_point)


func _on_game_boundry_top_body_entered(body):
	player_death()

func _on_game_boundry_bot_body_entered(body):
	player_death()

func player_death() -> void:
	$Player.die()
	await get_tree().create_timer(2).timeout
	get_tree().create_tween().tween_property($UI/ScreenDark, "color:a", 0.5, 1)
