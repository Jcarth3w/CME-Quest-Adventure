extends GutTest

var test_scenario_preload = preload("res://Tests/TestScenario.tscn")
var test_scenario: Node2D
var test_combo_preload = preload("res://Clickables/room_unlocks/combo_unlock.tscn")
var test_combo: Node2D
var room


func before_all() -> void:
	test_scenario = test_scenario_preload.instantiate()
	test_combo = test_combo_preload.instantiate()
	get_tree().root.add_child(test_scenario)
	room = test_scenario.get_node("Room2")
	room.add_child(test_combo)

func test_combo_unlock() -> void:
	var room_menu = test_scenario.get_node("HUD").get_node("RoomMenu")
	test_combo.get_node("Display").text = "6969"
	test_combo._on_button_press(test_combo.get_node("Enter"))
	await yield_for(1)
	assert_eq(test_combo.get_node("Display").text, "incorrect")
	assert_eq(room_menu.has_node("Room3"), true)
