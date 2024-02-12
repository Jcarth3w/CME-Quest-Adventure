class_name Room
extends Node2D

signal final
signal item_add
signal disable_menus
signal activate_menus


func _ready() -> void:
	for child in get_children():
		if child is Clickable:
			child.pressed.connect(_on_clickable.bind(child))
	
	if get_parent() != null and get_parent().has_node("HUD"):
		get_parent().get_node("HUD").pause.connect(_on_hud_pause)
		get_parent().get_node("HUD").resume.connect(_on_hud_resume)


func _on_clickable(clickable) -> void:
	if clickable.name == "FilingCabinet":
		if get_parent().check_win():
			clickable.action()
		else:
			get_parent().get_node("popup_gui").show_message("You need to collect all promo materials")
	else:
		clickable.action()
		


func _on_static_scene_spawn() -> void:
	disable_menus.emit(3)


func pause_room() -> void:
	for child in get_children():
		if child is Clickable:
			child.disabled = true


func resume_room() -> void:
	for child in get_children():
		if child is Clickable:
			child.disabled = false
	activate_menus.emit()


func give_item(title, texture):
	item_add.emit(title, texture)
	get_parent().get_node("popup_gui").show_pickup(title)


func unlock(room_number) -> void:
	get_parent().room_unlock(room_number)


func connect_clickable(object) -> void:
	object.pressed.connect(_on_clickable.bind(object))


func _on_hud_pause() -> void:
	pause_room()


func _on_hud_resume() -> void:
	resume_room()
