extends Node2D

var current_room = 1
var url = "http://localhost:8000/postdata.php"
var url2 = "http://localhost:8000/pulldata.php"
var scenario_num = 1
var generic_user = "Lani"
var finished_time
var rooms = []


func _ready():
	for child in get_children():
		if child is Room:
			rooms.append(child)
	enter_room(1)
	if FileAccess.file_exists("res://Scenes/mini_games/Crossword_Puzzle/saved_puzzle.txt"):
		var dir = DirAccess.open("res://Scenes/mini_games/Crossword_Puzzle/")
		dir.remove("saved_puzzle.txt")


func enter_room(new_room):
	for room in rooms:
		if room != rooms[new_room]:
			room.pause_game()
			room.visible = false
		else:
			room.resume_game()
			room.visible = true


func room_unlock(room_number):
	if room_number == 2:
		$HUD/RoomMenu/Room2.visible = true


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
		$Room1.pause_game()
	elif current_room == 2:
		$Room2.pause_game()


func resume_room():
	if current_room == 1:
		$Room1.resume_game()
	elif current_room == 2:
		$Room2.resume_game()


func send_data():
	finished_time = $HUD/Timer/Label.text
	var data_to_send = {"scenario" : scenario_num,
	"username": generic_user,
	"time": finished_time,
	"finished": 1
	}
	$DBoperations.make_post_request(url, data_to_send)
	
func get_data():
	$DBoperations.make_get_request(url2)
