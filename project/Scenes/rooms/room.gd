class_name Room
extends Node2D

signal final


func _ready() -> void:
	for child in get_children():
		if child is Clickable:
			child.pressed.connect(_on_clickable.bind(child))


func _on_clickable(clickable) -> void:
	if clickable.name == "FilingCabinet":
		if get_parent().check_win():
			clickable.action()
	else:
		clickable.action()


func _on_static_scene_spawn() -> void:
	get_parent().disable_menu(3)


func pause_room() -> void:
	for child in get_children():
		if child is Clickable:
			child.disabled = true


func resume_room() -> void:
	for child in get_children():
		if child is Clickable:
			child.disabled = false
	get_parent().activate_menus()


func give_item(title, texture):
	if get_parent().has_node("HUD"):
		get_parent().get_node("HUD").add_item(title, texture)
		

func unlock(room_number) -> void:
	get_parent().room_unlock(room_number)
	

func connect_clickable(object) -> void:
	object.pressed.connect(_on_clickable.bind(object))

