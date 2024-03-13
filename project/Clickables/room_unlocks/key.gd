extends Clickable

@export var room_number : int

func _ready() -> void:
	connect_mouse()


func action() -> void:
	get_parent().unlock(room_number)
	queue_free()
