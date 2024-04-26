class_name Scenario
extends Node2D

@export var scenario_num : int
@export var max_items : int
@export var scenario_title : String
@export var scenario_description : String
@export var current_room : Node2D
@export var final_sound : AudioStream


var username = ""
var finished_time
var finished = 0
var rooms = []
var open_screen_path = "res://Scenes/gui/menus/opening_screen.tscn"
var end_screen_path = "res://Scenes/static_scene/end_screen.tscn"
var lose_screen_path = "res://Scenes/static_scene/lose_screen.tscn"


func _ready():
	var open_screen = load(open_screen_path)
	var open_scrn_inst = open_screen.instantiate()
	open_scrn_inst.title = scenario_title
	open_scrn_inst.description = scenario_description
	open_scrn_inst.get_node("ContinueButton").pressed.connect(on_open_screen_close)
	open_scrn_inst.send_username.connect(on_username_recieved)
	add_child(open_scrn_inst)
	for child in get_children():
		if child is Room:
			rooms.append(child)
			child.pause_room()
			child.final.connect(_on_room_final)
	if FileAccess.file_exists("res://Scenes/mini_games/Crossword_Puzzle/saved_puzzle.txt"):
		var dir = DirAccess.open("res://Scenes/mini_games/Crossword_Puzzle/")
		dir.remove("saved_puzzle.txt")
	$HUD.scenario_menu_title = scenario_title
	$HUD.scenario_menu_description = scenario_description
	$HUD.visible = false


func enter_room(new_room):
	for room in rooms:
		if room != new_room:
			room.resume_room()
			room.pause_room()
			room.visible = false
		else:
			room.resume_room()
			room.visible = true


func check_win() -> bool:
	if $HUD.items.size() == max_items:
		return true
	$popup_gui.show_message("You have unfinished objectives")
	return false


func room_unlock(room_number):
	if room_number == 2:
		$HUD/RoomMenu/Room2.visible = true
	elif room_number == 3:
		$HUD/RoomMenu/Room3.visible = true


func on_open_screen_close() -> void:
	current_room.resume_room()
	$HUD/Timer.start()
	$HUD.visible = false


func _on_room_final() -> void:
	$HUD/Timer.stop()
	$BackgroundPlayer.stop()
	var end_screen = load(end_screen_path)
	var end_screen_inst = end_screen.instantiate()
	end_screen_inst.username = username
	end_screen_inst.scen_num = scenario_num
	end_screen_inst.time_val = calculate_time($HUD/Timer/Label.text)
	send_data(1)
	play_sound(final_sound)
	add_child(end_screen_inst)


func send_data(completed):
	finished_time = calculate_time($HUD/Timer/Label.text)
	$DBoperations.make_post_request(scenario_num, finished_time, username, completed)


func get_data():
	$DBoperations.make_get_request()


func on_username_recieved(current_username):
	username = current_username


func play_sound(sound):
	$AudioStreamPlayer.stream = sound
	$AudioStreamPlayer.play()


func calculate_time(time):
	var minutes =  (time[0].to_int() * 10) + time[1].to_int()
	var seconds = (time[3].to_int() * 10) + time[4].to_int()
	var caluculatedMinutes = 29 - minutes
	var calculatedSeconds = 60 - seconds
	var stringSeconds = ""
	if calculatedSeconds < 10:
		stringSeconds = "0" + str(calculatedSeconds)
	else:
		stringSeconds = calculatedSeconds
	var caluclatedTimeString = str(caluculatedMinutes) + ":" + str(stringSeconds)
	return caluclatedTimeString


func on_game_over():
	var lose_screen = load(lose_screen_path)
	var lose_screen_inst = lose_screen.instantiate()
	lose_screen_inst.username = username
	lose_screen_inst.scen_num = scenario_num
	lose_screen_inst.time_val = "00:00"
	add_child(lose_screen_inst)
