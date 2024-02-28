extends TextureRect

signal data_dropped

var original_position
var original_texture

func _ready() -> void:
	original_position = position
	original_texture = texture


func _get_drag_data(at_position):
	var preview_texture = TextureRect.new()
	preview_texture.texture = texture
	preview_texture.expand_mode = 1
	preview_texture.size = Vector2(220, 220)
	var preview = Control.new()
	preview.add_child(preview_texture)
	data_dropped.emit(texture, name, self)
	set_drag_preview(preview)
	return preview_texture.texture

