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


func test_on_item_add() -> void:
	var test_image = load("res://Assets/Sprites/generic_items/genericItem_color_001.png")
	hud.on_item_add("test", test_image)
	assert_eq(hud.items[0], "test")


func test_on_hud_button_pressed_menu_button_menu_not_active() -> void:
	hud.menu_active = false
	hud.get_node("Timer").start()
	hud.on_hud_button_pressed(hud.get_node("MenuButton"))
	assert_eq(hud.get_node("Timer").is_stopped(), false)
	assert_eq(hud.get_node("InGameMenu").visible, false)


func test_on_hud_button_pressed_room_menu_visible() -> void:
	hud.menu_active = true
	hud.get_node("RoomMenu").visible = true
	hud.get_node("Timer").start()
	hud.on_hud_button_pressed(hud.get_node("MenuButton"))
	assert_eq(hud.get_node("Timer").is_stopped(), false)
	assert_eq(hud.get_node("InGameMenu").visible, false)


func test_on_hud_button_pressed_menu_button_menu_active() -> void:
	hud.menu_active = true
	hud.get_node("RoomMenu").visible = false
	hud.on_hud_button_pressed(hud.get_node("MenuButton"))
	assert_eq(hud.get_node("Timer").is_stopped(), true)
	assert_eq(hud.get_node("InGameMenu").visible, true)
	


func test_on_hud_button_pressed_room_menu_invisible() -> void:
	hud.menu_active = true
	hud.get_node("RoomMenu").visible = false
	hud.get_node("Timer").start()
	hud.on_hud_button_pressed(hud.get_node("MenuButton"))
	assert_eq(hud.get_node("Timer").is_stopped(), true)
	assert_eq(hud.get_node("InGameMenu").visible, true)



func test_on_hud_button_pressed_map_button_menu_not_active() -> void:
	hud.menu_active = false
	hud.get_node("RoomMenu").visible = true
	hud.on_hud_button_pressed(hud.get_node("MapButton"))
	assert_eq(hud.get_node("RoomMenu").visible, false)


func test_on_hud_button_pressed_map_button_menu_active_menu_visible() -> void:
	hud.map_active = true
	hud.get_node("RoomMenu").visible = false
	hud.get_node("InGameMenu").visible = true
	hud.on_hud_button_pressed(hud.get_node("MapButton"))
	assert_eq(hud.get_node("RoomMenu").visible, false)


func test_on_hud_button_pressed_map_button_menu_active_menu_invisible() -> void:
	hud.map_active = true
	hud.get_node("RoomMenu").visible = false
	hud.get_node("InGameMenu").visible = false
	hud.on_hud_button_pressed(hud.get_node("MapButton"))
	assert_eq(hud.get_node("RoomMenu").visible, true)


func test_on_hud_button_pressed_map_menu_visible() -> void:
	hud.map_active = true
	hud.get_node("RoomMenu").visible = true
	hud.on_hud_button_pressed(hud.get_node("MapButton"))
	assert_eq(hud.get_node("RoomMenu").visible, false)


func test_on_hud_button_pressed_objective_menu_visible() -> void:
	hud.get_node("ObjectiveMenu").visible = true
	hud.on_hud_button_pressed(hud.get_node("ObjectivesButton"))
	assert_eq(hud.get_node("ObjectiveMenu").visible, false)
	assert_eq(hud.get_node("BlackBorderRectangle").get_node("Label").text, "View Objectives")


func test_on_hud_button_pressed_objective_menu_invisible() -> void:
	hud.get_node("ObjectiveMenu").visible = false
	hud.on_hud_button_pressed(hud.get_node("ObjectivesButton"))
	assert_eq(hud.get_node("ObjectiveMenu").visible, true)
	assert_eq(hud.get_node("BlackBorderRectangle").get_node("Label").text, "Hide Objectives")


func test_in_game_menu_press_resume() -> void:
	hud.in_game_menu_press("Resume")
	assert_eq(hud.get_node("Timer").is_stopped(), false)
	assert_eq(hud.get_node("InGameMenu").visible, false)


func test_in_game_menu_press_scenario() -> void:
	hud.in_game_menu_press("Resume")
	assert_eq(test_scenario.has_node("Scenario_menu"), true)


func test_on_room_select() -> void:
	hud.get_node("RoomMenu").visible = true
	hud.on_room_select("Room1")
	assert_eq(hud.get_node("RoomMenu").visible, false)


func test_on_activate_menus() -> void:
	hud.on_activate_menus()
	assert_eq(hud.menu_active, true)
	assert_eq(hud.map_active, true)


func test_on_disable_menus_one() -> void:
	hud.on_disable_menus(1)
	assert_eq(hud.menu_active, false)


func test_on_disable_menus_two() -> void:
	hud.on_disable_menus(2)
	assert_eq(hud.map_active, false)


func test_on_disable_menus_three() -> void:
	hud.on_disable_menus(3)
	assert_eq(hud.menu_active, false)
	assert_eq(hud.map_active, false)


#func test_connect_buttons() -> void:
#	hud.connect_buttons()
#	await yield_for(2)
##	assert_eq(is_connected("pressed", Callable(hud.get_node("MapButton"), "on_hud_button_pressed")), true)
#	assert_eq(is_connected("pressed", Callable(hud.get_node("ObjectivesButton"), "on_hud_button_pressed")), true)
#	assert_eq(is_connected("in_game_menu_pressed", Callable(hud.get_node("InGameMenu"), "in_game_menu_pressed")), true)
##	assert_eq(is_connected("room_select", Callable(hud.get_node("RoomMenu"), "on_room_select")), true)
