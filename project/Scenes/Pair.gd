extends Node2D

@onready var parent = get_tree().get_root().get_node("Room/MiniGame")
@export var card1: Sprite2D
@export var card2: Sprite2D

var isFlipped = false
var isMatched = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if parent.checkPairMatching == true:
		checkPair()

func checkPair():
	if card1.isFlipped == true && card2.isFlipped == true:
		isMatched = true
	else:
		card1.reset()
		card2.reset()
