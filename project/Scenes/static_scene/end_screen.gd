extends CanvasLayer

var username
var scen_num
var time_val

# Called when the node enters the scene tree for the first time.
func _ready():
	$User.text = username
	$ScenNum.text = str(scen_num)
	$TimeVal.text = time_val

