extends Node2D

@export var particle: PackedScene
@export var pool_count: int = 8
var index: int = 0

func _ready():
	for _i in range(pool_count):
		add_child(particle.instantiate())

func get_next_particle() -> GPUParticles2D:
	return get_child(index)
	
func trigger():
	get_next_particle().restart()
	index = (index + 1) % pool_count
