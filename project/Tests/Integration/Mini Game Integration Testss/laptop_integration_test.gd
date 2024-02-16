extends GutTest

var test_laptop_preload = preload("res://Scenes/mini_games/laptop/laptop_mini_game.tscn")
var test_room_preload = preload("res://Scenes/rooms/room_3.tscn")
var test_room: Node2D
var test_laptop: Node2D

func before_all() -> void:
	test_laptop = test_laptop_preload.instantiate()
	test_room = test_room_preload.instantiate()
	get_tree().root.add_child(test_room)
	test_room.add_child(test_laptop)


func test_on_print_pressed() -> void:
	var files_screen = test_laptop.get_node("Files")
	var printed_feedback = files_screen.get_node("PrintFeedback")
	test_laptop.current_file = files_screen.get_node("File4")
	test_laptop.on_print_pressed()
	assert_eq(test_room.has_node("printed"), true)
	assert_eq(files_screen.get_node("PrintFeedback").visible, true)


func test_on_power_button_pressed_with_printed_feedback() -> void:
	var files_screen = test_laptop.get_node("Files")
	var printed_feedback = files_screen.get_node("PrintFeedback")
	test_laptop.current_file = files_screen.get_node("File4")
	test_laptop.on_print_pressed()
	test_laptop.on_power_button_pressed()
	await yield_for(1)
	assert_eq(get_tree().get_root().has_node("LaptopMiniGame"), false)
	assert_eq(test_room.has_node("printed"), true)

