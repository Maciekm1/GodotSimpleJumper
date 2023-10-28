extends TextureRect

@export var scroll_speed: int = 250
@onready var bg_width: float = size.x
@export var order: int = 0

func _ready():
	position.x = order * bg_width

func _process(delta):
	position.x -= scroll_speed * delta
	if position.x <= -bg_width:
		position.x += bg_width * 2
