extends Node2D

var popup_path = "res://Scenes/gui/pop_up_message.tscn"

func show_pickup(title):
	var spawn = spawn_popup()
	spawn.get_node("PickupText").text = "picked up " + title
	add_child(spawn)
	
func show_message(message):
	var spawn = spawn_popup()
	spawn.get_node("PickupText").text = message
	add_child(spawn)
	
	
func spawn_popup():
	var popup_load = load(popup_path)
	var popup = popup_load.instantiate()
	return popup
	
