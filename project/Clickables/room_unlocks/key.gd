extends Clickable

@export var room_number : int

func action() -> void:
	get_parent().key_found(room_number)
	queue_free()
