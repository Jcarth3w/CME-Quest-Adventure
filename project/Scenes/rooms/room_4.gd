extends Room

func on_clickable(clickable) -> void:
	if clickable.name == "BulletinBoard":
		if get_parent().check_win():
			clickable.action()
		else:
			get_parent().get_node("popup_gui").show_message("You need to collect all promo materials")
	else:
		clickable.action()
