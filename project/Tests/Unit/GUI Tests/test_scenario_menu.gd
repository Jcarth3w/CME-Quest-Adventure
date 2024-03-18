extends GutTest

var test_scenario_preload = preload("res://Tests/TestScenario.tscn")
var test_scenario: Node2D
var hud
var test_scenario_menu: CanvasLayer


func before_all() -> void:
	test_scenario = test_scenario_preload.instantiate()
	get_tree().root.add_child(test_scenario)
	hud = test_scenario.get_node("HUD")
	hud.in_game_menu_press("Scenario")
	test_scenario_menu = hud.get_node("Scenario_menu")


func test_on_continue_pressed() -> void:
	test_scenario_menu._on_continue_button_pressed()
	await yield_for(1)
	assert_eq(test_scenario.has_node("Scenario_menu"), false)
