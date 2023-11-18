extends TextureButton


@onready var clipBoard = get_tree().get_root().get_node("Room/ShredderMiniGame/ClipBoard")
@onready var room = get_tree().get_root().get_node("Room")


func _on_pressed():
	if clipBoard.checkWin():
		$Label.text = "You win!"
		await get_tree().create_timer(1).timeout
		room.state = "active"
		owner.queue_free()
		
	
