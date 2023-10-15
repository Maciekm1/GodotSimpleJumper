extends CharacterBody2D

@export var jump_force: int = 400
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var alive: bool = true

func _physics_process(delta):
	velocity.y += gravity * delta
	
	if(Input.is_action_just_pressed("Jump") and alive):
		velocity.y = -jump_force
		
		$ParticlePool.get_next_particle().global_position = $ParticleSpawnPoint.global_position
		$ParticlePool.trigger()
		$AnimationPlayer.play("jump")
#		var tween = get_tree().create_tween()
#		tween.tween_property(self, "scale", Vector2(1.05, 1.05), .2).from(Vector2(.95, .95))
#		tween.tween_property(self, "scale", Vector2(1, 1), .1)
	
	move_and_slide()

func die():
	if(alive):
		alive = false
		$CollisionShape2D.set_deferred("disabled", true)
		$Sprite2D.hide()
		$DeathParticles.emitting = true
		await get_tree().create_timer(5.0).timeout
		queue_free()
