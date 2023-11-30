extends Node2D

signal pause
signal resume

var scenario_menu = preload("res://Scenes/gui/scenario_menu.tscn")

func _ready():
	$InGameMenu.get_node("quit").pressed.connect(_on_quit_pressed)
	$InGameMenu.get_node("resume").pressed.connect(_on_resume_pressed)
	$InGameMenu.get_node("scenario").pressed.connect(_on_scenario_pressed)

func _on_menu_button_pressed():
		pause.emit()
		$InGameMenu.visible = true
		$Timer.stop()


func _on_quit_pressed():
	if FileAccess.file_exists("res://Scenes/mini_games/Crossword_Puzzle/saved_puzzle.txt"):
		var dir = DirAccess.open("res://Scenes/mini_games/Crossword_Puzzle/")
		dir.remove("saved_puzzle.txt")
		print("file found")
	get_tree().quit()


func _on_resume_pressed():
	resume.emit()
	$InGameMenu.visible = false


func _on_scenario_pressed():
	var scenario_menu_inst = scenario_menu.instantiate()
	add_child(scenario_menu_inst)
