extends TextureButton

@onready var clipBoard = get_tree().get_root().get_node("ShredderMiniGame/ClipBoard")


func _ready():
	pass # Replace with function body.


func _process(delta):
	pass




func _on_pressed():
	if clipBoard.checkWin():
		$Label.text = "You win!"
		await get_tree().create_timer(1).timeout
		get_tree().change_scene_to_file("res://Scenes/Room.tscn")
		
	
