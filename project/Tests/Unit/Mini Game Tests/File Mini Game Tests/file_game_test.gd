extends GutTest

var test_mini_preload = preload("res://Scenes/mini_games/file_finder/file_minigame.tscn")
var test_mini: Node2D


func before_all() -> void:
	test_mini = test_mini_preload.instantiate()
	get_tree().root.add_child(test_mini)


func test_next_button():
	test_mini._on_next_pressed()
	assert_eq(test_mini.files[test_mini.current_file - 1].global_position, test_mini.get_node("OffRight").global_position)
	assert_eq(test_mini.files[test_mini.current_file].global_position, test_mini.get_node("Center").global_position)
	assert_eq(test_mini.current_file, 1)


func test_prev_button():
	test_mini._on_previous_pressed()
	assert_eq(test_mini.files[test_mini.current_file + 1].global_position, test_mini.get_node("OffLeft").global_position)
	assert_eq(test_mini.files[test_mini.current_file].global_position, test_mini.get_node("Center").global_position)
	assert_eq(test_mini.current_file, 0)


func test_on_file_pressed_incorrect():
	test_mini.on_file_press(test_mini.files[0])
	assert_eq(test_mini.get_node("Check").text, "Incorrect.")


func test_on_file_pressed_correct():
	test_mini.get_node("File4").global_position = test_mini.get_node("Center").global_position
	test_mini.on_file_press(test_mini.files[3])
	assert_eq(test_mini.get_node("Check").text, "Congratulations!")
