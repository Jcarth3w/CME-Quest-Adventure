extends TextureRect

var original_texture
var correct_order = ["Item1","Item2", "Item3"]
var current_order = []

@onready var check_button = $"../CheckWinButton"


func _get_drag_data(at_position):
	var preview_texture = TextureRect.new()
	preview_texture.texture = texture
	preview_texture.expand_mode = 1
	preview_texture.size = Vector2(220, 220)
	var preview = Control.new()
	preview.add_child(preview_texture)
	texture = null
	set_drag_preview(preview)
	
	return preview_texture.texture


func _can_drop_data(at_position, data):
	return data is Texture2D


func _drop_data(at_position, data):
	if is_position_in_designated_area(at_position):
		texture = data
		current_order.append(name)
		print(current_order)
	else: 
		texture = original_texture


func is_position_in_designated_area(position):
	var designated_area = Rect2(Vector2 (0, 0), Vector2(320, 320))
	return designated_area.has_point(position)
