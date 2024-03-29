extends MiniGame


func _ready():
	for child in get_children():
		if child.has_method("gathered_data"):
			child.gathered_data().connect(on_drag_and_drop.bind(child))


func on_drag_and_drop(drop):
	drop.action()
