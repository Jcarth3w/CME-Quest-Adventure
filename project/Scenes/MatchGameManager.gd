extends Node2D

signal not_matching
var base_image = preload("res://Assets/Sprites/Objects/genericItem_color_037.png")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _check_match(sprite_path1, sprite_path2):
	if sprite_path1 != sprite_path2:
		not_matching.emit(base_image)
		
		
		
		
	
