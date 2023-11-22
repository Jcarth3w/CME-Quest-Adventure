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
