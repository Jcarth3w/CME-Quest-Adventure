extends CanvasLayer

signal pause
signal resume


func _ready() -> void:
	pause.emit()


func _on_button_pressed() -> void:
	get_tree().quit()


func _on_resume_pressed() -> void:
	resume.emit()
	queue_free()
