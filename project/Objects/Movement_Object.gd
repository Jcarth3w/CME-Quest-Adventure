extends TextureButton

@export var clickable_name : String
@export var clickable_sprite : Texture
@export var Xcoordinate : int
@export var Ycoordinate : int
var start_x
var start_y
var moved = false


@onready var room = get_tree().get_root().get_node("Room")

func _ready():
	texture_normal = clickable_sprite
	start_x = global_position.x
	start_y = global_position.y

func _on_pressed():
	if room.state == "active" and not moved:
		self.position.x = Xcoordinate
		self.position.y = Ycoordinate
		moved = true
	elif room.state == "active" and moved:
		self.position.x = start_x
		self.position.y = start_y
		moved = false

