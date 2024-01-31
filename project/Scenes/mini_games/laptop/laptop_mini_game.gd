extends MiniGame

var username = "john"
var password = "123"
var screens = []
var file_contents = {}
var current_file


func _ready() -> void:
	screens.append($Login)
	screens.append($Files)
	
	for child in $Files.get_children():
		if child is TextureButton:
			child.pressed.connect(_on_file_press.bind(child))
	
	file_contents = {$Files/File1 : "one.txt", $Files/File2 : "two.txt",
	$Files/File3 : "three.txt", $Files/File4 : "four.txt" }


func change_screen(new_screen) -> void:
	new_screen.visible = true
	for screen in screens:
		if screen != new_screen:
			screen.visible = false


func change_file_reader(text_file) -> void:
	if FileAccess.file_exists("res://Scenes/mini_games/laptop/" + text_file):
		var save_file = FileAccess.open("res://Scenes/mini_games/laptop/" + text_file, FileAccess.READ)
		$Files/FileText.text = save_file.get_as_text()


func _on_power_button_pressed() -> void:
	if check_correct():
		get_parent().get_node("printed").visible = true
	queue_free()


func _on_button_pressed() -> void:
	if $Login/Username.text == username and $Login/Password.text == password:
		change_screen($Files)
	else:
		$Login/Feedback.visible = true


func _on_file_press(file) -> void:
	change_file_reader(file_contents.get(file))
	current_file = file


func _on_print_pressed():
	if check_correct():
		print_paper()
	else:
		$Files/PrintFeedback.text = "INCORRECT FILE: PRINT FAILED"
		$Files/PrintFeedback.visible = true
	

func print_paper() -> void:
	var printed = load("res://Clickables/pickup/pickup.tscn")
	var print_inst = printed.instantiate()
	print_inst.global_position = get_parent().get_node("PrintPosition").global_position
	print_inst.texture_normal = load("res://Assets/Sprites/generic_items/genericItem_color_037.png")
	print_inst.name = "printed"
	print_inst.visible = false
	get_parent().add_child(print_inst)
	get_parent().connect_clickable(print_inst)
	$Files/PrintFeedback.text = "CORRECT FILE: PRINT SUCCESSFUL"
	$Files/PrintFeedback.visible = true


func check_correct():
	if current_file != $Files/File4:
		return false
	else:
		return true

