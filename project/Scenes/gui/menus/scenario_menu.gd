extends Node

signal send_username


func _on_continue_button_pressed():
	send_username.emit($NameField.text)
	queue_free()


func _on_name_field_text_changed(new_text):
	if not $NameField.text.is_empty():
		$ContinueButton.disabled = false
		$ContinueButton.text = "Begin"
	else:
		$ContinueButton.disabled = true
		$ContinueButton.text = "Please Insert Username"
