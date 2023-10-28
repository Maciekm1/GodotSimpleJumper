extends PickUpBase

func apply_effect(player: Player) -> void:
	player.reversed = not player.reversed

