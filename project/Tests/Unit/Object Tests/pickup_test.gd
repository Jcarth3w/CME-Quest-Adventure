extends GutTest

var test_scenario_preload = preload("res://Tests/TestScenario.tscn")
var test_scenario: Node2D
var test_room: Node2D
var pickup


func before_all() -> void:
	test_scenario = test_scenario_preload.instantiate()
	get_tree().root.add_child(test_scenario)
	test_room = test_scenario.get_node("Room1")
	pickup = test_room.get_node("TestPickup")


func test_pickup():
	pickup.action()
	await yield_frames(1) #test is too fast
	assert_eq(test_room.has_node("TestPickup"), false)
