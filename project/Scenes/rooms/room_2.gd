extends Room

func check_win():
	if owner.has_node("HUD"):
		if owner.get_node("HUD").items.size() == 2:
			return true
