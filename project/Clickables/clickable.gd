class_name Clickable
extends TextureButton



func action() -> void:
	pass


func connect_mouse() -> void:
	set_mouse_filter(0)
	mouse_entered.connect(on_mouse_entered)
	mouse_exited.connect(on_mouse_exited)


func on_mouse_entered():
	scale = scale * 1.1


func on_mouse_exited():
	scale = scale / 1.1
