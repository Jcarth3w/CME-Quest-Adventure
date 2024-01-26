extends Room


func check_win():
	if get_parent().has_node("HUD"):
		if get_parent().get_node("HUD").items.size() == 6:
			return true
