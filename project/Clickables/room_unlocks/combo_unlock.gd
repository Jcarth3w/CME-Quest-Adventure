extends Node2D

signal finished
var answer = "123"
var room_number = 3

# Called when the node enters the scene tree for the first time.
func _ready() ->void:
	for child in get_children():
		if child is Button:
			child.pressed.connect(_on_button_press.bind(child))


func _on_button_press(button) -> void:
	if button.text == "ENTER":
		check_answer($Display.text)
	elif button.text == "CLEAR":
		$Display.text = ""
	elif button.text == "X":
		finished.emit()
		queue_free()
	else:
		$Display.text += button.text
	

func check_answer(player_answer) -> void:
	if player_answer == answer:
		$Display.text = "unlocked"
		get_parent().unlock(room_number)
		finished.emit()
		await get_tree().create_timer(0.5).timeout
		queue_free()
	else:
		$Display.text = "incorrect"

