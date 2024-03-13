extends CanvasLayer

var scenario_select = "res://Scenes/main_menus/Scenario_Select.tscn"
var leaderboard = "res://Scenes/main_menus/Leader_Board.tscn"

func _on_start_button_pressed():
	get_tree().change_scene_to_file(scenario_select)


func _on_quit_button_pressed():
	get_tree().quit()


func _on_leader_board_button_pressed():
	get_tree().change_scene_to_file(leaderboard)
