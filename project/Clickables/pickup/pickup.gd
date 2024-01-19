class_name Pickup
extends Clickable

func action():
	get_parent().give_item(name, texture_normal)
	queue_free()
