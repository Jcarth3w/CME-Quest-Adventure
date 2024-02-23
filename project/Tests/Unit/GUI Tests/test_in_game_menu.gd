extends GutTest

var test_scenario_preload = preload("res://Tests/TestScenario.tscn")
var test_scenario: Node2D
var hud
var test_in_game_menu: CanvasLayer


func before_all() -> void:
	test_scenario = test_scenario_preload.instantiate()
	get_tree().root.add_child(test_scenario)
	hud = test_scenario.get_node("HUD")
	test_in_game_menu = hud.get_node("InGameMenu")


#func test_connect_buttons() -> void:
#	test_in_game_menu.connect_buttons()
#	assert_eq(is_connected("pressed", Callable(test_in_game_menu.get_node("resume"), "on_button_press")), true)
#	assert_eq(is_connected("pressed", Callable(test_in_game_menu.get_node("quit"), "on_button_press")), true)
#	assert_eq(is_connected("pressed", Callable(test_in_game_menu.get_node("scenario"), "on_button_press")), true)
