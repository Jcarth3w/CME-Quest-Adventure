extends MiniGame

var answers: Dictionary = {}


func _ready():
	answers["andragogy"] = $Word1
	answers["social learning"] = $Word2
	answers["cognitivism"] = $Word3
	answers["constructivism"] = $Word4
	answers["experiential learning"] = $Word5


func _on_exit_button_pressed():
	visible = false


func _on_check_button_pressed():
	check_answer()
	check_win()


func check_answer():
	if $UserText.text in answers: 
		# answers.get($UserText.text).visible = true
		answers.get($UserText.text).modulate = Color(0, 0, 0)
		answers.erase($UserText.text)
		print(answers.size())
	$UserText.clear()


func check_win():
	if answers.size() == 0:
		print("You win!")
		return true

