extends GutTest

var test_scenario_preload = preload("res://Tests/TestScenario.tscn")
var test_scenario: Node2D
var test_combo: TextureButton
var room

func before_all() -> void:
	test_scenario = test_scenario_preload.instantiate()
	get_tree().root.add_child(test_scenario)
	room = test_scenario.get_node("Room2")
	test_combo = room.get_node("Room3Unlock")


func test_on_finished() -> void:
	test_combo.on_finished()
	assert_eq(test_combo.disabled, true)

