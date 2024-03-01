extends MiniGame

@onready var label = $CheckWinButton/Label2

var correct_order = {"Spot1" : "Item2", "Spot2" : "Item1", "Spot3" : "Item3"}
var player_order = {}


func _ready() -> void:
	for child in get_children():
		if child.name.contains("Spot"):
			child.gathered_data.connect(_on_spot_gathered_data)

func check_win_button_pressed():
	if player_order.hash() == correct_order.hash():
		label.text = "You win!"
		await get_tree().create_timer(1).timeout
		finished.emit()
		queue_free()
	else:
		label.text = "Try again..."
		reset()


func _on_check_win_button_pressed():
	check_win_button_pressed()


func _on_spot_gathered_data(items):
	player_order.merge(items)


func reset():
	for child in get_children():
		if child is TextureRect:
			child.texture = child.original_texture
			child.get_node("Label").visible = true
			if child.name.contains("Spot"):
				child.get_node("Label").visible = false
	player_order = {}
