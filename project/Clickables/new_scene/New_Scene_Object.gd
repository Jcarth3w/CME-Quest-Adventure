class_name NewSceneClickable
extends Clickable

signal scene_changed
@export var scene_path: String
@export var prize_texture: Texture
@export var prize_name: String
var finished = false


func action():
	if finished == false:
		var scene = load(scene_path)
		if scene != null:
			var scene_inst = scene.instantiate()
			owner.add_child(scene_inst)
			scene_inst.finished.connect(_on_finished)
			scene_changed.emit("pause")


func _on_finished() -> void:
	scene_changed.emit("resume")
	finished = true
	get_parent().give_item(prize_name, prize_texture)
