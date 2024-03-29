extends MiniGame

@onready var label = $CheckWinButton/Label2

var correct_order = {"Spot1" : "ItemC", "Spot2" : "ItemO", "Spot3" : "ItemM",
"Spot4" : "ItemP", "Spot5" : "ItemL", "Spot6" : "ItemI", 
"Spot7" : "ItemA", "Spot8" : "ItemN", "Spot9" : "ItemC2", "Spot10" : "ItemE"}
var player_order = {}


func _ready() -> void:
	for child in get_children():
		if child.name.contains("Spot"):
			child.get_node("Label").scale = Vector2(2, 2)
			child.gathered_data.connect(_on_spot_gathered_data)

func check_win_button_pressed():
	if compare_dict(correct_order, player_order):
		label.text = "You Win!"
		finished.emit()
		await get_tree().create_timer(1).timeout
		get_parent().final.emit()
		queue_free()
	else:
		label.text = "Try again..."
		reset()


func _on_check_win_button_pressed():
	check_win_button_pressed()


func _on_spot_gathered_data(items):
	player_order.merge(items)



func compare_dict(dict1, dict2):
	for key in dict1:
		if not dict2.has(key):
			return false
		var value = dict1[key]
		if value != dict2[key]:
			return false
	return true


func reset():
	for child in get_children():
		if child.name.contains("Item"):
			child.visible = true
			child.get_node("Label").visible = true
		if child.name.contains("Spot"):
			child.get_node("Label").visible = false
	player_order = {}

