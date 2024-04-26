class_name StaticScene
extends CanvasLayer

signal finished
signal exited

func _on_button_pressed():
	finished.emit()
	queue_free()
