extends Node2D

signal finished

var answer = "Health"

func _on_exit_pressed():
	get_parent().resume_room()
	queue_free()


func _on_line_edit_text_submitted(new_text):
	if new_text.to_lower() == answer.to_lower():
		$RoomUnlocked.visible = true
		get_parent().unlock(2)
		finished.emit()
		await get_tree().create_timer(1).timeout
		queue_free()
