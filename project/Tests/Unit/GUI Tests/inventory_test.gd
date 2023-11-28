extends GutTest

var test_room_preload = preload("res://Tests/TestRoom.tscn")
var test_room: Node2D
var inventory
var texture


func before_all() -> void:
	test_room = test_room_preload.instantiate()
	get_tree().root.add_child(test_room)
	inventory = test_room.get_node("Inventory")
	texture = load("res://Assets/Sprites/generic_items/genericItem_color_001.png")


func test_add_item_image():
	inventory.add_item_image(texture)
	assert_eq(inventory.get_node("Item1").texture, texture)


func test_add_item_name():
	inventory.add_item("mike jor", texture)
	assert_eq(inventory.items[0], "mike jor")
