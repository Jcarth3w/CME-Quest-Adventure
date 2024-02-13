extends GutTest

var test_scenario_preload = preload("res://Tests/TestScenario.tscn")
var test_scenario: Node2D
var hud


func before_all() -> void:
	test_scenario = test_scenario_preload.instantiate()
	get_tree().root.add_child(test_scenario)
	hud = test_scenario.get_node("HUD")


func test_on_scenario_pressed() -> void:
	hud.on_scenario_pressed()
	assert_eq(hud.has_node("Scenario_menu"), true)
