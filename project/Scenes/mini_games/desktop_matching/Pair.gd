extends Node2D

@export var card_1: Sprite2D
@export var card_2: Sprite2D

var is_matched = false


func _process(_delta) -> void:
	if owner.checkPairMatching == true:
		check_pair()

func check_pair() -> void:
	if card1.isFlipped == true && card2.isFlipped == true:
		is_matched = true
	else:
		card_1.reset()
		card_2.reset()
