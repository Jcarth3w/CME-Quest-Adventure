extends TextureButton


signal clicked


@onready var inventory : Inventory

@export var clickable_name : String
@export var clickable_sprite : Texture


func _ready():
	texture_normal = clickable_sprite


func _on_pressed():
	print("Pressed " + clickable_name)
	clicked.emit(clickable_name, clickable_sprite)
	queue_free()



