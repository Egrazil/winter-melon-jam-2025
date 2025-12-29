extends Control


func _on_level_1_pressed() -> void:
	# When we actually have a level, put its path into the string
	get_tree().change_scene_to_file("res://scenes/levels/Lights and moving.tscn")
	pass



func _on_quit_pressed() -> void:
	get_tree().quit()
