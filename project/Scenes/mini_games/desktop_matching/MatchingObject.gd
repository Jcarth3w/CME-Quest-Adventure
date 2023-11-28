extends Sprite2D

@export var card_image : Texture
@export var hide_image : Texture


var is_flipped = false


func _input(event):
	if owner.check_pair_matching == false:
		if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			if get_rect().has_point(to_local(event.position)):
				flip()


func flip():
	set_texture(card_image)
	if is_flipped == false:
		owner.flipped_count += 1
		is_flipped = true


func reset():
	is_flipped = false
	set_texture(hide_image)
