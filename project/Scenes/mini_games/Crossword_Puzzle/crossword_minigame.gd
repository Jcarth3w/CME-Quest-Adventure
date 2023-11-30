extends MiniGame

var answers: Dictionary = {}
var completed = []
#var resource_script = preload("res://Scenes/mini_games/Crossword_Puzzle/save_puzzle.gd").new()


func _ready():
	answers["andragogy"] = $Word1
	answers["social learning"] = $Word2
	answers["cognitivism"] = $Word3
	answers["constructivism"] = $Word4
	answers["experiential learning"] = $Word5
	check_completed()
	for word in completed:
		if word in answers:
			answers.get(word).modulate = Color(0, 0, 0)
			answers.erase(word)
	print(load_state())


func check_completed():
	var completed_words = load_state().split("\n")
	completed = completed_words


func _on_exit_button_pressed():
	save_state(completed)
	queue_free()


func _on_check_button_pressed():
	check_answer()
	check_win()


func check_answer():
	if $UserText.text in answers: 
		# answers.get($UserText.text).visible = true
		answers.get($UserText.text).modulate = Color(0, 0, 0)
		answers.erase($UserText.text)
		completed.append($UserText.text)
		#resource_script.add_word($UserText.text)
		#print(resource_script.saved_answers)
	$UserText.clear()


func check_win():
	if answers.size() == 0:
		print("You win!")
		return true


func save_state(key):
	var save_file = FileAccess.open("res://Scenes/mini_games/Crossword_Puzzle/saved_puzzle.txt", FileAccess.WRITE)
	for word in key:
		save_file.store_string(word + "\n")
	save_file.close()


func load_state():
	var save_file = FileAccess.open("res://Scenes/mini_games/Crossword_Puzzle/saved_puzzle.txt", FileAccess.READ)
	return save_file.get_as_text()
