class_name StaticSceneButton
extends Clickable

@export var scene_path : String

func _ready() -> void:
	connect_mouse()


func action():
	var scene_load = load(scene_path)
	var scene = scene_load.instantiate()
	scene.finished.connect(_on_finished)
	if scene.has_signal("exited"):
		scene.exited.connect(_on_exited)
	get_parent().add_child(scene)
	get_parent().pause_room()

func _on_finished():
	get_parent().resume_room()

func _on_exited():
	on_mouse_exited()
