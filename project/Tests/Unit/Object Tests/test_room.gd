extends GutTest

var test_scenario_preload = preload("res://Tests/TestScenario.tscn")
var test_scenario: Node2D
var hud
var timer
var room
var room2
var room3
var texture


func before_all() -> void:
	test_scenario = test_scenario_preload.instantiate()
	get_tree().root.add_child(test_scenario)
	room = test_scenario.get_node("Room1")


func test_pause_room() -> void:
	var moveable = room.get_node("TestMoveable")
	var new_scene = room.get_node("TestNewScene")
	var pickup = room.get_node("TestPickup")
	var static_scene = room.get_node("StaticSceneButton")
	room.pause_room()

	assert_eq(moveable.disabled, true)
	assert_eq(new_scene.disabled, true)
	assert_eq(pickup.disabled, true)
	assert_eq(static_scene.disabled, true)
