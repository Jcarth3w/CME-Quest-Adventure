extends Node2D

@export var card_1: Sprite2D
@export var card_2: Sprite2D

var is_matched = false


func _process(_delta) -> void:
	if owner.check_pair_matching == true:
		check_pair()

func check_pair() -> void:
	if card_1.is_flipped == true && card_2.is_flipped == true:
		is_matched = true
	else:
		card_1.reset()
		card_2.reset()
