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


func test_label_update_on_number_button_press() -> void:
	test_combo.on_button_press(test_combo.get_node("1"))
	assert_eq(test_combo.get_node("Display").text, "1")


func test_label_update_on_clear_press() -> void:
	test_combo.get_node("Display").text = "123456789"
	test_combo.on_button_press(test_combo.get_node("Clear"))
	assert_eq(test_combo.get_node("Display").text, "")


func test_check_answer_success() -> void:
	test_combo.get_node("Display").text = test_combo.answer
	test_combo.check_answer("8562")
	assert_eq(test_combo.get_node("Display").text, "unlocked room 3")


func test_check_answer_failure() -> void:
	test_combo.get_node("Display").text = test_combo.answer
	test_combo.check_answer("1234")
	assert_eq(test_combo.get_node("Display").text, "incorrect")


func test_label_update_on_enter_press() -> void:
	test_combo.get_node("Display").text = "8562"
	test_combo.on_button_press(test_combo.get_node("Enter"))
	assert_eq(test_combo.get_node("Display").text, "unlocked room 3")
