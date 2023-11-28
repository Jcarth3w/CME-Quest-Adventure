extends GutTest

var test_room_preload = preload("res://Tests/TestRoom.tscn")
var test_room: Node2D


func before_all() -> void:
	test_room = test_room_preload.instantiate()
	get_tree().root.add_child(test_room)
