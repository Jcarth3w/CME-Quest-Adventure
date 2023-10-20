class_name Clickable
extends Area2D

signal clicked


func _ready():
	set_process_input(true)


func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		emit_signal("clicked")
		print("Clicked!")
