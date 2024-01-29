extends GutTest

var test_scenario_preload = preload("res://Tests/TestScenario.tscn")
var test_scenario: Node2D
var hud
var room
var room2
var room3
var texture
var inventory


func before_all() -> void:
	test_scenario = test_scenario_preload.instantiate()
	get_tree().root.add_child(test_scenario)
	room = test_scenario.get_node("Room1")
	room2 = test_scenario.get_node("Room2")
	room3 = test_scenario.get_node("Room3")
	hud = test_scenario.get_node("HUD")
	inventory = hud.get_node("Inventory")

func test_on_static_scene_spawn() -> void:
	room._on_static_scene_spawn()
	assert_eq(hud.map_active, false)
	assert_eq(hud.menu_active, false)

func test_on_resume_room() -> void:
	var moveable = room.get_node("TestMoveable")
	var new_scene = room.get_node("TestNewScene")
	var pickup = room.get_node("TestPickup")
	var static_scene = room.get_node("StaticSceneButton")
	room.resume_room()
	
	assert_eq(moveable.disabled, false)
	assert_eq(new_scene.disabled, false)
	assert_eq(pickup.disabled, false)
	assert_eq(static_scene.disabled, false)
	assert_eq(hud.map_active, true)
	assert_eq(hud.menu_active, true)


func test_give_item() -> void:
	room.give_item("book", load("res://Assets/Sprites/generic_items/genericItem_color_032.png"))
	assert_eq(inventory.get_node("Item1").texture, load("res://Assets/Sprites/generic_items/genericItem_color_032.png"))
	assert_eq(hud.items.has("book"), true)


func test_unlock_room2() -> void:
	var room_menu = hud.get_node("RoomMenu")
	room.unlock(2)
	assert_eq(room_menu.get_node("Room2").visible, true)


func test_unlock_room3() -> void:
	var room_menu = hud.get_node("RoomMenu")
	room.unlock(3)
	assert_eq(room_menu.get_node("Room3").visible, true)
