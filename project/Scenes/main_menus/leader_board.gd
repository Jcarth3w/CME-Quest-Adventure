extends Node2D



func _ready():
	for child in get_children():
		if child is Button:
			child.pressed.connect(on_scenario_pressed.bind(child))


func on_scenario_pressed(button) -> void:
	match button.get_name():
		StringName("Scenario1Button"):
			$Scenario1Times.visible = true
		StringName("Scenario2Button"):
			$Scenario2Times.visible = true
