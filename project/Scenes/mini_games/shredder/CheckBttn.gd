extends TextureButton

@onready var clip_board = get_tree().get_root().get_node("Room/ShredderMiniGame/ClipBoard")
@onready var room = get_tree().get_root().get_node("Room")


func _on_pressed() -> void:
	if clip_board.check_win():
		$Label.text = "You win!"
		await get_tree().create_timer(1).timeout
		room.state = "active"
		owner.queue_free()
