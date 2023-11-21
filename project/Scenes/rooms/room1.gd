extends Room


func check_win() -> void:
	if $Inventory.items.size() == 6:
		$HUD/WhiteRect/Label.text = "You win!"
		$HUD/Timer.stop()
