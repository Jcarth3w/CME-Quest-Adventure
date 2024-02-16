extends GutTest

var test_mini_preload = preload("res://Scenes/mini_games/Crossword_Puzzle/crossword_minigame.tscn")
var test_mini: Node2D
var test_texture: Texture

func before_all() -> void:
	test_mini = test_mini_preload.instantiate()
	get_tree().root.add_child(test_mini)
	test_texture = load("res://Assets/Crossword_Assets/andragogy.png")


func test_check_answer_incorrect():
	test_mini.get_node("UserText").text = "smart water"
	test_mini.check_answer()
	assert_eq(test_mini.get_node("UserText").text, "smart water")

func test_check_answer_correct():
	test_mini.get_node("UserText").text = "andragogy"
	test_mini.check_answer()
	assert_eq(test_mini.get_node("Andragogy").texture, test_texture)


func test_check_fail():
	assert_eq(test_mini.check_win(), null)

func test_check_win():
	test_mini.answers.clear()
	test_mini.check_win()
	assert_eq(test_mini.get_node("Label").text, "You win!")
