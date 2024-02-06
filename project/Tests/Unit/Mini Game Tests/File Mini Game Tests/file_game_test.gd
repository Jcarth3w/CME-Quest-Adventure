extends GutTest

var test_mini_preload = preload("res://Scenes/mini_games/file_finder/file_minigame.tscn")
var test_mini: Node2D


func before_all() -> void:
	test_mini = test_mini_preload.instantiate()
	get_tree().root.add_child(test_mini)


func test_next_button():
	test_mini._on_next_pressed()
	print(test_mini.file_textures[test_mini.current_file - 1])
	assert_eq(test_mini.file_textures[test_mini.current_file], test_mini.get_node("FileFind").get_node("Center").texture_normal)
	assert_eq(test_mini.current_file, 0)


func test_prev_button():
	test_mini.current_file = 1
	test_mini.previous_pressed()
	assert_eq(test_mini.file_textures[test_mini.current_file + 1], test_mini.get_node("FileFind").get_node("OffLeft").texture)
	assert_eq(test_mini.file_textures[test_mini.current_file], test_mini.get_node("FileFind").get_node("Center").texture_normal)
	assert_eq(test_mini.current_file, 0)


func test_on_file_pressed_incorrect():
	test_mini.current_file = 2
	test_mini._on_center_pressed()
	assert_eq(test_mini.get_node("FileFind").get_node("Check").text, "Incorrect.")


func test_on_file_pressed_correct():
	test_mini.current_file = 3
	test_mini._on_center_pressed()
	assert_eq(test_mini.get_node("FileFind").get_node("Check").text, "Congratulations!")
