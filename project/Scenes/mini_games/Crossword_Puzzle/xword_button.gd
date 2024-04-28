extends NewSceneClickable

@onready var xword = get_parent().get_node("Crossword")

func action():
	if finished == false:
		xword.visible = true
		get_parent().pause_room()
