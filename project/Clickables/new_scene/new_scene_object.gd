class_name NewSceneClickable
extends Clickable

signal scene_changed
@export var scene_path: String
@export var prize_texture: Texture
@export var prize_name: String
var finished = false

func _ready() -> void:
	connect_mouse()


func action():
	if finished == false:
		var scene = load(scene_path)
		if scene != null:
			var scene_inst = scene.instantiate()
			get_parent().add_child(scene_inst)
			scene_inst.finished.connect(_on_finished)
			get_parent().pause_room()


func _on_finished() -> void:
	get_parent().resume_room()
	get_parent().send_sound(sound)
	finished = true
	if prize_texture != null:
		get_parent().give_item(prize_name, prize_texture)
