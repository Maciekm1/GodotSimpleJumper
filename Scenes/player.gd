extends CharacterBody2D

@export var jump_force: int = 400
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	velocity.y += gravity * delta
	
	if(Input.is_action_just_pressed("Jump")):
		velocity.y = -jump_force
	
	move_and_slide()
