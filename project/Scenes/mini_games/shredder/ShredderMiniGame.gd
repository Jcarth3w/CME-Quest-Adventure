extends MiniGame

@onready var clipBoard = $ClipBoard


func _on_check_bttn_pressed():
	if clipBoard.checkWin():
		$CheckBttn/Label.text = "You win!"
		await get_tree().create_timer(1).timeout
		finished.emit()
		queue_free()
