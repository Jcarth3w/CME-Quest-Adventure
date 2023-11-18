extends Node2D

@export var card1: Sprite2D
@export var card2: Sprite2D

var isMatched = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if owner.checkPairMatching == true:
		checkPair()

func checkPair():
	if card1.isFlipped == true && card2.isFlipped == true:
		isMatched = true
	else:
		card1.reset()
		card2.reset()
