extends CanvasLayer

signal pause
signal resume


func _ready() -> void:
	pause.emit()


func _on_button_pressed() -> void:
	var file = FileAccess.open("res://Scenes/mini_games/Crossword_Puzzle/saved_puzzle.txt", FileAccess.WRITE)
	file.store_string("")
	get_tree().quit()


func _on_resume_pressed() -> void:
	resume.emit()
	queue_free()
