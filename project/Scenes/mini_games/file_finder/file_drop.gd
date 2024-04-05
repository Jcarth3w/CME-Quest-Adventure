extends Drop


func _ready() -> void:
	for child in get_parent().get_parent().get_node("Items").get_children():
		child.data_dropped.connect(_on_drag_drop)
	original_texture = texture 
	
	
func action():
	scale = Vector2(.25, .25)
	return {String(name) : current_item}
