extends NewSceneClickable

@onready var crossword = $Crossword_Minigame


func action():
	if finished == false:
		if crossword.visible == false:
			crossword.visible = true
		else:
			crossword.visible = false


func _on_crossword_minigame_finished():
	_on_finished()
