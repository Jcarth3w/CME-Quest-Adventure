extends MiniGame


var answers: Dictionary = {}
var completed = []


func _ready():
	answers["Andragogy"] = $Andragogy
	answers["Social Learning"] = $SocialLearning
	answers["Cognitivism"] = $Cognitivism
	answers["Constructivism"] = $Constructivism
	answers["Experiential Learning"] = $ExperientialLearning
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
	get_tree().get_root().get_node("Scenario1").get_node("Room2").resume_room()
	queue_free()


func _on_check_button_pressed():
	check_answer()
	check_win()


func check_answer():
	var guess = space_to_underscore($UserText.text).capitalize()
	print(guess)
	if guess in answers:
		$CheckButton.texture_normal = load("res://Assets/Sprites/Iteration 3 assets/Green button.png")
		answers.get(guess).texture = load("res://Assets/Crossword_Assets/" + guess + ".png")
		answers.erase(guess)
		completed.append(guess)
		$UserText.clear()
		await get_tree().create_timer(1).timeout
		$CheckButton.texture_normal = load("res://Assets/Sprites/Iteration 3 assets/Blue button.png")
	else: 
		$CheckButton.texture_normal = load("res://Assets/Sprites/Iteration 3 assets/Red Button.png")
		await get_tree().create_timer(1).timeout
		$CheckButton.texture_normal = load("res://Assets/Sprites/Iteration 3 assets/Blue button.png")

func check_win():
	if answers.size() == 0:
		$Label.text = "You win!"
		finished.emit()
		await get_tree().create_timer(1.5).timeout
		queue_free()


func save_state(key):
	var save_file = FileAccess.open("res://Scenes/mini_games/Crossword_Puzzle/saved_puzzle.txt", FileAccess.WRITE)
	for word in key:
		save_file.store_string(word + "\n")
	save_file.close()


func load_state():
	var save_file = FileAccess.open("res://Scenes/mini_games/Crossword_Puzzle/saved_puzzle.txt", FileAccess.READ)
	return save_file.get_as_text()


func space_to_underscore(text):
	return text.replace(" ", "_")
