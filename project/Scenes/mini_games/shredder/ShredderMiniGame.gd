extends MiniGame

func _ready():
	for child in get_children():
		if child.has_method("reset_shred"):
			child.pressed.connect(on_shred_press.bind(child))

func on_shred_press(shred):
	if $ClipBoard.shreds.find(shred) == -1:
		$ClipBoard.add_shred(shred)

func _on_check_bttn_pressed():
	if $ClipBoard.check_win():
		$CheckBttn/Label.text = "You win!"
		await get_tree().create_timer(1).timeout
		finished.emit()
		queue_free()
