extends ColorRect

signal data_dropped

var original_position

func _ready() -> void:
	original_position = position


func _get_drag_data(at_position):
	var preview_texture = ColorRect.new()
	preview_texture.color = color
	var preview_label = Label.new()
	preview_label.text = $Label.text
	preview_label.add_theme_color_override("font_color", Color.BLACK)
	preview_texture.size = size
	preview_texture.size = Vector2(250, 100)
	preview_texture.position = Vector2(-100, -100)
	preview_label.position = Vector2(-90, -95)
	var preview = Control.new()
	preview.add_child(preview_texture)
	preview.add_child(preview_label)
	data_dropped.emit(name, self)
	set_drag_preview(preview)
	return preview_texture
	
