class_name Pickup
extends Clickable

var inventory


func _ready() -> void:
	if owner.has_node("Inventory"):
		inventory = owner.get_node("Inventory")
	else:
		print("Pickup Error: I expected there to be an inventory")


func _on_pressed() -> void:
	if state == "active":
		inventory.add_item(name, texture_normal)
		queue_free()


func pressed():
	if state == "active":
		inventory.add_item(name, texture_normal)
		queue_free()
