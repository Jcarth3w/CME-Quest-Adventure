extends TextureButton

@onready var parent = get_tree().get_root().get_node("FileMinigame")
@export var clickable_name : String

func _on_pressed():
	if parent.FunctionActive == false:
		$Label.text = clickable_name
	
