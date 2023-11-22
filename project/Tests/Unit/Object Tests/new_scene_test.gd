extends GutTest

var test_room_preload = preload("res://Tests/TestRoom.tscn")
var test_room: Node2D
var new_scene

func before_all() -> void:
	test_room = test_room_preload.instantiate()
	get_tree().root.add_child(test_room)
	new_scene = test_room.get_node("TestNewScene")
	
	
func test_new_scene():
	new_scene.scene_path = "res://Scenes/mini_games/shredder/ShredderMiniGame.tscn"
	new_scene._on_pressed()
	assert_eq(test_room.has_node("ShredderMiniGame"), true)
