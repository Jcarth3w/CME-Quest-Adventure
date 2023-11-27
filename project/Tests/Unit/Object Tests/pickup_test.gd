extends GutTest

var test_room_preload = preload("res://Tests/TestRoom.tscn")
var test_room: Node2D
var pickup


func before_all() -> void:
	test_room = test_room_preload.instantiate()
	get_tree().root.add_child(test_room)
	pickup = test_room.get_node("TestPickup")


func test_pickup():
	pickup._on_pressed()
	await yield_frames(1) #test is too fast
	assert_eq(test_room.has_node("TestPickup"), false)
