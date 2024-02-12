class_name HUD
extends Node2D

signal pause
signal resume

var items = []
var item_slots = []
var current_item := 0
var map_active = true
var menu_active = true
var scenario_menu = preload("res://Scenes/gui/scenario_menu.tscn")


func _ready():
	connect_menu_buttons()
	connect_room_signals()
	for child in $Inventory.get_children():
		if child is Sprite2D:
			item_slots.append(child)


func add_item_image(sprite_path) -> void:
	item_slots[current_item].texture = sprite_path
	current_item += 1


func _on_menu_button_pressed():
	if menu_active:
		pause.emit()
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
	resume.emit()
	$InGameMenu.visible = false


func _on_scenario_pressed():
	var scenario_menu_inst = scenario_menu.instantiate()
	add_child(scenario_menu_inst)


func _on_map_button_pressed():
	if map_active and $RoomMenu.visible == false:
		pause.emit()
		if $InGameMenu.visible == false:
				$RoomMenu.visible = true
	elif $RoomMenu.visible == true:
		$RoomMenu.visible = false
		resume.emit()


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


func _on_activate_menus() -> void:
	menu_active = true
	map_active = true


func _on_disable_menus(menu) -> void:
	if menu == 1:
		menu_active = false
	elif menu == 2:
		map_active = false
	elif menu == 3:
		menu_active = false
		map_active = false


func _on_item_add(title, texture) -> void:
	items.append(title)
	add_item_image(texture)


func connect_menu_buttons() -> void:
	$InGameMenu.get_node("quit").pressed.connect(_on_quit_pressed)
	$InGameMenu.get_node("resume").pressed.connect(_on_resume_pressed)
	$InGameMenu.get_node("scenario").pressed.connect(_on_scenario_pressed)
	$RoomMenu.get_node("Room1").pressed.connect(_on_room1_pressed)
	$RoomMenu.get_node("Room2").pressed.connect(_on_room2_pressed)
	$RoomMenu.get_node("Room2").visible = false
	$RoomMenu.get_node("Room3").pressed.connect(_on_room3_pressed)
	$RoomMenu.get_node("Room3").visible = false


func connect_room_signals() -> void:
	if get_parent() != null:
		for child in get_parent().get_children():
			if child is Room:
				child.activate_menus.connect(_on_activate_menus)
				child.disable_menus.connect(_on_disable_menus)
				child.item_add.connect(_on_item_add)
