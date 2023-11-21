extends Clickable

@export var clickable_name : String
@export var clickable_sprite : Texture
@export var x_coordinate : int
@export var y_coordinate : int

var start_x
var start_y
var moved = false


func _ready() -> void:
	texture_normal = clickable_sprite
	start_x = global_position.x
	start_y = global_position.y


func _on_pressed() -> void:
	if state == "active" and not moved:
		self.position.x = x_coordinate
		self.position.y = y_coordinate
		moved = true
	elif state == "active" and moved:
		self.position.x = start_x
		self.position.y = start_y
		moved = false