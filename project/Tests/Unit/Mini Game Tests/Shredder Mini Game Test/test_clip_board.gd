extends GutTest

var test_mini_preload = preload("res://Scenes/mini_games/shredder/ShredderMiniGame.tscn")
var test_mini: Node2D
var clip_board


func before_all() -> void:
	test_mini = test_mini_preload.instantiate()
	get_tree().root.add_child(test_mini)
	clip_board = test_mini.get_node("ClipBoard")


func test_reset_shreds():
	clip_board.shreds = [test_mini.get_node("Shred 1"), test_mini.get_node("Shred 5"), test_mini.get_node("Shred 6")]
	clip_board.reset_shreds()
	assert_eq(clip_board.current_shred, 0)
	assert_eq(clip_board.shreds, [])


func test_check_win_true():
	clip_board.shreds = test_mini.get_node("ClipBoard").winning_combo
	assert_eq(clip_board.check_win(), true)

func test_check_win_false():
	clip_board.shreds = [test_mini.get_node("Shred 1"), test_mini.get_node("Shred 5"), test_mini.get_node("Shred 6")]
	assert_eq(clip_board.check_win(), false)

func test_add_shred():
	clip_board.add_shred(test_mini.get_node("Shred 1"))
	assert_eq(clip_board.current_shred, 1)
	assert_eq(clip_board.shreds.has(test_mini.get_node("Shred 1")), true)
	assert_eq(test_mini.get_node("Shred 1").rotation_degrees, 0.0)

func test_add_first_shred():
	clip_board.current_shred = 0
	clip_board.add_shred(test_mini.get_node("Shred 1"))
	assert_eq(test_mini.get_node("Shred 1").global_position, clip_board.get_node("Check1").global_position)

func test_add_second_shred():
	clip_board.add_shred(test_mini.get_node("Shred 4"))
	assert_eq(test_mini.get_node("Shred 4").global_position, clip_board.get_node("Check2").global_position)

func test_add_third_shred():
	clip_board.add_shred(test_mini.get_node("Shred 2"))
	assert_eq(test_mini.get_node("Shred 2").global_position, clip_board.get_node("Check3").global_position)
