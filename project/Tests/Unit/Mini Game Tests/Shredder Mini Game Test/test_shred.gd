extends GutTest

var test_mini_preload = preload("res://Scenes/mini_games/shredder/ShredderMiniGame.tscn")
var test_mini: Node2D


func before_all() -> void:
	test_mini = test_mini_preload.instantiate()
	get_tree().root.add_child(test_mini)

func test_reset_shred():
	test_mini.get_node("Shred 1").global_position = Vector2(0, 0)
	test_mini.get_node("Shred 1").scale = Vector2(1, .5)
	test_mini.get_node("Shred 1").rotation_degrees = 0
	test_mini.get_node("Shred 1").reset_shred()
	assert_eq(test_mini.get_node("Shred 1").global_position, test_mini.get_node("Shred 1").start_position)
	assert_eq(test_mini.get_node("Shred 1").scale, test_mini.get_node("Shred 1").start_scale)
	assert_eq(test_mini.get_node("Shred 1").rotation_degrees, test_mini.get_node("Shred 1").start_rotation)
