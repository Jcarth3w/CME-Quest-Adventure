extends MiniGame

@onready var clip_board = $ClipBoard


func _on_check_bttn_pressed() -> void:
	if clip_board.checkWin():
		$CheckBttn/Label.text = "You win!"
		await get_tree().create_timer(1).timeout
		finished.emit()
		queue_free()
