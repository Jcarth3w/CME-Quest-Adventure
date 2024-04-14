extends Node2D

func CreditsButton():
	get_parent().get_node("Main").visible = true
	get_parent().get_node("Credits_Board").visible = false
