extends MiniGame

func _on_useless_folder_pressed():
	$RandomFile.visible = true
	$RandomExit.visible = true


func _on_usb_folder_pressed():
	$USBContents.visible = true
	$USBExit.visible = true


func _on_word_app_pressed():
	$TextEditLaptop.visible = true
	$TextEditExit.visible = true


func _on_text_edit_exit_pressed():
	$TextEditLaptop.visible = false
	$TextEditExit.visible = false


func _on_usb_exit_pressed():
		$USBContents.visible = false
		$USBExit.visible = false


func _on_random_exit_pressed():
		$RandomFile.visible = false
		$RandomExit.visible = false


func _on_text_edit_laptop_completed():
	finished.emit()
	await get_tree().create_timer(1).timeout
	queue_free()


func _on_exit_pressed():
	queue_free()
