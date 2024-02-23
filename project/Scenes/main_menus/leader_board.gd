extends Node2D

var times = []

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
				$Scenario1Times.visible = true
		"Scenario2Button":
			if $Scenario2Times.visible == true:
				$Scenario2Times.visible = false
			else:
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
		times.append(time_value)
	
	print(times)
