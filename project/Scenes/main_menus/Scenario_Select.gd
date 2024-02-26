extends Node2D

var scenario_one = "res://Scenes/scenarios/scenario_1.tscn"
var scenario_two = "res://Scenes/scenarios/scenario_2.tscn"
var current_scene = 1


func _on_room_one_button_pressed():
	get_tree().change_scene_to_file(scenario_one)

func _on_room_two_button_pressed():
	get_tree().change_scene_to_file(scenario_two)

func scene_change():
	if current_scene == 1:
		$Scenario1.visible = true
		$Scenario


func _on_left_button_pressed():
	if  current_scene == 2:
		current_scene = 1
		$Scenario1.visible = true
		$Scenario2.visible = false


func _on_right_button_pressed():
	if  current_scene == 1:
		current_scene = 2
		$Scenario1.visible = false
		$Scenario2.visible = true



