extends Node2D
class_name PickUpBase

@export var scroll_speed: int = 350

func apply_effect(player: Player) -> void:
	pass
	
func _process(delta):
	position.x -= scroll_speed * delta
	
	
func _on_body_entered(body: Player):
	apply_effect(body)
	queue_free()
	
