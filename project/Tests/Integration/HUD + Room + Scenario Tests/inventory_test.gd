extends GutTest

var test_scenario_preload = preload("res://Tests/TestScenario.tscn")
var test_scenario: Node2D
var hud
var inventory
var texture


func before_all() -> void:
	test_scenario = test_scenario_preload.instantiate()
	get_tree().root.add_child(test_scenario)
	hud = test_scenario.get_node("HUD")
	inventory = hud.get_node("Inventory")
	texture = load("res://Assets/Sprites/generic_items/genericItem_color_001.png")


func test_add_item_image():
	hud.add_item_image(texture)
	assert_eq(inventory.get_node("Item1").texture, texture)


func test_add_item_name():
	hud.add_item("mike jor", texture)
	assert_eq(hud.items[0], "mike jor")
