extends Timer


var ms = 0
var s = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if ms > 9:
		s += 1
		ms = 0
	
	$Label.text = str(s)
	print(str(s))
	

func _on_timeout():
	ms += 1
	
	pass # Replace with function body.
