extends MiniGame

@onready var files = [$File1, $File2, $File3, $File4, $File5]
@onready var room = get_tree().get_root().get_node("Room")

var current_file = 0
# Called every frame. 'delta' is the elapsed time since the previous frame.

func check_win(file_name):
	if file_name == "File4":
		Win()
	else:
		DisplayIncorrect()

func Win():
	$Check.text = "Congratulations!"
	await get_tree().create_timer(3).timeout
	room.state = "active"
	finished.emit()
	queue_free()
	

func DisplayIncorrect():
	$Check.text = "Incorrect."
	await get_tree().create_timer(2).timeout
	$Check.text = "Find the promotional Folder"


func _on_previous_pressed():
	if current_file > 0:
		files[current_file].global_position = $OffLeft.global_position
		files[current_file - 1].global_position = $Center.global_position
		current_file -= 1


func _on_next_pressed():
	if current_file < 4:
		files[current_file].global_position = $OffRight.global_position
		files[current_file + 1].global_position = $Center.global_position
		current_file += 1
