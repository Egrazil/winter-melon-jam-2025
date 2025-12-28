extends Node3D

@export var light : Node3D

@onready var light_detector: RayCast3D = $"light-detector"
@onready var submesh: MeshInstance3D = $mesh


func _ready() -> void:
	light_detector.light = light
	#light_detector.enter_light.connect(_on_lightdetector_enter_light)
	#light_detector.exit_light.connect(_on_lightdetector_exit_light)
	



func _on_lightdetector_enter_light() -> void:
	submesh.scale.z *= 10
	print("enter light")

func _on_lightdetector_exit_light() -> void:
	submesh.scale.z /= 10
	print("exit light")
