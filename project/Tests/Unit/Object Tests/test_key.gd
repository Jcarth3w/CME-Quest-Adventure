extends GutTest

var test_scenario_preload = preload("res://Tests/TestScenario.tscn")
var test_scenario: Node2D
var test_key: TextureButton
var room

func before_all() -> void:
	test_scenario = test_scenario_preload.instantiate()
	get_tree().root.add_child(test_scenario)
	room = test_scenario.get_node("Room1")
	test_key = room.get_node("Key")


func test_on_action() -> void:
	test_key.action()
	await yield_for(1)
	assert_eq(room.has_node("Key"), false)
