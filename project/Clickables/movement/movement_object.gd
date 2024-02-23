extends Clickable


@export var x_coordinate : int
@export var y_coordinate : int

var start_x
var start_y
var moved = false


func _ready():
	start_x = global_position.x
	start_y = global_position.y
	connect_mouse()


func action():
	if not moved:
		self.position.x = x_coordinate
		self.position.y = y_coordinate
		moved = true
	else:
		self.position.x = start_x
		self.position.y = start_y
		moved = false
