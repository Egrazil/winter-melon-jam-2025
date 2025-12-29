# code and implementation is taken from https://www.youtube.com/watch?v=lILnUD3xph8

extends AudioStreamPlayer

const levelMusic = preload("res://assets/audio/Drifting_Away.mp3")

func _ready() -> void:
	play()
