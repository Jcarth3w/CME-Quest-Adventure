extends Control

@export var clickable_name : String


func _on_pressed():
	print("Pressed " + clickable_name)
	queue_free()
