extends Drop

func action():
	get_parent().get_node("BloomsGame").visible = true
	visible = false
