extends Node2D

signal completed

@export var answers = {}
var correct_answers = 0
var complete = false


func _ready():
	for child in get_children():
		if child is LineEdit:
			child.text_submitted.connect(on_text_submit.bind(child))


func on_text_submit(player_answer, text_box):
	if player_answer.to_lower() == answers.get(String(text_box.name)).to_lower():
		text_box.modulate = Color.GREEN
		text_box.editable = false
		correct_answers += 1
		if correct_answers == answers.size():
			complete = true
			completed.emit()
	else:
		text_box.modulate = Color.RED
		text_box.text = ""
