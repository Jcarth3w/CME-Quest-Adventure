extends TextureButton

@export var clickable_name : String
@export var clickable_sprite : Texture
@export var Xcoordinate : int
@export var Ycoordinate : int

func _ready():
	texture_normal = clickable_sprite

func _on_pressed():
	self.position.x = Xcoordinate
	self.position.y = Ycoordinate

