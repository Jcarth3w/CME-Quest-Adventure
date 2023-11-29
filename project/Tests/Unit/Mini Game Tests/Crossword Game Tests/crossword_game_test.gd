extends GutTest

var test_mini_preload = preload("res://Scenes/mini_games/Crossword_Puzzle/crossword_minigame.tscn")
var test_mini: Node2D

func before_all() -> void:
	test_mini = test_mini_preload.instantiate()
	get_tree().root.add_child(test_mini)


func test_check_answer_incorrect():
	test_mini.get_node("UserText").text = "smart water"
	test_mini.check_answer()
	assert_eq(test_mini.get_node("UserText").text, "")

func test_check_answer_correct():
	test_mini.get_node("UserText").text = "andragogy"
	test_mini.check_answer()
	assert_eq(test_mini.get_node("Word1").visible, true)
