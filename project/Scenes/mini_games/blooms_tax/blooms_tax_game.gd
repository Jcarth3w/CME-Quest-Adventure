extends MiniGame


@onready var label = $Label2

var correct_order = {}
var player_order = {}


func _ready():
	for child in get_children():
		if child is Drop:
			child.gathered_data.connect(_on_spot_gathered_data.bind(child))
	correct_order = {"CreateDropSpot" : "CreateDrag", "EvaluateDropSpot" : "EvaluateDrag", 
	"AnalyzeDropSpot" : "AnalyzeDrag", "ApplyDropSpot" : "ApplyDrag", 
	"UnderstandDropSpot" : "UnderstandDrag", "RememberDropSpot" : "RememberDrag"}


func compare_dict(dict1, dict2):
	for key in dict1:
		if not dict2.has(key):
			print("NO KEY")
			return false
		var value = dict1[key]
		if value != dict2[key]:
			print("NO VALUE")
			return false
	return true


func _on_spot_gathered_data(drop):
	player_order.merge(drop.action())


func check_win_button_pressed():
	if compare_dict(correct_order, player_order):
		$CheckWinButton.texture_normal = load("res://Assets/Sprites/Iteration 3 assets/Green button.png")
		$Label2.text = "You win!"
		finished.emit()
		await get_tree().create_timer(1).timeout
		queue_free()
	else:
		$CheckWinButton.texture_normal = load("res://Assets/Sprites/Iteration 3 assets/Red button.png")
		$Label2.text = "Try again..."
		reset()
		await get_tree().create_timer(1).timeout
		$CheckWinButton.texture_normal = load("res://Assets/Sprites/Iteration 3 assets/Blue button.png")
		


func reset():
	for child in get_children():
		if child is TextureRect:
			child.texture = child.original_texture
	player_order = {}


func _on_check_win_button_pressed():
	check_win_button_pressed()
