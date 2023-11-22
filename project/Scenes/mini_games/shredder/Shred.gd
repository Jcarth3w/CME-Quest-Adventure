extends TextureButton

@onready var clipBoard = $"../ClipBoard"
var start_position
var start_rotation
var start_scale

func _ready():
	start_position = global_position 
	start_rotation = rotation_degrees
	start_scale = scale


func reset_shred():
	global_position = start_position
	rotation_degrees = start_rotation
	scale = start_scale
	
	
	
	

