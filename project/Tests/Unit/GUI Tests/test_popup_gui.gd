extends GutTest

var test_scenario_preload = preload("res://Tests/TestScenario.tscn")
var test_scenario: Node2D
var test_popup
var popup_path = "res://Scenes/gui/popup/pop_up_message.tscn"


func before_all() -> void:
	test_scenario = test_scenario_preload.instantiate()
	get_tree().root.add_child(test_scenario)
	test_popup = test_scenario.get_node("popup_gui")


func test_spawn_popup() -> void:
	var popup = load(popup_path)
	var spawn = popup.instantiate()
	assert_eq(test_popup.spawn_popup() is ColorRect, true)


func test_spawn_popup_messages_full() -> void:
	var popup = load(popup_path)
	var spawn = popup.instantiate()
	test_popup.messages.append(spawn)
	test_popup.messages.append(spawn)
	test_popup.messages.append(spawn)
	test_popup.spawn_popup()
	assert_eq(test_popup.messages.size(), 3) 


func test_move_messages() -> void:
	var popup = load(popup_path)
	var spawn = popup.instantiate()
	var spawn2 = popup.instantiate()
	test_popup.messages.append(spawn)
	var pos = spawn.global_position.y
	test_popup.messages.append(spawn2)
	test_popup.move_messages(spawn2)
	assert_eq(spawn.global_position.y, (pos - 200))
