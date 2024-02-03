extends ColorRect

signal cleared


func _on_timer_timeout():
	cleared.emit()
	queue_free()
