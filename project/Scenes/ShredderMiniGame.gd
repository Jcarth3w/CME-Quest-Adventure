extends MiniGame

@onready var clipBoard = get_tree().get_root().get_node("Room/ShredderMiniGame/ClipBoard")
@onready var room = get_tree().get_root().get_node("Room")


func _on_check_bttn_pressed():
	if clipBoard.checkWin():
		$CheckBttn/Label.text = "You win!"
		await get_tree().create_timer(1).timeout
		room.state = "active"
		finished.emit()
		queue_free()
