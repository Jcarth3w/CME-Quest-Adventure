extends GutTest

var test_room_preload = preload("res://Tests/TestRoom.tscn")
var test_room: Node2D
var button


func before_all() -> void:
	test_room = test_room_preload.instantiate()
	get_tree().root.add_child(test_room)
	button = test_room.get_node("StaticSceneButton")


func test_button():
	button.scene_path = "res://Scenes/static_scene/whiteboard.tscn"
	button.spawn_scene()
	await get_tree().create_timer(1).timeout
	assert_eq(button.has_node("Whiteboard"), true)
