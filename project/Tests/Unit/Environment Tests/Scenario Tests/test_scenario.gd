extends GutTest

var test_scenario_preload = preload("res://Scenes/scenarios/scenario_1.tscn")
var test_scenario: Node2D


func before_all() -> void:
	test_scenario = test_scenario_preload.instantiate()
	get_tree().root.add_child(test_scenario)



func test_enter_room1() -> void:
	test_scenario.enter_room(test_scenario.get_node("Room1"))
	assert_true(test_scenario.get_node("Room1").visible)
	assert_false(test_scenario.get_node("Room2").visible)
	assert_false(test_scenario.get_node("Room3").visible)


func test_enter_room2() -> void:
	test_scenario.enter_room(test_scenario.get_node("Room2"))
	assert_true(test_scenario.get_node("Room2").visible)
	assert_false(test_scenario.get_node("Room1").visible)
	assert_false(test_scenario.get_node("Room3").visible)


func test_enter_room3() -> void:
	test_scenario.enter_room(test_scenario.get_node("Room3"))
	assert_true(test_scenario.get_node("Room3").visible)
	assert_false(test_scenario.get_node("Room1").visible)
	assert_false(test_scenario.get_node("Room2").visible)


func test_check_win_success() -> void:
	for n in range(7):
		test_scenario.get_node("HUD").items.append(1)
	assert_true(test_scenario.check_win())


func test_check_win_fail() -> void:
	test_scenario.get_node("HUD").items = {}
	assert_false(test_scenario.check_win())


func test_unlock_room2() -> void:
	test_scenario.room_unlock(2)
	assert_true(test_scenario.get_node("HUD/RoomMenu/Room2").visible)


func test_unlock_room3() -> void:
	test_scenario.room_unlock(3)
	assert_true(test_scenario.get_node("HUD/RoomMenu/Room3").visible)


func test_on_open_screen_closed() -> void:
	test_scenario.on_open_screen_close()
	assert_false(test_scenario.get_node("HUD/Timer").is_stopped())


func test_on_room_final() -> void:
	test_scenario._on_room_final()
	assert_true(test_scenario.get_node("HUD/Timer").is_stopped())
	assert_true(test_scenario.get_node("EndScreen") is CanvasLayer)
	assert_eq(test_scenario.get_node("EndScreen/User").text, test_scenario.username)
	assert_eq(test_scenario.get_node("EndScreen/ScenNum").text, str(test_scenario.scenario_num))
	assert_eq(test_scenario.get_node("EndScreen/TimeVal").text, test_scenario.get_node("HUD/Timer/Label").text)


func test_on_username_recieved() -> void:
	test_scenario.on_username_recieved("Jack")
	assert_eq(test_scenario.username, "Jack")
