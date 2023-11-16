class_name Clickable
extends TextureButton

var state := "active"


func pause():
	state = "inactive"

func resume():
	state = "active"
