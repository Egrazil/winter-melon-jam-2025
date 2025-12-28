extends RayCast3D

# The main light of the scene, what to check against for line of sight
@export var light: Node3D

# sent when entering the light
signal enter_light
# sent when exiting the light
signal exit_light


var wasInLight = false

# called once at beginning
func _ready() -> void:
	wasInLight = not is_colliding()
	exit_light.emit()



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	print(light)
	if (light):
		target_position = light.position - global_position
	else:
		print("no light")
	if (!wasInLight && !is_colliding()):
		wasInLight = true
		enter_light.emit()
	if (wasInLight && is_colliding()):
		wasInLight = false
		exit_light.emit()





	
