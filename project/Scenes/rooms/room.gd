class_name Room
extends Node2D

var state := "active"


func _ready() -> void:
	for child in get_children():
		if child is NewSceneClickable:
			child.scene_changed.connect(_on_scene_change)
		if child is StaticScene:
			child.pressed.connect(_on_static_scene_spawn)
	

func check_win():
	pass


func _on_scene_change(command) -> void:
	if command == "pause":
		pause_game()
	else:
		resume_game()


func _on_static_scene_spawn() -> void:
	get_parent().disable_menu(3)


func pause_game() -> void:
	for child in get_children():
		if child.has_method("pause"):
			child.pause()


func resume_game() -> void:
	for child in get_children():
		if child.has_method("resume"):
			child.resume()
	get_parent().activate_menus()

func give_item(title, texture):
	if get_parent().has_node("HUD"):
		get_parent().get_node("HUD").add_item(title, texture)

