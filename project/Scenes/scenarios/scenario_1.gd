extends Node2D

var current_room = 1


func _ready():
	$Room2.pause_game()
	$Room2.visible = false
	if FileAccess.file_exists("res://Scenes/mini_games/Crossword_Puzzle/saved_puzzle.txt"):
		var dir = DirAccess.open("res://Scenes/mini_games/Crossword_Puzzle/")
		dir.remove("saved_puzzle.txt")


func enter_room(room_number):
	if room_number == 1:
		current_room = 1
		$Room2.visible = false
		$Room2.pause_game()
		$Room.visible = true
		$Room.resume_game()
	elif room_number == 2:
		current_room = 2
		$Room.visible = false
		$Room.pause_game()
		$Room2.visible = true
		$Room2.resume_game()


func check_unlock():
	if current_room == 1:
		if $Room.check_win():
			$HUD.empty_inventory()
			$HUD.add_item("Folder", load("res://Assets/Sprites/room_1_custom_placeholders/Promo_file.png"))
			$HUD/RoomMenu/Room2.visible = true
			$HUD/WhiteRect/Label.text = "Find the adult learning resources"
	elif current_room == 2:
		if $Room2.check_win():
			$HUD/Timer.stop()
			$HUD/WhiteRect/Label.text = "Congratulations! You Won!"


func disable_menu(menu) -> void:
	if menu == 1:
		$HUD.menu_active = false
	elif menu == 2:
		$HUD.map_active = false
	elif menu == 3:
		$HUD.menu_active = false
		$HUD.map_active = false

func activate_menus() -> void:
	$HUD.menu_active = true
	$HUD.map_active = true
	

func pause_room():
	if current_room == 1:
		$Room.pause_game()
	elif current_room == 2:
		$Room2.pause_game()


func resume_room():
	if current_room == 1:
		$Room.resume_game()
	elif current_room == 2:
		$Room2.resume_game()
