extends Node2D

@export var card1: Sprite2D
@export var card2: Sprite2D

var is_matched = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta) -> void:
	if owner.checkPairMatching == true:
		check_pair()

func check_pair() -> void:
	if card1.isFlipped == true && card2.isFlipped == true:
		is_matched = true
	else:
		card1.reset()
		card2.reset()
