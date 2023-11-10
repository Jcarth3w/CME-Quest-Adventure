extends TextureButton

@export var scene_path: String
@export var mini_game_prize: Pickup

@onready var room = get_tree().get_root().get_node("Room")
var finished = false

func _ready():
	if mini_game_prize != null: 
		mini_game_prize.clickable_name = "p1"
		mini_game_prize.clickable_sprite = load("res://Assets/Sprites/Objects/genericItem_color_032.png")

func _on_pressed():
	if room.state == "active" and finished == false:
		var scene = load(scene_path)
		var scene_inst = scene.instantiate()
		room.add_child(scene_inst)
		scene_inst.finished.connect(_on_finished)
		room.state = "inactive"
		
func _on_finished():
	finished = true
	if mini_game_prize != null: 
		mini_game_prize.inventory.add_item(mini_game_prize.clickable_name, mini_game_prize.clickable_sprite)
