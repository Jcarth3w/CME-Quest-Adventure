class_name Pickup
extends TextureButton


@onready var room = get_tree().get_root().get_node("Room")
@onready var inventory = room.get_node("Inventory")

@export var clickable_name : String
@export var clickable_sprite : Texture



func _ready():
	texture_normal = clickable_sprite


func _on_pressed():
	if room.state == "active":
		inventory.add_item(clickable_name, clickable_sprite)
		queue_free()



