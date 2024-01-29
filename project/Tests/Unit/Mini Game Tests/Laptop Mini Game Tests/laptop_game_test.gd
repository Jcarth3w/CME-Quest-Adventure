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
	print(files_screen.get_node("FileText").text)
	assert_eq(files_screen.get_node("FileText").text, "somebody once told me\nthe world was gonna roll me\ni aint the sharpest tool in the sheeeed\n")
	
	
