extends MiniGame

@onready var win_label = $CheckWinButton/Label
@export var correct_order = {}

var player_order = {}


func _ready() -> void:
	for child in get_children():
		if child.name.contains("Spot"):
			child.gathered_data.connect(_on_spot_gathered_data)

func check_win_button_pressed():
	if compare_dict(correct_order, player_order):
		win_label.text = "You win!"
		finished.emit()
		await get_tree().create_timer(1).timeout
		queue_free()
	else:
		win_label.text = "Try again..."
		reset()


func compare_dict(dict1, dict2):
	for key in dict1:
		if not dict2.has(key):
			return false
		var value = dict1[key]
		if value != dict2[key]:
			return false
	return true


func _on_check_win_button_pressed():
	check_win_button_pressed()


func _on_spot_gathered_data(items):
	player_order.merge(items)


func reset():
	for child in get_children():
		if child is TextureRect:
			child.texture = child.original_texture
	player_order = {}
