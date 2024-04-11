class_name Drop
extends TextureRect

signal gathered_data(values)

@export var drag_partner : TextureRect

var original_texture
var current_name
var current_texture
var current_item


func _ready() -> void:
	drag_partner.data_dropped.connect(_on_drag_partner_dropped)
	original_texture = texture 
	
	
func _drop_data(at_position, _data):
	if is_position_in_designated_area(at_position):
		$AudioStreamPlayer.play()
		texture = current_texture
		gathered_data.emit()
		current_item.texture = null
	else: 
		texture = original_texture


func _can_drop_data(_at_position, data):
	return data is Texture2D


func is_position_in_designated_area(rect_position):
	var designated_area = Rect2(Vector2 (0, 0), Vector2(320, 320))
	return designated_area.has_point(rect_position)


func _on_drag_partner_dropped(item, image):
	current_item = item
	current_texture = image


func action():
	pass
