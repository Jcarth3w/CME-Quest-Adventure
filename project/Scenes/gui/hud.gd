class_name HUD
extends Node2D

signal pause
signal game_over

var items = []
var item_slots = []
var current_item := 0
var map_active = true
var menu_active = true
var return_main_menu = "res://Scenes/main_menus/main_menu.tscn"
var scenario_menu = preload("res://Scenes/gui/menus/scenario_menu.tscn")
var objectives_color
var scenario_menu_title
var scenario_menu_description

func _ready():
	connect_buttons()
	connect_room_signals()
	for child in $Inventory.get_children():
		if child is Sprite2D:
			item_slots.append(child)
	objectives_color = $BlackBorderRectangle/RedFillRectangle.color
	$ObjectiveMenu/Label.text = get_parent().get_node("ObjectivesText").text


func add_item_image(sprite_path) -> void:
	item_slots[current_item].texture = sprite_path
	current_item += 1


func on_item_add(title, texture) -> void:
	items.append(title)
	add_item_image(texture)


func on_mouse_entered(button):
	if button.get_name() == StringName("ObjectivesButton"):
		$BlackBorderRectangle/RedFillRectangle.color = Color.DARK_RED
	button.scale = button.scale * 1.1
	button.position.x -= 5
	button.position.y -= 5


func on_mouse_exited(button):
	if button.get_name() == StringName("ObjectivesButton"):
		$BlackBorderRectangle/RedFillRectangle.color = objectives_color
	button.scale = button.scale / 1.1
	button.position.x += 5
	button.position.y += 5


func on_hud_button_pressed(button):
	match button.get_name():
		StringName("MenuButton"):
			if menu_active:
				pause.emit(true)
				get_parent().get_data()
				if $RoomMenu.visible == false:
					$Timer.stop()
					$InGameMenu.visible = true
		StringName("MapButton"):
			if map_active and $RoomMenu.visible == false:
				pause.emit(true)
				if $InGameMenu.visible == false:
						$RoomMenu.visible = true
			elif $RoomMenu.visible == true:
				$RoomMenu.visible = false
				pause.emit(false)
		StringName("ObjectivesButton"):
			if $ObjectiveMenu.visible == false:
				$ObjectiveMenu.visible = true
				$BlackBorderRectangle/Label.text = "Hide Objectives"
			else:
				$ObjectiveMenu.visible = false
				$BlackBorderRectangle/Label.text = "View Objectives"
		_:
			pass


func in_game_menu_press(button_name):
	match button_name:
		"Resume":
			$Timer.start()
			pause.emit(false)
			$InGameMenu.visible = false
		"Scenario":
			var scenario_menu_inst = scenario_menu.instantiate()
			scenario_menu_inst.title = scenario_menu_title
			scenario_menu_inst.description = scenario_menu_description
			add_child(scenario_menu_inst)
		"Quit":
			get_parent().send_data(0)
			if FileAccess.file_exists("res://Scenes/mini_games/Crossword_Puzzle/saved_puzzle.txt"):
				var dir = DirAccess.open("res://Scenes/mini_games/Crossword_Puzzle/")
				dir.remove("saved_puzzle.txt")
			await get_tree().create_timer(2).timeout
			get_tree().change_scene_to_file(return_main_menu)


func on_room_select(room_name):
	get_parent().enter_room(get_parent().get_node(String(room_name)))
	get_parent().current_room = get_parent().get_node(String(room_name))
	$RoomMenu.visible = false


func on_activate_menus() -> void:
	menu_active = true
	map_active = true


func on_disable_menus(menu) -> void:
	if menu == 1:
		menu_active = false
	elif menu == 2:
		map_active = false
	elif menu == 3:
		menu_active = false
		map_active = false


func connect_buttons() -> void:
	for child in get_children():
		if child is TextureButton:
			child.pressed.connect(on_hud_button_pressed.bind(child))
			child.set_mouse_filter(0)
			child.mouse_entered.connect(on_mouse_entered.bind(child))
			child.mouse_exited.connect(on_mouse_exited.bind(child))
		elif child.name == StringName("InGameMenu"):
			child.in_game_menu_press.connect(in_game_menu_press)
		elif child.name == StringName("RoomMenu"):
			child.room_select.connect(on_room_select)


func connect_room_signals() -> void:
	if get_parent() != null:
		for child in get_parent().get_children():
			if child is Room:
				child.activate_menus.connect(on_activate_menus)
				child.disable_menus.connect(on_disable_menus)
				child.item_add.connect(on_item_add)


func _on_timer_zero():
	get_parent().on_game_over()
	print("function called")
