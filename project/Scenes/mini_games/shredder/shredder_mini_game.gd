extends MiniGame

func _ready():
	for child in get_children():
		if child.has_method("reset_shred"):
			child.pressed.connect(on_shred_press.bind(child))


func on_shred_press(shred):
	if $ClipBoard.shreds.find(shred) == -1:
		$ClipBoard.add_shred(shred)


func _on_check_bttn_pressed():
	check_bttn_pressed()

func check_bttn_pressed():
	if $ClipBoard.check_win():
		$CheckBttn.texture_normal = load("res://Assets/Sprites/Iteration 3 assets/Green button.png")
		$Label.set_text("Correct!")
		finished.emit()
		await get_tree().create_timer(1).timeout
		queue_free()
	else:
		$CheckBttn.texture_normal = load("res://Assets/Sprites/Iteration 3 assets/Red Button.png")
		await get_tree().create_timer(1).timeout
		$CheckBttn.texture_normal = load("res://Assets/Sprites/Iteration 3 assets/Blue button.png")
		
