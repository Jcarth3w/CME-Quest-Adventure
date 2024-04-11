extends Node2D

signal finished

var answer = "CME"

func _on_exit_pressed():
	get_parent().resume_room()
	queue_free()


func _on_line_edit_text_submitted(new_text):
	if new_text == answer:
		$RoomUnlocked.visible = true
		finished.emit()
		await get_tree().create_timer(1).timeout
		queue_free()
