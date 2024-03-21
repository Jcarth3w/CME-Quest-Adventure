extends GutTest

var test_bb_game_preload = preload("res://Scenes/mini_games/Bulletin Board/bulletin_board.tscn")
var test_bb_game: Node2D
var test_dict1 = {"Spot1" : "ItemC", "Spot2" : "ItemO", "Spot3" : "ItemM"} 
var test_dict2 = {"s1" : "ItemC", "s2" : "ItemO", "s3" : "ItemM" }
var test_dict3 = {"Spot1" : "ic", "Spot2" : "io", "Spot3" : "im"}
var correct_order = {"Spot1" : "ItemC", "Spot2" : "ItemO", "Spot3" : "ItemM",
"Spot4" : "ItemP", "Spot5" : "ItemL", "Spot6" : "ItemI", 
"Spot7" : "ItemA", "Spot8" : "ItemN", "Spot9" : "ItemC2", "Spot10" : "ItemE"}


func before_all() -> void:
	test_bb_game = test_bb_game_preload.instantiate()
	get_tree().root.add_child(test_bb_game)



func test_compare_dict_false_condition1() -> void:
	assert_false(test_bb_game.compare_dict(test_dict1, test_dict2))


func test_compare_dict_false_condition2() -> void:
	assert_false(test_bb_game.compare_dict(test_dict1, test_dict3))


func test_compare_dict_true_condition() -> void:
	assert_true(test_bb_game.compare_dict(test_dict1, test_dict1))


func test_reset() -> void:
	var items_visible = true
	test_bb_game.reset()
	for child in test_bb_game.get_children():
		if(child.name.contains("Item") and !child.visible):
			print(child)
			items_visible = false
			break
		if(child.name.contains("Spot") and child.get_node("Label").visible):
			print(child)
			items_visible = false
			break
	assert_true(items_visible)


func test_button_lose() -> void:
	test_bb_game.player_order = {}
	test_bb_game.check_win_button_pressed()
	assert_eq(test_bb_game.label.text, "Try again...")


#func test_check_button_win() -> void:
#	test_bb_game.player_order = correct_order
#	test_bb_game.check_win_button_pressed()
#	assert_eq(test_bb_game.label.text, "You Win!")
