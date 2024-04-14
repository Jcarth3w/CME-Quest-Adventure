extends Drag

func create_preview():
	var preview_rect = TextureRect.new()
	preview_rect.texture = texture
	preview_rect.expand_mode = 1
	preview_rect.size = Vector2(80, 80)
	preview_rect.modulate = Color(0.09, 1, 1)
	preview_rect.position = Vector2(-100, -100)
	var preview = Control.new()
	preview.add_child(preview_rect)
	return preview
