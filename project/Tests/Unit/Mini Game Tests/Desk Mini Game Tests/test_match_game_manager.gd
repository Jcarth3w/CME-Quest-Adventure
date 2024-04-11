extends GutTest

var test_mini_preload = preload("res://Scenes/mini_games/desktop_matching/DeskMiniGame.tscn")
var test_mini: Node2D


func before_all() -> void:
	test_mini = test_mini_preload.instantiate()
	get_tree().root.add_child(test_mini)


func test_pair_timer_true():
	test_mini.pair_flip_1 = test_mini.get_node("Pair 1")
	test_mini.pair_flip_2 = test_mini.get_node("Pair 1")
	test_mini.is_timer_started = true
	test_mini.pair_timer()
	assert_eq(test_mini.get_node("CheckPairTimer").is_stopped(), true)


func test_on_timeout():
	test_mini.pair_flip_1 = test_mini.get_node("Pair 1")
	test_mini.pair_flip_2 = test_mini.get_node("Pair 1")
	test_mini.timer_timeout()
	assert_false(test_mini.is_timer_started)
	assert_eq(test_mini.pair_flip_1, null)
	assert_eq(test_mini.pair_flip_2, null)
	assert_eq(test_mini.flipped_count, 0)


func test_pair_timer_false():
	test_mini.pair_flip_1 = test_mini.get_node("Pair 1")
	test_mini.pair_flip_2 = test_mini.get_node("Pair 1")
	test_mini.is_timer_started = false
	test_mini.pair_timer()
	assert_eq(test_mini.get_node("CheckPairTimer").is_stopped(), false)


func test_on_flip_one():
	test_mini.on_flip(test_mini.get_node("Pair 1"))
	assert_eq(test_mini.flipped_count, 1)
	assert_eq(test_mini.pair_flip_1, test_mini.get_node("Pair 1"))

func test_on_flip_two():
	test_mini.on_flip(test_mini.get_node("Pair 1"))
	assert_eq(test_mini.flipped_count, 2)
	assert_eq(test_mini.pair_flip_2, test_mini.get_node("Pair 1"))


func test_win():
	test_mini.win()
	assert_eq(test_mini.get_node("Label").text, "You win!")
	await yield_for(2)
	assert_eq(get_tree().get_root().has_node("MiniGame"), false)
