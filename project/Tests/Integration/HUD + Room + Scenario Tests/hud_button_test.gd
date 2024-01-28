extends GutTest

var test_scenario_preload = preload("res://Tests/TestScenario.tscn")
var test_scenario: Node2D
var hud
var timer
var room
var room2
var texture


func before_all() -> void:
	test_scenario = test_scenario_preload.instantiate()
	get_tree().root.add_child(test_scenario)
	room = test_scenario.get_node("Room1")
	room2 = test_scenario.get_node("Room2")
	room.resume_room()
	hud = test_scenario.get_node("HUD")
	


func test_press_inactive_menu_button_() -> void:
	hud.menu_active = false
	var moveable = room.get_node("TestMoveable")
	var new_scene = room.get_node("TestNewScene")
	var pickup = room.get_node("TestPickup")
	var static_scene = room.get_node("StaticSceneButton")
	hud._on_menu_button_pressed()
	
	assert_eq(moveable.disabled, false)
	assert_eq(new_scene.disabled, false)
	assert_eq(pickup.disabled, false)
	assert_eq(static_scene.disabled, false)


func test_press_active_menu_inactive_room_menu_active() -> void:
	hud.menu_active = true
	var moveable = room.get_node("TestMoveable")
	var new_scene = room.get_node("TestNewScene")
	var pickup = room.get_node("TestPickup")
	var static_scene = room.get_node("StaticSceneButton")
	var timer = hud.get_node("Timer")
	var in_game_menu = hud.get_node("InGameMenu")
	hud.get_node("RoomMenu").visible = true
	hud._on_menu_button_pressed()
	
	assert_eq(moveable.disabled, true)
	assert_eq(new_scene.disabled, true)
	assert_eq(pickup.disabled, true)
	assert_eq(static_scene.disabled, true)
	assert_eq(timer.is_stopped(), false)
	assert_eq(in_game_menu.visible, false)


func test_press_active_menu() -> void:
	hud.menu_active = true
	var moveable = room.get_node("TestMoveable")
	var new_scene = room.get_node("TestNewScene")
	var pickup = room.get_node("TestPickup")
	var static_scene = room.get_node("StaticSceneButton")
	var timer = hud.get_node("Timer")
	var in_game_menu = hud.get_node("InGameMenu")
	hud.get_node("RoomMenu").visible = false
	hud._on_menu_button_pressed()
	
	assert_eq(moveable.disabled, true)
	assert_eq(new_scene.disabled, true)
	assert_eq(pickup.disabled, true)
	assert_eq(static_scene.disabled, true)
	assert_eq(timer.is_stopped(), true)
	assert_eq(in_game_menu.visible, true)


func test_press_inactive_room_menu() -> void:
	hud.menu_active = false
	var room_menu = hud.get_node("RoomMenu")
	hud._on_menu_button_pressed()
	assert_eq(room_menu.visible, false)
	
func test_press_active_room_menu() -> void:
	hud.menu_active = true
	var room_menu = hud.get_node("RoomMenu")
	hud._on_menu_button_pressed()
	assert_eq(room_menu.visible, false)
	
	
func test_on_resume_pressed() -> void:
	var moveable = room.get_node("TestMoveable")
	var new_scene = room.get_node("TestNewScene")
	var pickup = room.get_node("TestPickup")
	var static_scene = room.get_node("StaticSceneButton")
	var timer = hud.get_node("Timer")
	var in_game_menu = hud.get_node("InGameMenu")
	
	hud._on_resume_pressed()
	
	assert_eq(moveable.disabled, false)
	assert_eq(new_scene.disabled, false)
	assert_eq(pickup.disabled, false)
	assert_eq(static_scene.disabled, false)
	assert_eq(timer.is_stopped(), false)
	assert_eq(in_game_menu.visible, false)


func test_on_room1_pressed() -> void:
	var room_menu = hud.get_node("RoomMenu")
	var crossword = room2.get_node("Crossword_Button")
	var static_scene = room2.get_node("StaticSceneButton")
	hud._on_room1_pressed()
	
	
	assert_eq(hud.get_parent().current_room, room)
	assert_eq(room_menu.visible, false)
	assert_eq(crossword.disabled, true)
	assert_eq(static_scene.disabled, true)


func test_on_room2_pressed() -> void:
	var room_menu = hud.get_node("RoomMenu")
	var moveable = room.get_node("TestMoveable")
	var new_scene = room.get_node("TestNewScene")
	var pickup = room.get_node("TestPickup")
	var static_scene = room.get_node("StaticSceneButton")
	hud._on_room2_pressed()
	
	
	assert_eq(hud.get_parent().current_room, room2)
	assert_eq(room_menu.visible, false)
	assert_eq(moveable.disabled, true)
	assert_eq(new_scene.disabled, true)
	assert_eq(pickup.disabled, true)
	assert_eq(static_scene.disabled, true)
	
	

func test_on_quit_pressed_send_data() -> void:
	var timer = hud.get_node("Timer")
	hud._on_quit_pressed()
	
	assert_eq(hud.get_parent().finished_time, timer.get_node("Label").text)
	assert_eq(hud.get_parent().finished, 0)
	assert_eq(hud.get_parent().generic_user, "Lani")
	assert_eq(hud.get_parent().scenario_num, 1)


func test_on_quit_pressed_delete_file() -> void:
	hud._on_quit_pressed()
	assert_eq(FileAccess.file_exists("res://Scenes/mini_games/Crossword_Puzzle/saved_puzzle.txt"), false)



