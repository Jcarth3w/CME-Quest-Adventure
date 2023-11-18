extends Sprite2D


var isFlipped = false

@export var cardImage : Texture
@export var hideImage : Texture
	
	
func _input(event):
	if owner.checkPairMatching == false:
		if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			if get_rect().has_point(to_local(event.position)):
				set_texture(cardImage)
				if isFlipped == false:
					owner.flipped_count += 1
					isFlipped = true


func reset():
	isFlipped = false
	set_texture(hideImage)

