extends Node2D

signal finished
var answer = "968211"
var room_number = 3

# Called when the node enters the scene tree for the first time.
func _ready() ->void:
	for child in get_children():
		if child is Button:
			child.pressed.connect(on_button_press.bind(child))

func close():
	get_parent().get_node("Finale").on_mouse_exited()
	queue_free()


func on_button_press(button) -> void:
	match button.text:
		"ENTER":
			check_answer($Display.text)
		"CLEAR":
			$Display.text = ""
		"X":
			get_parent().resume_room()
		_:
			if $Display.text == "incorrect":
				$Display.text = button.text
			else:
				$Display.text += button.text


func check_answer(player_answer) -> void:
	if player_answer == answer:
		$AudioStreamPlayer.play()
		$Display.text = "You've escaped! Congrats."
		finished.emit()
		get_parent().final.emit()
		await get_tree().create_timer(0.5).timeout
		queue_free()
	else:
		$Display.text = "incorrect"
