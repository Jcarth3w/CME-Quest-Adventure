extends GutTest

var test_mini_preload = preload("res://Scenes/mini_games/desktop_matching/DeskMiniGame.tscn")
var test_mini: Node2D
var test_card


func before_all() -> void:
	test_mini = test_mini_preload.instantiate()
	get_tree().root.add_child(test_mini)
	test_card = test_mini.get_node("Pair 1/Card 1")


func test_reset():
	test_card.reset()
	assert_eq(test_card.isFlipped, false)
	assert_eq(test_card.texture, test_card.hideImage)


func test_flip():
	test_card.flip()
	assert_eq(test_card.isFlipped, true)
	assert_eq(test_card.texture, test_card.cardImage)
