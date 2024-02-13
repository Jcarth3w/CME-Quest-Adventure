extends GutTest

var test_scenario_preload = preload("res://Tests/TestScenario.tscn")
var test_scenario: Node2D
var room
var key

func before_all() -> void:
	test_scenario = test_scenario_preload.instantiate()
	get_tree().root.add_child(test_scenario)
	room = test_scenario.get_node("Room1")
	key = room.get_node("Key")


func test_key_action() -> void:
	key.action()
	var room_menu = test_scenario.get_node("HUD").get_node("RoomMenu")
	await yield_for(.5)
	assert_eq(room.has_node("Key"), false)
	assert_eq(room_menu.has_node("Room2"), true)



