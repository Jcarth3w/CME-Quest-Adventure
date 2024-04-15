extends MiniGame

@onready var label = $Label

var correct_order = {"Spot1" : "Item2", "Spot2" : "Item1", "Spot3" : "Item3"}
var player_order = {}


func _ready() -> void:
	for child in get_children():
		if child.name.contains("Spot"):
			child.gathered_data.connect(_on_spot_gathered_data)

func check_win_button_pressed():
	if compare_dict(correct_order, player_order):
		$CheckWinButton.texture_normal = load("res://Assets/Sprites/Iteration 3 assets/Green button.png")
		$Label.text = "You win!"
		finished.emit()
		await get_tree().create_timer(1).timeout
		queue_free()
	else:
		$Label.text = "Try again..."
		$CheckWinButton.texture_normal = load("res://Assets/Sprites/Iteration 3 assets/Red button.png")
		reset()
		await get_tree().create_timer(1).timeout
		$CheckWinButton.texture_normal = load("res://Assets/Sprites/Iteration 3 assets/Blue button.png")


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
			child.get_node("Label").visible = true
			if child.name.contains("Spot"):
				child.get_node("Label").visible = false
	player_order = {}
