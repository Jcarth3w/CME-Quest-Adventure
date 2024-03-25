class_name Room
extends Node2D

signal final
signal item_add
signal disable_menus
signal activate_menus

@export var final_mini_game : TextureButton


func _ready() -> void:
	for child in get_children():
		if child is Clickable:
			connect_clickable(child)

	if get_parent() != null and get_parent().has_node("HUD"):
		get_parent().get_node("HUD").pause.connect(_on_hud_pause)


func on_clickable(clickable) -> void:
	if final_mini_game != null:
		if clickable.name == final_mini_game.name:
			if get_parent().check_win():
				clickable.action()
		else:
			clickable.action()
	else:
		if clickable is NewSceneClickable:
			clickable.action()
		else:
			clickable.action()
			clickable.play_sound()



func connect_clickable(clickable):
	clickable.pressed.connect(on_clickable.bind(clickable))


func on_static_scene_spawn() -> void:
	disable_menus.emit(3)


func pause_room() -> void:
	for child in get_children():
		if child is Clickable:
			child.disabled = true
			child.set_mouse_filter(2)


func resume_room() -> void:
	for child in get_children():
		if child is Clickable:
			child.disabled = false
			child.set_mouse_filter(0)
	activate_menus.emit()


func give_item(title, texture):
	item_add.emit(title, texture)


func unlock(room_number) -> void:
	get_parent().room_unlock(room_number)


func _on_hud_pause(value) -> void:
	if value == true:
		pause_room()
	else:
		resume_room()


func _on_clickable_sound_play(emited_sound):
	var sound = emited_sound
	get_parent().play_sound(sound)
