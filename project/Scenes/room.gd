class_name Room
extends Node2D

var menu = preload("res://Scenes/in_game_menu.tscn")
var state := "active"
# Called when the node enters the scene tree for the first time.

func _ready():
	for child in get_children():
		if child is NewSceneClickable:
			child.scene_changed.connect(_on_scene_change)

func check_win():
	pass
		
func _process(_delta):
	check_win()

	if Input.is_action_just_pressed("menu"):
		var menu_inst = menu.instantiate()
		add_child(menu_inst)
		pause_game()
	

func _on_scene_change(command):
	if command == "pause":
		pause_game()
	else:
		resume_game()

func pause_game():
	for child in get_children():
		if child.has_method("pause"):
			child.pause()

func resume_game():
	for child in get_children():
		if child.has_method("resume"):
			child.resume()
