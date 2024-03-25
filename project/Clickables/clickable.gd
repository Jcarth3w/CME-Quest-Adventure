class_name Clickable
extends TextureButton

@export var sound : AudioStream

signal play

func action() -> void:
	pass


func connect_mouse() -> void:
	set_mouse_filter(0)
	mouse_entered.connect(on_mouse_entered)
	mouse_exited.connect(on_mouse_exited)


func on_mouse_entered():
	scale = scale * 1.1
	position.x -= 10
	position.y -= 10


func on_mouse_exited():
	scale = scale / 1.1
	position.x += 10
	position.y += 10

func play_sound() -> void:
	play.emit(sound)
