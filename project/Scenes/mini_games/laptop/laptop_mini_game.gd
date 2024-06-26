extends MiniGame

var username = "cmeadmin"
var password = "Complianc3"
var screens = []
var file_contents = {}
var current_file
var file_printed = false


func _ready() -> void:
	screens.append($Login)
	screens.append($Files)

	for child in $Files.get_children():
		if child is TextureButton:
			child.pressed.connect(on_file_press.bind(child))

	file_contents = {$Files/File1 : "one.txt", $Files/File2 : "two.txt",
	$Files/File3 : "three.txt", $Files/File4 : "four.txt", $Files/File5 : "five.txt",
	$Files/File6 : "six.txt"}


func change_screen(new_screen) -> void:
	new_screen.visible = true
	for screen in screens:
		if screen != new_screen:
			screen.visible = false


func change_file_reader(text_file) -> void:
	if FileAccess.file_exists("res://Scenes/mini_games/laptop/" + text_file):
		var save_file = FileAccess.open("res://Scenes/mini_games/laptop/" + text_file, FileAccess.READ)
		$Files/FileText.text = save_file.get_as_text()


func on_power_button_pressed() -> void:
	if file_printed:
		get_parent().get_node("printed").visible = true
	get_parent().resume_room()
	get_parent().get_node("Laptop").on_mouse_exited()
	queue_free()


func on_button_pressed() -> void:
	if $Login/Username.text == username and $Login/Password.text == password:
		change_screen($Files)
	else:
		$Login/Feedback.visible = true


func on_file_press(file) -> void:
	change_file_reader(file_contents.get(file))
	current_file = file


func on_print_pressed():
	if check_correct():
		print_paper()
	else:
		$Files/Print.modulate = Color(1.0, 0, 0)
		$Files/PrintFeedback.text = "PRINT FAILED"
		$Files/PrintFeedback.visible = true
		await get_tree().create_timer(1.0).timeout
		$Files/Print.modulate = Color(1.0, 1.0, 1.0)
		$Files/PrintFeedback.text = ""
		


func print_paper() -> void:
	var printed = load("res://Clickables/pickup/pickup.tscn")
	var print_inst = printed.instantiate()
	print_inst.global_position = get_parent().get_node("PrintPosition").global_position
	print_inst.texture_normal = load("res://Assets/Sprites/Iteration 3 assets/PrintedDocument.png")
	print_inst.name = "printed"
	print_inst.scale = Vector2(.15, .15)
	print_inst.visible = false
	get_parent().add_child(print_inst)
	get_parent().connect_clickable(print_inst)
	$Files/Print.modulate = Color(0, 1.0, 0)
	$Files/PrintFeedback.text = "PRINT SUCCESSFUL"
	$Files/PrintFeedback.visible = true
	file_printed = true
	finished.emit()


func check_correct():
	if current_file != $Files/File4:
		return false
	return true
