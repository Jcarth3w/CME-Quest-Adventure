extends Node2D

signal finished
signal exited

func _on_exit_pressed():
	finished.emit()
	await get_tree().create_timer(0.5).timeout
	queue_free()
