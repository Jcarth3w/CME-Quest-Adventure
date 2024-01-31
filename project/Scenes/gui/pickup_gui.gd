extends Node2D

@onready var labelText = $BlackBorder/PickupText

func show_pickup(title):
	labelText.text = title
