extends Node

signal send_username
var title : String
var description : String

func _ready():
	$Label.text = title
	$ScenarioLabel2.text = description


func _on_continue_button_pressed():
	send_username.emit($NameField.text)
	queue_free()


func _on_name_field_text_changed(_new_text):
	if not $NameField.text.is_empty():
		$ContinueButton.disabled = false
		$ContinueButton.text = "Begin"
	else:
		$ContinueButton.disabled = true
		$ContinueButton.text = "Please Insert Username"
