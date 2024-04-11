class_name Drag
extends TextureRect

signal data_dropped

var original_texture
var original_position


func _ready() -> void:
	original_position = position
	original_texture = texture


func _get_drag_data(_at_position):
	var preview = create_preview()
	data_dropped.emit(self, original_texture)
	set_drag_preview(preview)
	return original_texture

func create_preview():
	var preview_rect = TextureRect.new()
	preview_rect.texture = texture
	preview_rect.expand_mode = 1
	preview_rect.size = Vector2(220, 220)
	preview_rect.position = Vector2(-100, -100)
	var preview = Control.new()
	preview.add_child(preview_rect)
	return preview
