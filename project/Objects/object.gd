class_name Obj
extends Node2D


var clickableObjects = []


func _ready():
	for child in get_children():
		if child is Clickable:
			clickableObjects.append(child)
			child.connect("clicked", self, "_on_clickable_clicked")


func _on_clickable_clicked(sender):
	var clicked_object = sender

	var clickable = clicked_object.get_parent()

	clickable.queue_free()
