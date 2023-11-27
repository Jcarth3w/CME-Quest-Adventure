extends Node2D

@export var card_1: Sprite2D
@export var card_2: Sprite2D

var is_matched = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if owner.check_pair_matching == true:
		check_pair()


func check_pair():
	if card_1.isFlipped == true && card_2.isFlipped == true:
		is_matched = true
	else:
		card_1.reset()
		card_2.reset()
