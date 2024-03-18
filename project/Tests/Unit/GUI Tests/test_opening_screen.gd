extends GutTest

var test_scenario_preload = preload("res://Tests/TestScenario.tscn")
var test_scenario: Node2D
var opening_screen


func before_all() -> void:
	test_scenario = test_scenario_preload.instantiate()
	get_tree().root.add_child(test_scenario)
	opening_screen = test_scenario.get_node("Opening_Screen")


func test_name_field_change_empty() -> void:
	opening_screen._on_name_field_text_changed("")
	assert_eq(opening_screen.get_node("ContinueButton").disabled, true)
	assert_eq(opening_screen.get_node("ContinueButton").text, "Please Insert Username")


func test_name_field_change_not_empty() -> void:
	opening_screen.get_node("NameField").text = "Jack"
	opening_screen._on_name_field_text_changed("Jack")
	assert_eq(opening_screen.get_node("ContinueButton").disabled, false)
	assert_eq(opening_screen.get_node("ContinueButton").text, "Begin")
