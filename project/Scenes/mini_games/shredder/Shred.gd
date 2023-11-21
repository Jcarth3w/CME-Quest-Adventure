extends TextureButton

var start_position
var start_rotation
var start_scale

@onready var clip_board = $"../ClipBoard"


func _ready() -> void:
	start_position = global_position
	start_rotation = rotation_degrees
	start_scale = scale


func check_clip_board() -> bool:
	if clip_board.shreds.size() < 3:
		return true
	return false


func _on_pressed() -> void:
	if clip_board.shreds.find(self) == -1:
		clip_board.addShred(self)


func reset_shred() -> void:
	global_position = start_position
	rotation_degrees = start_rotation
	scale = start_scale
