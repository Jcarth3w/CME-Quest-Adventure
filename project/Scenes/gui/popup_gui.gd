extends Node2D

var messages = []
var popup_path = "res://Scenes/gui/pop_up_message.tscn"

func show_pickup(title):
	var spawn = spawn_popup()
	if spawn != null:
		spawn.get_node("PickupText").text = "picked up " + title
		add_child(spawn)
		move_messages(spawn)
	
	
func show_message(message):
	var spawn = spawn_popup()
	if spawn != null:
		spawn.get_node("PickupText").text = message
		add_child(spawn)
		move_messages(spawn)
	
	
func spawn_popup():
	var popup_load = load(popup_path)
	
	if (messages.size() < 3):
		var popup = popup_load.instantiate()
		messages.append(popup)
		popup.cleared.connect(_on_message_clear)
		print(messages)
		return popup
	else :
		messages.remove_at(0)
		spawn_popup()
	
	
func _on_message_clear():
	messages.remove_at(0)
	
	
func move_messages(message):
	if (messages.size() > 1):
		for x in messages:
			if (x != message):
				x.global_position.y -= 200
