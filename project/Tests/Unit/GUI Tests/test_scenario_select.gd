extends GutTest

var test_scenario_select_preload = preload("res://Scenes/main_menus/Scenario_Select.tscn")
var test_scenario 
var test_scenario_select: Node2D


func before_all() -> void:
	test_scenario_select = test_scenario_select_preload.instantiate()
	get_tree().root.add_child(test_scenario_select)


func test_scene_change_one() -> void:
	test_scenario_select.current_scene = 1
	test_scenario_select.scene_change()
	assert_eq(test_scenario_select.get_node("Scenario1").visible, true)


func test_scene_change_two() -> void:
	test_scenario_select.current_scene = 2
	test_scenario_select.scene_change()
	assert_eq(test_scenario_select.get_node("Scenario2").visible, true)


func test_scene_change_three() -> void:
	test_scenario_select.current_scene = 3
	test_scenario_select.scene_change()
	assert_eq(test_scenario_select.get_node("Scenario3").visible, true)
