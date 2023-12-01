extends Node2D

var current_room = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	$Room2.pause_game()
	$Room2.visible = false

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
