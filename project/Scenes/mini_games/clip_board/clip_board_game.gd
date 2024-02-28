extends Node2D

@onready var label = $CheckWinButton/Label

var correct_order = {"Spot1" : "Item1", "Spot2" : "Item2", "Spot3" : "Item3"}
var player_order = {}


func _ready() -> void:
	for child in get_children():
		if child.name.contains("Spot"):
			child.gathered_data.connect(_on_spot_gathered_data)

func check_win_button_pressed():
	if player_order.hash() == correct_order.hash():
		label.text = "You win!"
		print(player_order)
	else:
		label.text = "Try again..."
		reset()
		print(player_order)


func _on_check_win_button_pressed():
	check_win_button_pressed()


func _on_spot_gathered_data(items):
	player_order.merge(items)


func reset():
	for child in get_children():
		if child is TextureRect:
			child.texture = child.original_texture
	player_order = {}
