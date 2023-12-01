extends Clickable


@export var scene_path : String

func _on_pressed():
	if state == "active":
		spawn_scene()

func spawn_scene():
	var scene_load = load(scene_path)
	var scene = scene_load.instantiate()
	scene.finished.connect(_on_finished)
	add_child(scene)
	owner.pause_game()

func _on_finished():
	owner.resume_game()
