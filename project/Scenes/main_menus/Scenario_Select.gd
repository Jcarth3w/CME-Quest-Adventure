extends Node2D

var scenario_one = "res://Scenes/scenarios/scenario_1.tscn"
var scenario_two = "res://Scenes/scenarios/scenario_2.tscn"
var scenario_three = "res://Scenes/main_menus/main_menu.tscn"
var current_scene = 1
 

func _on_room_one_button_pressed():
	get_tree().change_scene_to_file(scenario_one)

func _on_room_two_button_pressed():
	get_tree().change_scene_to_file(scenario_two)

func _on_room_three_button_pressed():
	get_tree().change_scene_to_file(scenario_three)


func scene_change():
	$Scenario1.visible = false
	$Scenario2.visible = false
	$Scenario3.visible = false
	match current_scene:
		1:
			$Scenario1.visible = true
		2:
			$Scenario2.visible = true
		3:
			$Scenario3.visible = true


func _on_left_button_pressed():
	if  current_scene >= 2:
		current_scene -= 1
		scene_change()
	else:
		current_scene = 3
		scene_change()

func _on_right_button_pressed():
	if  current_scene <= 2:
		current_scene += 1
		scene_change()
	else:
		current_scene = 1
		scene_change()

