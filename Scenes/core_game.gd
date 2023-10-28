extends Node2D
	
var points:int:
	set(value):
		points = value
		$UI.update_points_counter(points)
var started:bool:
	set(value):
		if(value):
			$ObstacleSpawner.enabled = true
			$Background/BG1.scroll_speed = 350
			$Background/BG2.scroll_speed = 350
			$movingPlatform.scroll_speed = 350
		else:
			$ObstacleSpawner.enabled = false
			$Background/BG1.scroll_speed = 0
			$Background/BG2.scroll_speed = 0
			$movingPlatform.scroll_speed = 0
			
		started = value
	
	
func _process(delta):
	if(not started and Input.is_action_just_pressed("Jump")):
		started = true
		
func player_gain_point(amount: int) -> void:
	points += amount
	
func reset_player_points() -> void:
	points = 0

func _on_obstacle_spawner_obstacle_spawned(obstacle):
	if obstacle.is_in_group("Obstacle"):
		obstacle.connect("playerDeath", player_death)
		obstacle.connect("playerScorePoint", player_gain_point)

func _on_game_boundry_top_body_entered(body):
	player_death()

func _on_game_boundry_bot_body_entered(body):
	player_death()

func player_death() -> void:
	reset_player_points()
	started = false
	for obstacle in get_tree().get_nodes_in_group("Obstacle"):
		obstacle.queue_free()
	
	$ObstacleSpawner.enabled = false
	
	$Player.die()
	await get_tree().create_timer(1).timeout
	get_tree().create_tween().tween_property($UI/ScreenDark, "color:a", 0.5, 1)
	await get_tree().create_timer(2).timeout
	get_tree().create_tween().tween_property($UI/ScreenDark, "color:a", 0, 1)

func player_gain_pick_up(pick_up: PickUpBase) -> void:
	pick_up.apply_effect($Player as Player)
