extends CanvasLayer

func update_points_counter(new_points):
	var tween = get_tree().create_tween()
	tween.tween_property($MarginContainer/Label, "theme_override_font_sizes/font_size", 86, .5).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property($MarginContainer/Label, "theme_override_font_sizes/font_size", 64, .3).set_trans(Tween.TRANS_CUBIC)
	$MarginContainer/Label.text = str(new_points)
	
