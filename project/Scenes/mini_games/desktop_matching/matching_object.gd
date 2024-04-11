extends TextureButton

@export var card_image : Texture
@export var hide_image : Texture


var is_flipped = false


func action():
	flip()


func flip():
	texture_normal = card_image
	get_child(0).visible = true
	if is_flipped == false:
		is_flipped = true


func reset():
	is_flipped = false
	get_child(0).visible = false
	texture_normal = hide_image
