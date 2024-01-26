extends Node2D

var answer = "6969"

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
	else:
		$Display.text += button.text

func check_answer(player_answer) -> void:
	if player_answer == answer:
		print("you did it, you're so smarrrrttt")
	else:
		print("you suck, get good")
