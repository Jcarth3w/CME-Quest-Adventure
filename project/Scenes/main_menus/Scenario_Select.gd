extends Node2D

var scenario_one = "res://Scenes/scenarios/scenario_1.tscn"

func _on_room_one_button_pressed():
	get_tree().change_scene_to_file(scenario_one)
