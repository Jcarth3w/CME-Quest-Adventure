extends Node2D

var messages = []
var popup_path = "res://Scenes/gui/popup/pop_up_message.tscn"


func _ready():
	connect_room()


func on_item_add(title,_texture):
	show_pickup(title)


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
		return popup
	messages.remove_at(0)
	spawn_popup()


func connect_room():
	for child in get_parent().get_children():
		if child is Room:
			child.item_add.connect(on_item_add)

func _on_message_clear():
	messages.remove_at(0)


func move_messages(message):
	if (messages.size() > 1):
		for x in messages:
			if (x != message):
				x.global_position.y -= 200
