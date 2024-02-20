extends GutTest

var test_scenario_preload = preload("res://Tests/TestScenario.tscn")
var test_scenario: Node2D
var hud
var test_room_menu: CanvasLayer


func before_all() -> void:
	test_scenario = test_scenario_preload.instantiate()
	get_tree().root.add_child(test_scenario)
	hud = test_scenario.get_node("HUD")
	test_room_menu = hud.get_node("RoomMenu")


#func test_connect_buttons() -> void:
#	test_room_menu.connect_buttons()
#	assert_eq(is_connected("pressed", Callable(test_room_menu.get_node("Room1"), "on_button_press")), true)
#	assert_eq(is_connected("pressed", Callable(test_room_menu.get_node("Room2"), "on_button_press")), true)
#	assert_eq(is_connected("pressed", Callable(test_room_menu.get_node("Room3"), "on_button_press")), true)
