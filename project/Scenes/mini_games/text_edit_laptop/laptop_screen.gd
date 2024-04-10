extends MiniGame

func _on_useless_folder_pressed():
	$RandomFile.visible = true


func _on_usb_folder_pressed():
	$USBContents.visible = true


func _on_word_app_pressed():
	$TextEditLaptop.visible = true
	$TextEditExit.visible = true


func _on_text_edit_exit_pressed():
	$TextEditLaptop.visible = false
	$TextEditExit.visible = false
