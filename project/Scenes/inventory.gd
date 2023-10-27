class_name Inventory extends Node

var items = []
var current_item := 1


func add_item(item_name, sprite_path):
	items.append(item_name)
	add_item_image(sprite_path)


func remove_item(item_name):
	var x = items.find(item_name)
	if x == 0:
		$Item1.texture = null
	elif x == 1:
		$Item2.texture = null
	else:
		$Item3.texture = null
	items.erase(item_name)
	

func add_item_image(sprite_path):
	if current_item == 1:
		$Item1.texture = sprite_path
	elif current_item == 2:
		$Item2.texture = sprite_path
	else:
		$Item3.texture = sprite_path
	current_item += 1


func _on_object_clicked(c_name, c_sprite):
	add_item(c_name, c_sprite)


func _on_object_2_clicked(c2_name, c2_sprite):
	add_item(c2_name, c2_sprite)


func _on_object_3_clicked(c3_name, c3_sprite):
	add_item(c3_name, c3_sprite)
