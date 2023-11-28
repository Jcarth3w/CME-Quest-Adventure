extends MiniGame


var files
var current_file = 0


func _ready():
	files = [$File1, $File2, $File3, $File4, $File5]
	for file in files:
		if file.name == "File1":
			file.global_position = $Center.global_position
		else:
			file.global_position = $OffLeft.global_position

		file.pressed.connect(on_file_press.bind(file))


func on_file_press(file):
	if file.global_position == $Center.global_position:
		if file.name == "File4":
			$Check.text = "Congratulations!"
			await get_tree().create_timer(1).timeout
			finished.emit()
			queue_free()
		else:
			$Check.text = "Incorrect."
			await get_tree().create_timer(1).timeout
			$Check.text = "Find the promotional Folder"


func _on_previous_pressed() -> void:
	if current_file > 0:
		files[current_file].global_position = $OffLeft.global_position
		files[current_file - 1].global_position = $Center.global_position
		current_file -= 1


func _on_next_pressed() -> void:
	if current_file < 4:
		files[current_file].global_position = $OffRight.global_position
		files[current_file + 1].global_position = $Center.global_position
		current_file += 1