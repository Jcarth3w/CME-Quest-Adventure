extends Clickable

@export var Xcoordinate : int
@export var Ycoordinate : int
var start_x
var start_y
var moved = false

func _ready():
	start_x = global_position.x
	start_y = global_position.y

func _on_pressed():
	if state == "active" and not moved:
		self.position.x = Xcoordinate
		self.position.y = Ycoordinate
		moved = true
	elif state == "active" and moved:
		self.position.x = start_x
		self.position.y = start_y
		moved = false

