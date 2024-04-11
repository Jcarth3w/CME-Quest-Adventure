extends Drop


func _ready() -> void:
	for child in get_parent().get_parent().get_node("Items").get_children():
		child.data_dropped.connect(_on_drag_drop)
	original_texture = texture 


func _drop_data(_at_position, _data):
	texture = current_texture
	gathered_data.emit()


func action():
	return {String(name) : current_item}

