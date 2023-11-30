extends Room


func check_win() -> void:
	if $Inventory.items.size() == 6:
		$HUD/WhiteRect/Label.text = "You win!"
		$HUD/Timer.stop()


func _on_white_board_pressed():
	pause_game()


func _on_white_board_resume():
	resume_game()
