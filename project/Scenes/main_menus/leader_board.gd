extends Node2D

var times = []
var users = []

func _ready():
	for child in get_children():
		if child is Button:
			child.pressed.connect(on_scenario_pressed.bind(child))
	$DBoperations.make_get_request()


func on_scenario_pressed(button) -> void:
	match button.name:
		"Scenario1Button":
			if $Scenario1Times.visible == true:
				$Scenario1Times.visible = false
			else:
				populate_leader_board(1)
				$Scenario1Times.visible = true
		"Scenario2Button":
			if $Scenario2Times.visible == true:
				$Scenario2Times.visible = false
			else:
				populate_leader_board(2)
				$Scenario2Times.visible = true
		_:
			pass


func _on_http_request_request_completed(result, response_code, headers, body):
	var raw_string = body.get_string_from_utf8()
	parseTimes(raw_string)


func parseTimes(raw_string):
	var json_array = JSON.parse_string(raw_string)
	for s in json_array:
		var time_value = s["time"]
		var user_value = s["username"]
		times.append(time_value)
		users.append(user_value)
		print(times)


func populate_leader_board(scenario_number):
	if scenario_number == 1:
		for child in $Scenario1Times.get_children():
			var i = 0;
			if child.has_node("Username") and child.has_node("Time"):
				print(times[i])
				child.get_node("Username").text = users[i]
				child.get_node("Time").text =  times[i]
				i = i+1
	elif scenario_number == 2:
		for child in $Scenario2Times.get_children():
			var i = 0;
			if child.has_node("Username") and child.has_node("Time"):
				child.get_node("Username").text = users[i]
				child.get_node("Time").text =  times[i]
				i = i+1
