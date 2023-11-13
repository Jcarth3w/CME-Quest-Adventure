extends CanvasLayer

signal pause
signal resume

func _ready():
	pause.emit()

func _on_button_pressed():
	get_tree().quit()


func _on_resume_pressed():
	resume.emit()
	queue_free()
