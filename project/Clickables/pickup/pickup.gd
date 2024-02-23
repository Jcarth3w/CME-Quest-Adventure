class_name Pickup
extends Clickable


func _ready() -> void:
	connect_mouse()


func action():
	get_parent().give_item(name, texture_normal)
	queue_free()
