extends GutTest

var test_laptop_preload = preload("res://Scenes/mini_games/laptop/laptop_mini_game.tscn")
var test_laptop: Node2D

func before_all() -> void:
	test_laptop = test_laptop_preload.instantiate()
	get_tree().root.add_child(test_laptop)


func test_change_screen_failure() -> void:
	test_laptop.change_screen(test_laptop.get_node("Login"))
	assert_eq(test_laptop.get_node("Login").visible, true)


func test_change_screen_success() -> void:
	test_laptop.change_screen(test_laptop.get_node("Files"))
	assert_eq(test_laptop.get_node("Login").visible, false)
	assert_eq(test_laptop.get_node("Files").visible, true)


func test_change_file_reader_no_file() -> void:
	var files_screen = test_laptop.get_node("Files")
	test_laptop.change_file_reader("nosuchfile")
	assert_eq(files_screen.get_node("FileText").text, "placeholder text")


func test_change_file_reader_with_file() -> void:
	var files_screen = test_laptop.get_node("Files")
	test_laptop.change_file_reader("one.txt")
	assert_eq(files_screen.get_node("FileText").text, "This is a placeholder document\n")


func test_on_login_button_pressed_failure() -> void:
	var login_screen = test_laptop.get_node("Login")
	test_laptop._on_button_pressed()
	assert_eq(login_screen.get_node("Feedback").visible, true)


func test_on_login_button_pressed_success() -> void:
	var login_screen = test_laptop.get_node("Login")
	login_screen.get_node("Username").text = "john"
	login_screen.get_node("Password").text = "123"
	test_laptop._on_button_pressed()
	assert_eq(login_screen.visible, false)
	assert_eq(test_laptop.get_node("Files").visible, true)

func test_on_file_pressed() -> void:
	var files_screen = test_laptop.get_node("Files")
	test_laptop._on_file_press(files_screen.get_node("File1"))
	assert_eq(files_screen.get_node("FileText").text, "This is a placeholder document\n")


func test_on_power_button_pressed() -> void:
	test_laptop._on_power_button_pressed()
	await yield_for(1)
	assert_eq(get_tree().get_root().has_node("LaptopMiniGame"), false)
