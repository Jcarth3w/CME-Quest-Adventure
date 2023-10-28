extends Sprite2D

signal clicked

@onready var parent = get_tree().get_root().get_node("MiniGame")
var isFlipped = false
var numbersOfClicks = 0

@export var cardImage : Texture

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _input(event):
	if parent.flipped_count < 2:
		if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			if get_rect().has_point(to_local(event.position)):
				set_texture(cardImage)
				print(parent)
				parent.flipped_count += 1
				print(str(parent.flipped_count))
				_on_card_pressed()
				clicked.emit(isFlipped)
			

func _on_card_pressed():
	if not isFlipped:
		isFlipped = true

		
func reset():
	isFlipped = false
	set_texture(preload("res://Assets/Sprites/Objects/genericItem_color_037.png"))
	
