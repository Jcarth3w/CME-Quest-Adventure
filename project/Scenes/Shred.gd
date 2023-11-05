extends TextureButton

@onready var clipBoard = get_tree().get_root().get_node("ShredderMiniGame/ClipBoard")
var startPosition
var startRotation
var startScale

func _ready():
	startPosition = global_position 
	startRotation = rotation_degrees
	startScale = scale


func _process(delta):
	pass


func checkClipBoard():
	if clipBoard.shreds.size() < 3:
		return true
	else:
		return false
		
	
func _on_pressed():
	if clipBoard.shreds.find(self) == -1:
		clipBoard.addShred(self)
		
func resetShred():
	global_position = startPosition
	rotation_degrees = startRotation
	scale = startScale
	
	
	
	

