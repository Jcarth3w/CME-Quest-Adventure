extends MiniGame

var current_file = 0

@onready var files = [$File1, $File2, $File3, $File4, $File5]


func check_win(file_name) -> void:
	if file_name == "File4":
		win()
	else:
		display_incorrect()


func win() -> void:
	$Check.text = "Congratulations!"
	await get_tree().create_timer(1).timeout
	finished.emit()
	queue_free()


func display_incorrect() -> void:
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