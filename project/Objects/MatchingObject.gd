extends Sprite2D


@onready var parent = get_tree().get_root().get_node("Room/MiniGame")
var isFlipped = false

@export var cardImage : Texture
	
	
func _input(event):
	if parent.checkPairMatching == false:
		if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			if get_rect().has_point(to_local(event.position)):
				set_texture(cardImage)
				if isFlipped == false:
					parent.flipped_count += 1
				print(parent.flipped_count)
				_on_card_pressed()


func _on_card_pressed():
	if not isFlipped:
		isFlipped = true


func reset():
	isFlipped = false
	set_texture(preload("res://Assets/Unknown_paper.png"))

