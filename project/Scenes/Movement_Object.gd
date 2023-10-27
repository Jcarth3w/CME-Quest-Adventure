extends TextureButton

@export var clickable_name : String
@export var XCoordinate : int
@export var YCoordinate : int

func _on_pressed():
	self.position.x = XCoordinate
	self.position.y = YCoordinate
