class_name Room
extends Node2D

var menu = preload("res://Scenes/gui/in_game_menu.tscn")
var state := "active"
var menu_spawned = false
var hud


func _ready() -> void:
	for child in get_children():
		if child is NewSceneClickable:
			child.scene_changed.connect(_on_scene_change)

	for child in get_children():
		if child.name == "HUD":
			hud = child


	hud.resume.connect(_on_menu_resume)
	hud.pause.connect(pause_game)


func check_win():
	pass


func _process(_delta):
	check_win()


func _on_scene_change(command) -> void:
	if command == "pause":
		pause_game()
	else:
		resume_game()


func pause_game() -> void:
	for child in get_children():
		if child.has_method("pause"):
			child.pause()


func resume_game() -> void:
	for child in get_children():
		if child.has_method("resume"):
			child.resume()


func _on_menu_resume() -> void:
	hud.get_node("Timer").start()
	menu_spawned = false
	resume_game()