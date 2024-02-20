extends GutTest

var test_scenario_preload = preload("res://Tests/TestScenario.tscn")
var test_scenario: Node2D
var hud


func before_all() -> void:
	test_scenario = test_scenario_preload.instantiate()
	get_tree().root.add_child(test_scenario)
	hud = test_scenario.get_node("HUD")


func test_add_item_image() -> void:
	var test_image = load("res://Assets/Sprites/generic_items/genericItem_color_001.png")
	hud.add_item_image(test_image)
	assert_eq(hud.current_item, 1)
	assert_eq(hud.item_slots[0].texture, test_image)


func test_on_menu_pressed_room_menu_visable() -> void:
	hud.get_node("RoomMenu").visible = true
	hud.get_node("Timer").start()
	hud.on_menu_button_pressed()
	assert_eq(hud.get_node("InGameMenu").visible, false)
	assert_eq(hud.get_node("Timer").is_stopped(), false)


func test_on_menu_pressed_room_menu_invisable() -> void:
	hud.get_node("RoomMenu").visible = false
	hud.get_node("Timer").start()
	hud.on_menu_button_pressed()
	assert_eq(hud.get_node("InGameMenu").visible, true)
	assert_eq(hud.get_node("Timer").is_stopped(), true)


func test_on_resume_pressed() -> void:
	hud.on_resume_pressed()
	assert_eq(hud.get_node("Timer").is_stopped(), false)
	assert_eq(hud.get_node("InGameMenu").visible, false)


func test_on_scenario_pressed() -> void:
	hud.on_scenario_pressed()
	assert_eq(hud.has_node("Scenario_menu"), true)


func test_on_map_button_pressed_menu_active_room_menu_invisible_menu_invisible() -> void:
	hud.menu_active = true
	hud.get_node("RoomMenu").visible = false
	hud.get_node("InGameMenu").visible = false
	hud.on_map_button_pressed()
	assert_eq(hud.get_node("RoomMenu").visible, true)


func test_on_map_button_pressed_menu_active_room_menu_invisible_menu_visible() -> void:
	hud.menu_active = true
	hud.get_node("RoomMenu").visible = false
	hud.get_node("InGameMenu").visible = true
	hud.on_map_button_pressed()
	assert_eq(hud.get_node("RoomMenu").visible, false)


func test_on_map_button_pressed_menu_inactive_room_menu_visible() -> void:
	hud.menu_active = false
	hud.get_node("RoomMenu").visible = true
	hud.get_node("InGameMenu").visible = false
	hud.on_map_button_pressed()
	assert_eq(hud.get_node("RoomMenu").visible, false)


func test_on_room_1_pressed() -> void:
	hud.get_node("RoomMenu").visible = true
	hud.on_room1_pressed()
	assert_eq(hud.get_node("RoomMenu").visible, false)


func test_on_room_2_pressed() -> void:
	hud.get_node("RoomMenu").visible = true
	hud.on_room2_pressed()
	assert_eq(hud.get_node("RoomMenu").visible, false)


func test_on_room_3_pressed() -> void:
	hud.get_node("RoomMenu").visible = true
	hud.on_room3_pressed()
	assert_eq(hud.get_node("RoomMenu").visible, false)
