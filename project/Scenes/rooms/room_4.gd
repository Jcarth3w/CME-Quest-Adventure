extends Room

func on_clickable(clickable) -> void:
	if clickable.name == StringName("BulletinBoard"):
		if get_parent().check_win():
			clickable.action()
	else:
		clickable.action()
