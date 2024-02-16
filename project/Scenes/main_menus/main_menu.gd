extends CanvasLayer

var scenario1_path = "res://Scenes/scenarios/scenario_1.tscn"

func _on_start_button_pressed():
	get_tree().change_scene_to_file(scenario1_path)


func _on_quit_button_pressed():
	get_tree().quit()
