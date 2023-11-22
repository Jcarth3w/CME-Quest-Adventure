extends CanvasLayer

var menu_spawned = false
var scenario_menu = preload("res://Scenes/gui/scenario_menu.tscn")

signal pause
signal resume

func _ready():
	pause.emit()

func _on_button_pressed():
	get_tree().quit()


func _on_resume_pressed():
	resume.emit()
	queue_free()

func _on_scenario_pressed():
	var scenario_menu_inst = scenario_menu.instantiate()
	add_child(scenario_menu_inst)
	
	
