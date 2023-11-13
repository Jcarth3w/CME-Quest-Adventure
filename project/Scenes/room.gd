extends Node2D

var menu = preload("res://Scenes/in_game_menu.tscn")
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
	
	if Input.is_action_just_pressed("menu"):
		var menu_inst = menu.instantiate()
		add_child(menu_inst)
		menu_inst.pause.connect(_on_menu_pause)
		menu_inst.resume.connect(_on_menu_resume)
	

func _on_menu_pause():
	$HUD/Timer.stop()
	state = "inactive"


func _on_menu_resume():
	$HUD/Timer.start()
	state = "active"
