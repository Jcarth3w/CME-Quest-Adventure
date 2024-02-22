extends GutTest

var test_scenario_preload = preload("res://Tests/TestScenario.tscn")
var test_scenario: Node2D
var test_popup_preload = preload("res://Scenes/gui/popup/pop_up_message.tscn")
var test_popup: ColorRect


func before_all() -> void:
	test_scenario = test_scenario_preload.instantiate()
	test_popup = test_popup_preload.instantiate()
	get_tree().root.add_child(test_scenario)


func test_on_timer_time_out() -> void:
	test_scenario.add_child(test_popup)
	test_popup._on_timer_timeout()
	await yield_for(2)
	assert_eq(test_scenario.has_node("PopUp"), false)
