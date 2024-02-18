extends CanvasLayer

signal room_select

func _ready():
	connect_buttons()

func connect_buttons():
	for child in get_children():
		if child is TextureButton:
			child.pressed.connect(on_button_press.bind(child))

func on_button_press(button):
	room_select.emit(button.name)
