extends CanvasLayer

var title
var description

func _ready():
	$Label.text = title
	$ScenarioLabel.text = description

func _on_continue_button_pressed():
	queue_free()
