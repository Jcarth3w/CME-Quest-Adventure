extends TextureRect

signal data_dropped

var original_position
var original_texture

func _ready() -> void:
	original_position = position
	original_texture = texture


func _get_drag_data(at_position):
	var preview_texture = TextureRect.new()
	var preview_label = Label.new()
	preview_texture.texture = texture
	preview_label.text = $Label.text
	preview_texture.expand_mode = 1
	preview_label.add_theme_color_override("font_color", Color.BLACK)
	preview_texture.size = Vector2(220, 220)
	preview_texture.position = Vector2(-100, -100)
	preview_label.position = Vector2(-30, -10)
	var preview = Control.new()
	preview.add_child(preview_texture)
	preview.add_child(preview_label)
	data_dropped.emit(texture, name, self)
	set_drag_preview(preview)
	return preview_texture.texture

