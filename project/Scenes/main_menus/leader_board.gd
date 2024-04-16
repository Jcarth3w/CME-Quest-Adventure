extends Node2D

var time_slots1 = []
var time_slots2 = []

var parsed_data = {}

var scenario_num = 1

func _ready():
	for child in $Scenario1Times.get_children():
		if child.has_node("Username") and child.has_node("Time"):
			time_slots1.append(child)
			
	for child in $Scenario2Times.get_children():
		if child.has_node("Username") and child.has_node("Time"):
			time_slots2.append(child)
	
func organize_data(raw_string):
	var json_array = JSON.parse_string(raw_string)
	for username in json_array.keys():
		var records = json_array[username]
		parsed_data[username] = records[0]["time"]
	return parsed_data


func populate_leader_board():
	var counter = 0
	if scenario_num == 1:
		for username in parsed_data.keys():
			time_slots1[counter].get_node("Username").text = username
			time_slots1[counter].get_node("Time").text =  parsed_data[username]
			counter += 1
	elif scenario_num == 2:
		for username in parsed_data.keys():
			time_slots2[counter].get_node("Username").text = username
			time_slots2[counter].get_node("Time").text =  parsed_data[username]
			counter += 1


func _on_back_button_pressed():
	visible = false


func _on_scenario_1_button_pressed():
	parsed_data.clear()
	if $Scenario1Times.visible == false:
		organize_data(await $DBoperations.make_get_request(1))
		scenario_num = 1
		populate_leader_board()
		$Scenario1Times.visible = true
		$Scenario2Times.visible = false


func _on_scenario_2_button_pressed():
	parsed_data.clear()
	if $Scenario2Times.visible == false:
		organize_data(await $DBoperations.make_get_request(2))
		scenario_num = 2
		populate_leader_board()
		$Scenario1Times.visible = false
		$Scenario2Times.visible = true
