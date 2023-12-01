class_name Pickup
extends Clickable

func _on_pressed() -> void:
	pressed()


func pressed():
	if state == "active":
		owner.give_item(name, texture_normal)
		queue_free()
