extends MeshInstance3D

#@onready var check_in_light: RayCast3D = $"check-in-light"


func _process(delta: float) -> void:
	if(Input.is_action_pressed("ui_up")):
		position.x += 1 * delta
	if(Input.is_action_pressed("ui_down")):
		position.x -= 1 * delta
	print($"check-in-light".is_colliding())
	#print(check_in_light.target_position)
