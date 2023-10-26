extends TextureButton


signal clicked


@onready var inventory : Inventory

@export var clickable_name : String
@export var clickable_sprite : Texture


func _ready():
	texture_normal = clickable_sprite


func _on_pressed():
	print("Pressed " + clickable_name)
	clicked.emit()
	queue_free()


func _on_clicked():
	inventory.add_item(clickable_name, clickable_sprite.resource_path)
