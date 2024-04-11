extends CanvasLayer

func _ready():
	$Label.text = get_parent().objectives_label
