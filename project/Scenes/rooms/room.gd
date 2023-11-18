class_name Room
extends Node2D

var menu = preload("res://Scenes/gui/in_game_menu.tscn")
var state := "active"
var menu_spawned = false
var hud
# Called when the node enters the scene tree for the first time.

func _ready():
	for child in get_children():
		if child is NewSceneClickable:
			child.scene_changed.connect(_on_scene_change)
	
	for child in get_children():
		if child.name == "HUD":
			hud = child

func check_win():
	pass
		
func _process(_delta):
	check_win()

	if Input.is_action_just_pressed("menu"):
		if menu_spawned == false:
			var menu_inst = menu.instantiate()
			add_child(menu_inst)
			menu_inst.resume.connect(_on_menu_resume)
			pause_game()
			hud.get_node("Timer").stop()
			menu_spawned = true
			
	

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

func _on_menu_resume():
	hud.get_node("Timer").start()
	menu_spawned = false
	resume_game()

