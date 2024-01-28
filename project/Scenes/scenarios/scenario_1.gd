extends Node2D

var current_room : Node2D
var url = "http://localhost:8000/postdata.php"
var url2 = "http://localhost:8000/pulldata.php"
var scenario_num = 1
var generic_user = "Lani"
var finished_time
var finished
var rooms = []


func _ready():
	current_room = find_child("Room1")
	for child in get_children():
		if child is Room:
			rooms.append(child)
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
	current_room.pause_room()


func resume_room():
	current_room.resume_room()


func send_data():
	finished_time = $HUD/Timer/Label.text
	var data_to_send = {"scenario" : scenario_num,
	"username": generic_user,
	"time": finished_time,
	"finished": finished
	}
	$DBoperations.make_post_request(url, data_to_send)
	
func get_data():
	$DBoperations.make_get_request(url2)
