extends Node2D

@onready var parent = get_tree().get_root().get_node("MiniGame")
@export var card1: Sprite2D
@export var card2: Sprite2D

var isFlipped = false
var isMatched = false
var cardImage : Texture
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if parent.flipped_count == 2:
		checkPair()

func checkPair():
	if card1.isFlipped == true && card2.isFlipped == true:
		isMatched = true
		print(str(isMatched))
	else:
		card1.reset()
		card2.reset()
