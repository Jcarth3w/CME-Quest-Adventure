extends StaticScene

signal room

func _ready() -> void:
	for child in get_children():
		if child is Clickable:
			get_parent().connect_clickable(child)



