extends TextureButton

@export var clickable_name : String
@export var clickable_sprite : Texture
@export var scene_path : String

@onready var room = get_tree().get_root().get_node("Room")

func _ready():
	texture_normal = clickable_sprite

func _on_pressed():
	if room.state == "active":
		room.state = "inactive"
		var scene = load(scene_path)
		var scene_inst = scene.instantiate()
		room.add_child(scene_inst)
