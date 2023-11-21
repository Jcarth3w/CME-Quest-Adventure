class_name NewSceneClickable
extends Clickable

signal scene_changed
@export var scene_path: String
@export var mini_game_prize: Pickup
var finished = false


func _ready() -> void:
	if mini_game_prize == null:
		print("NewScene: I expected a mini game prize")


func _on_pressed() -> void:
	if state == "active" and finished == false:
		var scene = load(scene_path)
		if scene != null:
			var scene_inst = scene.instantiate()
			owner.add_child(scene_inst)
			scene_inst.finished.connect(_on_finished)
			scene_changed.emit("pause")


func _on_finished() -> void:
	scene_changed.emit("resume")
	finished = true
	if mini_game_prize != null:
		mini_game_prize.inventory.add_item(mini_game_prize.name, mini_game_prize.texture_normal)
