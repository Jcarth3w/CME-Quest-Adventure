extends Clickable

@export var room_number : int

func action() -> void:
	get_parent().unlock(room_number)
	queue_free()
