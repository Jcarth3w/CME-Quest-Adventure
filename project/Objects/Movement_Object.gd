extends TextureButton

@export var clickable_name : String
@export var clickable_sprite : Texture
@export var Xcoordinate : int
@export var Ycoordinate : int

@onready var room = get_tree().get_root().get_node("Room")

func _ready():
	texture_normal = clickable_sprite

func _on_pressed():
	if room.state == "active":
		self.position.x = Xcoordinate
		self.position.y = Ycoordinate

