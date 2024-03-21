extends GutTest

var test_leaderboard_preload = preload("res://Scenes/main_menus/Leader_Board.tscn")
var test_leaderboard: Node2D


func before_all() -> void:
	test_leaderboard = test_leaderboard_preload.instantiate()
	get_tree().root.add_child(test_leaderboard)


func test_on_scenario1_pressed() -> void:
	test_leaderboard._on_scenario_1_button_pressed()
	assert_eq(test_leaderboard.get_node("Scenario1Times").visible, true)
	assert_eq(test_leaderboard.get_node("Scenario2Times").visible, false)



