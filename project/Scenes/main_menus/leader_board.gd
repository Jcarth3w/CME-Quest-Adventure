extends Node2D

var times = []
var users = []

func _ready():
	organize_data(await $DBoperations.make_get_request())


func organize_data(raw_string):
	var json_array = JSON.parse_string(raw_string)
	var organized = {}

	for username in json_array.keys():
		for entry in json_array[username]:
			var time = entry["time"]
			var scenario_num = entry["scenario"]

			if username not in organized:
				organized[username] = {}

			if scenario_num not in organized[username]:
				organized[username][scenario_num] = time
				times.append(time)
				users.append(users)

			else:
				if time > organized[username][scenario_num]:
					organized[username][scenario_num] = time
					times.append(time)
					users.append(users)
	print(organized)
	return organized


func populate_leader_board(scenario_number):
	if scenario_number == 1:
		var i = 0;
		for child in $Scenario1Times.get_children():
			if i < times.size():
				if child.has_node("Username") and child.has_node("Time"):
					child.get_node("Username").text = users[i]
					child.get_node("Time").text =  times[i]
					i = i+1
	elif scenario_number == 2:
		var i = 0;
		for child in $Scenario2Times.get_children():
			if i < times.size():
				if child.has_node("Username") and child.has_node("Time"):
					child.get_node("Username").text = users[i]
					child.get_node("Time").text =  times[i]
					i = i+1


func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/main_menus/main_menu.tscn")


func _on_scenario_1_button_pressed():
	if $Scenario1Times.visible == false:
		populate_leader_board(1)
		$Scenario1Times.visible = true
		$Scenario2Times.visible = false


func _on_scenario_2_button_pressed():
	pass