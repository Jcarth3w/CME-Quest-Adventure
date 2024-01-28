extends GutTest

var test_room_preload = preload("res://Tests/TestRoom.tscn")
var test_room: Node2D
var button


func before_all() -> void:
	test_room = test_room_preload.instantiate()
	get_tree().root.add_child(test_room)
	button = test_room.get_node("StaticSceneButton")

#Confirms scene has been loaded
func test_button():
	button.scene_path = "res://Scenes/static_scene/whiteboard.tscn"
	button.action()
	await get_tree().create_timer(1).timeout
	assert_eq(test_room.has_node("Whiteboard"), true)
