extends TextureButton

@onready var parent = get_tree().get_root().get_node("FileMinigame")
@export var clickable_name : String


func _ready():
	if clickable_name == "File1":
		global_position = parent.get_node("Center").global_position
	else:
		global_position = parent.get_node("OffLeft").global_position
	
	
func _on_pressed():
	if global_position == parent.get_node("Center").global_position:
		parent.get_node("FileName").text = clickable_name
		parent.check_win(clickable_name)
	
