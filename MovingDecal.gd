extends Node

@onready var decal = $Decal
@onready var cast3D = $ShapeCast3D

@export var move_speed: float = 5.0
@export var surface_offset: float = 0.01

func get_normal() -> Vector3:
	var count = cast3D.get_collision_count()
	var sum := Vector3.ZERO
	for i in count:
		sum += cast3D.get_collision_normal(i)

	return sum.normalized()

func _physics_process(delta: float) -> void:
	
	var input: Vector2 = Input.get_vector("moveLeft", "moveRight", "moveDown", "moveUp")
	var right = decal.global_transform.basis.x
	var forward = -decal.global_transform.basis.z
	
	right.y = 0 
	forward.y = 0
	right = right.normalized()
	forward = forward.normalized()
	
	var moveDir = (right * input.x + forward * input.y).normalized()
	decal.global_position += moveDir * move_speed * delta
	
	cast3D.global_position = decal.global_position + (decal.transform.basis.y * 25)
	cast3D.target_position = -decal.transform.basis.y
	cast3D.force_shapecast_update()
	
	if cast3D.get_collision_count() == 0:
		decal.visible = false
		return
	
	decal.visible = true
	
	var hit = cast3D.get_collision_point(0) 
	var normal = get_normal()
	decal.global_position = hit + normal * surface_offset
	
	var upRef = Vector3.UP
	if abs(normal.dot(Vector3.UP)) > 0.98:
		upRef = Vector3.FORWARD
		
	decal.look_at(decal.global_position - normal, upRef)
	pass
