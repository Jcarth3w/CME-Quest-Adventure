extends TextureButton

signal resume
@export var scene_path : String


func _process(_delta):
	if not has_node("whiteboard") :
		resume.emit()

func _on_pressed():
	spawn_scene()

func spawn_scene():
	var scene_load = load(scene_path)
	var scene = scene_load.instantiate()
	add_child(scene)
