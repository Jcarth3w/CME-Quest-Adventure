extends CanvasLayer

signal in_game_menu_press

func _ready():
	connect_buttons()


func connect_buttons():
	for child in get_children():
		if child is Button:
			child.pressed.connect(on_button_press.bind(child))


func on_button_press(button):
	in_game_menu_press.emit(button.text)
