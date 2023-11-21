class_name Clickable
extends TextureButton

var state := "active"


func pause() -> void:
	state = "inactive"

func resume() -> void:
	state = "active"
