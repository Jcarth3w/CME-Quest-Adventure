class_name RemoveButton
extends Clickable

signal room1

func _ready() -> void:
	connect_mouse()


func action():
	print("Here")
	queue_free()
