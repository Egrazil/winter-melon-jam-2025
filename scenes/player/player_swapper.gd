extends Node

var threeD = false

@export var threePlayer : CharacterBody3D
@export var twoPlayer : CharacterBody3D
@export var flatCam : Camera3D

func _unhandled_key_input(_event: InputEvent) -> void:
	if Input.is_key_pressed(KEY_Q):
		if threeD:
			threePlayer.visible = false
			twoPlayer.visible = true
			flatCam.make_current()
		else:
			threePlayer.visible = true
			twoPlayer.visible = false
			threePlayer.get_node("Head").get_node("Camera3D").make_current()
		threeD = !threeD
