extends Node2D

var cards : Array
var flipped_count = 0
signal not_matching
var checkPairMatching = false
var base_image = preload("res://Assets/Sprites/Objects/genericItem_color_037.png")
# Called when the node enters the scene tree for the first time.
func _ready():
	cards = get_tree().get_nodes_in_group("cards")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	check_win_condition()


func check_win_condition():
	if flipped_count == 2:
		await get_tree().create_timer(1.0).timeout
		flipped_count = 0
		
		
		
	
