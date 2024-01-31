class_name HUD
extends Node2D

signal pause
signal resume

var items = []
var current_item := 1
var map_active = true
var menu_active = true
var scenario_menu = preload("res://Scenes/gui/scenario_menu.tscn")


func _ready():
	$InGameMenu.get_node("quit").pressed.connect(_on_quit_pressed)
	$InGameMenu.get_node("resume").pressed.connect(_on_resume_pressed)
	$InGameMenu.get_node("scenario").pressed.connect(_on_scenario_pressed)
	$RoomMenu.get_node("Room1").pressed.connect(_on_room1_pressed)
	$RoomMenu.get_node("Room2").pressed.connect(_on_room2_pressed)
	$RoomMenu.get_node("Room2").visible = false
	$RoomMenu.get_node("Room3").pressed.connect(_on_room3_pressed)
	$RoomMenu.get_node("Room3").visible = false


func add_item_image(sprite_path) -> void:
	if current_item == 1:
		$Inventory/Item1.texture = sprite_path
	elif current_item == 2:
		$Inventory/Item2.texture = sprite_path
	elif current_item == 3:
		$Inventory/Item3.texture = sprite_path
	elif current_item == 4:
		$Inventory/Item4.texture = sprite_path
	elif current_item == 5:
		$Inventory/Item5.texture = sprite_path
	elif current_item == 6:
		$Inventory/Item6.texture = sprite_path
	else:
		$Inventory/Item7.texture = sprite_path
	current_item += 1


func add_item(item_name, sprite_path) -> void:
	items.append(item_name)
	add_item_image(sprite_path)


func _on_menu_button_pressed():
	if menu_active:
		get_parent().pause_room()
		get_parent().get_data()
		if $RoomMenu.visible == false:
			$Timer.stop()
			$InGameMenu.visible = true


func _on_objectives_button_pressed():
	if $ObjectiveMenu.visible == false:
		$ObjectiveMenu.visible = true
		$BlackBorderRectangle/Label.text = "Hide Objectives"
	else:
		$ObjectiveMenu.visible = false
		$BlackBorderRectangle/Label.text = "View Objectives"


func _on_quit_pressed():
	get_parent().send_data(0)
	if FileAccess.file_exists("res://Scenes/mini_games/Crossword_Puzzle/saved_puzzle.txt"):
		var dir = DirAccess.open("res://Scenes/mini_games/Crossword_Puzzle/")
		dir.remove("saved_puzzle.txt")
	await get_tree().create_timer(2).timeout
	get_tree().quit()


func _on_resume_pressed():
	$Timer.start()
	get_parent().resume_room()
	$InGameMenu.visible = false


func _on_scenario_pressed():
	var scenario_menu_inst = scenario_menu.instantiate()
	add_child(scenario_menu_inst)


func _on_map_button_pressed():
	if map_active and $RoomMenu.visible == false:
		get_parent().pause_room()
		if $InGameMenu.visible == false:
				$RoomMenu.visible = true
	elif $RoomMenu.visible == true:
		$RoomMenu.visible = false
		get_parent().resume_room()


func room_menu_press() -> void:
	if $RoomMenu.visible == true:
		$RoomMenu.visible = false
	else:
		$RoomMenu.visible = true


func _on_room1_pressed():
	get_parent().enter_room(get_parent().get_node("Room1"))
	get_parent().current_room = get_parent().get_node("Room1")
	$RoomMenu.visible = false


func _on_room2_pressed():
	get_parent().enter_room(get_parent().get_node("Room2"))
	get_parent().current_room = get_parent().get_node("Room2")
	$RoomMenu.visible = false


func _on_room3_pressed():
	get_parent().enter_room(get_parent().get_node("Room3"))
	get_parent().current_room = get_parent().get_node("Room3")
	$RoomMenu.visible = false
