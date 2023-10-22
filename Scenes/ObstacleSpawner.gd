extends Node2D

@export var enabled: bool = true
@export var obstacle_resource_array: Array[Obstacle_Spawn_Info_Resource]
@export var spawn_point_x: int = 2160

@export var can_spawn: bool = true

signal obstacle_spawned(obstacle: Node2D)
		
func _process(delta):
	if enabled and can_spawn:
		var obstacle_resource: Obstacle_Spawn_Info_Resource  = obstacle_resource_array[randi() % obstacle_resource_array.size()]
		spawn_obstacle(obstacle_resource)
		can_spawn = false
		$SpawnCooldown.wait_time = obstacle_resource.spawn_cooldown
		$SpawnCooldown.start()
		
func spawn_obstacle(info: Obstacle_Spawn_Info_Resource):
	var obstacle = info.obstacle.instantiate() as Node2D
	obstacle.position = Vector2(spawn_point_x, clamp((randi() % info.max_spawn_height), info.min_spawn_height, info.max_spawn_height))
	add_child(obstacle)
	
	obstacle_spawned.emit(obstacle)
	
func _on_spawn_cooldown_timeout():
	can_spawn = true
