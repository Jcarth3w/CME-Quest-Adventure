extends Node2D

var state := ""
# Called when the node enters the scene tree for the first time.
func _ready():
	state = "active"

func _check_win():
	if $Inventory.items.size() == 6:
		$HUD/ColorRect/Label.text = "You win!"
		$HUD/Timer.stop()
		
func _process(_delta):
	_check_win()
