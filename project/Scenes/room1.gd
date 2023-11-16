extends Room

func check_win():
	if $Inventory.items.size() == 6:
		$HUD/ColorRect/Label.text = "You win!"
		$HUD/Timer.stop()
