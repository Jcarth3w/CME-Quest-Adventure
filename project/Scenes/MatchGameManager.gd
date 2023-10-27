extends Node2D


var cards : Array
var flipped_count = 0
signal not_matching
var base_image = preload("res://Assets/Sprites/Objects/genericItem_color_037.png")
# Called when the node enters the scene tree for the first time.
func _ready():
	cards = get_tree().get_nodes_in_group("cards")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func check_win_condition():
	for card in cards:
		if not card.isMatched:
			return
		
		
		
	
