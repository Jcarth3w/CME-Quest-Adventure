extends Node2D
var current_room = 1
var username = "john"
var finished_time
var finished = 0
var generic_user = "Lani"
var scenario_num = 1
var rooms = []
var open_screen_path = "res://Scenes/gui/menus/scenario_menu.tscn"
var end_screen_path = "res://Scenes/static_scene/end_screen.tscn"


func _ready():
	current_room = find_child("Room1")
	var open_screen = load(open_screen_path)
	var open_scrn_inst = open_screen.instantiate()
	open_scrn_inst.get_node("ContinueButton").pressed.connect(on_open_screen_close)
	add_child(open_scrn_inst)
	for child in get_children():
		if child is Room:
			rooms.append(child)
			child.pause_room()
			child.final.connect(_on_room_final)
	if FileAccess.file_exists("res://Scenes/mini_games/Crossword_Puzzle/saved_puzzle.txt"):
		var dir = DirAccess.open("res://Scenes/mini_games/Crossword_Puzzle/")
		dir.remove("saved_puzzle.txt")


func enter_room(new_room):
	for room in rooms:
		if room != new_room:
			room.pause_room()
			room.visible = false
		else:
			room.resume_room()
			room.visible = true


func check_win() -> bool:
	if $HUD.items.size() == 7:
		return true
	$popup_gui.show_pickup("You have unfinished objectives")
	return false


func room_unlock(room_number):
	if room_number == 2:
		$HUD/RoomMenu/Room2.visible = true
	elif room_number == 3:
		$HUD/RoomMenu/Room3.visible = true


func on_open_screen_close() -> void:
	$Room1.resume_room()
	$HUD/Timer.start()


func _on_room_final() -> void:
	$HUD/Timer.stop()
	var end_screen = load(end_screen_path)
	var end_screen_inst = end_screen.instantiate()
	end_screen_inst.username = username
	end_screen_inst.scen_num = 1
	end_screen_inst.time_val = $HUD/Timer/Label.text
	add_child(end_screen_inst)


func send_data(completed):
	finished_time = $HUD/Timer/Label.text
	$DBoperations.make_post_request(1, finished_time, "Johnny", completed)


func get_data():
	$DBoperations.make_get_request()
