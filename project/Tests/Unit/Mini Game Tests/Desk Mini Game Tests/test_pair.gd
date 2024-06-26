extends GutTest

var test_mini_preload = preload("res://Scenes/mini_games/desktop_matching/DeskMiniGame.tscn")
var test_mini: Node2D
var test_pair


func before_all() -> void:
	test_mini = test_mini_preload.instantiate()
	get_tree().root.add_child(test_mini)
	test_pair = test_mini.get_node("Pair 1")


func test_check_pair_false():
	test_pair.check_pair()
	assert_eq(test_pair.is_matched, false)


func test_check_pair_true():
	test_pair.card_1.is_flipped = true
	test_pair.card_2.is_flipped = true
	test_pair.check_pair()
	assert_eq(test_pair.is_matched, true)


func test_on_disable_children():
	test_pair.disable_children()
	assert_true(test_pair.get_node("Card 1").disabled)
	assert_true(test_pair.get_node("Card 2").disabled)


func test_on_enable_children():
	test_pair.enable_children()
	assert_false(test_pair.get_node("Card 1").disabled)
	assert_false(test_pair.get_node("Card 2").disabled)
