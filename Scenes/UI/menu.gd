extends Control



func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/core_game.tscn")


func _on_options_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/UI/options.tscn")


func _on_quit_game_button_pressed():
	get_tree().quit()
