extends GutTest

var test_mini_preload = preload("res://Scenes/mini_games/desktop_matching/DeskMiniGame.tscn")
var test_mini: Node2D


func before_all() -> void:
	test_mini = test_mini_preload.instantiate()
	get_tree().root.add_child(test_mini)
	
	
func test_check_pair_false():
	test_mini.flipped_count = 1
	test_mini.check_pair()
	assert_eq(test_mini.get_node("CheckPairTimer").is_stopped(), true)

func test_check_pair_true():
	test_mini.flipped_count = 2
	test_mini.checkPairMatching = false
	test_mini.check_pair()
	assert_eq(test_mini.get_node("CheckPairTimer").is_stopped(), false)


func test_on_timeout():
	test_mini._on_timer_timeout()
	assert_eq(test_mini.checkPairMatching, false)
	assert_eq(test_mini.isTimerStarted, false)


func test_win():
	test_mini.win()
	assert_eq(test_mini.get_node("Label").text, "You win!")
	await yield_for(2)
	assert_eq(get_tree().get_root().has_node("MiniGame"), false)
