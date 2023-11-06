extends Node2D

var FunctionActive = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if FunctionActive == false:
		check_win()

func check_win():
	if $File1/Label.text == "File1":
		FunctionActive = true
		Win()
	if $File2/Label.text == "File2":
		FunctionActive = true
		DisplayIncorrect()

func Win():
	$File1/Label.text = "Congratulations!"
	await get_tree().create_timer(3).timeout
	get_tree().change_scene_to_file("res://Scenes/Room.tscn")
	FunctionActive = false

func DisplayIncorrect():
	$File1/Label.text = "Incorrect."
	$File2/Label.text = "2"
	await get_tree().create_timer(2).timeout
	$File1/Label.text = "Find the promotional Folder"
	FunctionActive = false
