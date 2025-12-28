extends OmniLight3D



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(Input.is_action_pressed("ui_up")):
		position.x += 2 * delta
	if(Input.is_action_pressed("ui_down")):
		position.x -= 2 * delta
