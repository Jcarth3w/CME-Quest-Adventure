extends TextureButton

@export var clickable_name : String
@export var clickable_sprite : Texture
@export var scene_path : String

func _ready():
	texture_normal = clickable_sprite

func _on_pressed():
	var new_scene = load(scene_path)
	get_tree().change_scene_to_packed(new_scene)
	
	
