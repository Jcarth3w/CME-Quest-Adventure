extends MiniGame


var answers: Dictionary = {}
var completed = []


func _ready():
	answers["andragogy"] = $Andragogy
	answers["social learning"] = $SocialLearning
	answers["cognitivism"] = $Cognitivism
	answers["constructivism"] = $Constructivism
	answers["experiential learning"] = $ExperientialLearning
	check_completed()
	for word in completed:
		if word in answers:
			answers.get(word).texture = load("res://Assets/Crossword_Assets/" + word + ".png")
			answers.erase(word)


func check_completed():
	if FileAccess.file_exists("res://Scenes/mini_games/Crossword_Puzzle/saved_puzzle.txt"):
		var completed_words = load_state().split("\n")
		completed = completed_words


func _on_exit_button_pressed():
	save_state(completed)
	get_tree().get_root().get_node("Scenario1").get_node("Room2").resume_game()
	queue_free()


func _on_check_button_pressed():
	check_answer()
	check_win()


func check_answer():
	if $UserText.text in answers: 
		print("res://Assets/Crossword_Assets/" + $UserText.text.capitalize() + ".png")
		answers.get($UserText.text).texture = load("res://Assets/Crossword_Assets/" + $UserText.text.to_lower() + ".png")
		answers.erase($UserText.text)
		completed.append($UserText.text)
	$UserText.clear()


func check_win():
	if answers.size() == 0:
		$Label.text = "You win!"
		await get_tree().create_timer(1.5).timeout
		finished.emit()
		queue_free()


func save_state(key):
	var save_file = FileAccess.open("res://Scenes/mini_games/Crossword_Puzzle/saved_puzzle.txt", FileAccess.WRITE)
	for word in key:
		save_file.store_string(word + "\n") 
	save_file.close()


func load_state():
	var save_file = FileAccess.open("res://Scenes/mini_games/Crossword_Puzzle/saved_puzzle.txt", FileAccess.READ)
	return save_file.get_as_text()
