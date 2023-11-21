extends GutTest

var test_room_preload = preload("res://Tests/TestRoom.tscn")
var test_room: Node2D

func before_all() -> void:
	test_room = test_room_preload.instantiate()
	get_tree().root.add_child(test_room)
	

func test_movement_object():
	var moveable = test_room.get_node("TestMoveable")
	moveable.Xcoordinate = 200
	moveable.Ycoordinate = 200
	moveable._on_pressed()
	assert_eq(moveable.global_position, Vector2(200, 200))
	
	

