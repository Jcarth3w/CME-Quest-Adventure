extends CanvasLayer


func _on_start_button_pressed():
	$Scenario_Select.visible = true


func _on_quit_button_pressed():
	get_tree().quit()


func _on_leader_board_button_pressed():
	$Leader_Board.visible = true

func _on_credits_button_pressed():
	$Credits_Board.visible = true
