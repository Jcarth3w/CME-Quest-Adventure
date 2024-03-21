extends GutTest

var test_mainmenu_preload = preload("res://Scenes/main_menus/main_menu.tscn")
var test_scenario_select_preload = preload("res://Scenes/main_menus/Scenario_Select.tscn")
var test_leader_board_preload = preload("res://Scenes/main_menus/Leader_Board.tscn")
var test_main_menu: CanvasLayer


func before_all() -> void:
	test_main_menu = test_mainmenu_preload.instantiate()
	get_tree().root.add_child(test_main_menu)


#func test_on_start_button_pressed() -> void:
#	test_main_menu._on_start_button_pressed()
#	var test_scenario_select = test_scenario_select_preload.instantiate()
#	assert_eq(test_scenario_select is Node2D, true)
#	assert_eq(test_scenario_select.has_node("Background"), true)
#	assert_eq(test_scenario_select.has_node("Scenario1"), true)
#	assert_eq(test_scenario_select.has_node("Scenario2"), true)
#	assert_eq(test_scenario_select.has_node("Scenario3"), true)
#	assert_eq(test_scenario_select.has_node("LeftButton"), true)
#	assert_eq(test_scenario_select.has_node("RightButton"), true)
	


#func test_on_leader_board_button_pressed() -> void:
#	test_main_menu._on_leader_board_button_pressed()
#	var test_leader_board = test_leader_board_preload.instantiate()
#	assert_eq(test_leader_board is Node2D, true)


#func test_on_quit_pressed() -> void:
#	test_main_menu._on_quit_button_pressed()
#	assert_eq(test_main_menu is CanvasLayer, true)
