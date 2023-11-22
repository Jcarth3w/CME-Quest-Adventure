extends GutTest

var test_mini_preload = preload("res://Scenes/mini_games/shredder/ShredderMiniGame.tscn")
var test_mini: Node2D


func before_all() -> void:
	test_mini = test_mini_preload.instantiate()
	get_tree().root.add_child(test_mini)


func test_on_shred_press():
	test_mini.on_shred_press(test_mini.get_node("Shred 1"))
	assert_eq(test_mini.get_node("ClipBoard").shreds[0], test_mini.get_node("Shred 1"))


func test_on_check_bttn_pressed():
	test_mini.get_node("ClipBoard").shreds = test_mini.get_node("ClipBoard").winning_combo
	test_mini._on_check_bttn_pressed()
	assert_eq(test_mini.get_node("CheckBttn/Label").text, "You win!")
