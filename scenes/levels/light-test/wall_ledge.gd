extends MeshInstance3D

@export var light : Node3D

@onready var light_detector: RayCast3D = $"light-detector"
@onready var submesh: GeometryInstance3D = $mesh

var offMaterial: Material
var onMaterial: Material

func _ready() -> void:
	light_detector.light = light
	#light_detector.enter_light.connect(_on_lightdetector_enter_light)
	#light_detector.exit_light.connect(_on_lightdetector_exit_light)
	offMaterial = Material.new()
	#offMaterial.albedo_color = Color("FFFFFF")
	onMaterial = Material.new()
	#onMaterial.albedo_color = Color("390261")
	#$mesh
	
	
func set_light(newLight: Node3D):
	light_detector.light = newLight
	




func _on_lightdetector_enter_light() -> void:
	submesh.scale.x = 0.1
	$StaticBody3D/CollisionShape3D.scale.x = 0.1
	#$mesh.get_active_material(0).albedo_color = Color("390261")
	#$mesh.set_surface_override_material(0,onMaterial)
	print("enter light")

func _on_lightdetector_exit_light() -> void:
	submesh.scale.x = 1
	$StaticBody3D/CollisionShape3D.scale.x = 1
	#$mesh.get_active_material(0).albedo_color = Color("FFFFFF")
	#$mesh.set_surface_override_material(0,onMaterial)
	print("exit light")
