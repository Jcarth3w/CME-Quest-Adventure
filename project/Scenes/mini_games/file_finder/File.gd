extends TextureButton

@export var clickable_name : String


func _ready():
	if clickable_name == "File1":
		global_position = owner.get_node("Center").global_position
	else:
		global_position = owner.get_node("OffLeft").global_position
	
func _on_pressed():
	if global_position == owner.get_node("Center").global_position:
		owner.get_node("FileName").text = clickable_name
		owner.check_win(clickable_name)
	
