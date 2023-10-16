extends CharacterBody2D

@export var jump_force: int = 400
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var deathParticles: PackedScene = preload("res://Scenes/Particles/player_death_particles2.tscn")
var alive: bool = true

func _physics_process(delta):
	velocity.y += gravity * delta
	
	if(Input.is_action_just_pressed("Jump") and alive):
		velocity.y = -jump_force
		
		$ParticlePool.get_next_particle().global_position = $ParticleSpawnPoint.global_position
		$ParticlePool.trigger()
		$AnimationPlayer.play("jump")
	
	move_and_slide()

func die():
	if(alive):
		alive = false
		$CollisionShape2D.set_deferred("disabled", true)

		
		var deathParticlesInstance = deathParticles.instantiate() as CPUParticles2D
		add_child(deathParticlesInstance)
		deathParticlesInstance.lifetime = 3
		deathParticlesInstance.emitting = true
		
		await get_tree().create_tween().tween_property($Sprite2D, "scale", Vector2(0, 0), 0.1).finished
		$Sprite2D.hide()
		
		await get_tree().create_timer(4).timeout
		queue_free()
