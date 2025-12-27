extends RayCast3D


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	target_position = $"../../OmniLight3D".position - $"..".position
	
