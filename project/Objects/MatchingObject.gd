extends Sprite2D

signal clicked
var other_image1 = preload("res://Assets/Sprites/Objects/genericItem_color_007.png")
var other_image2 = preload("res://Assets/Sprites/Objects/genericItem_color_008.png")
var other_image3 = preload("res://Assets/Sprites/Objects/genericItem_color_009.png")
var other_image4 = preload("res://Assets/Sprites/Objects/genericItem_color_010.png")
var other_image5 = preload("res://Assets/Sprites/Objects/genericItem_color_011.png")
var other_image6 = preload("res://Assets/Sprites/Objects/genericItem_color_012.png")
var other_image7 = preload("res://Assets/Sprites/Objects/genericItem_color_013.png")
var other_image8 = preload("res://Assets/Sprites/Objects/genericItem_color_014.png")
var isFlipped = false
var isMatched = false
var cardImage : Texture
# Called when the node enters the scene tree for the first time.
func _ready():
	$Card4.texture = other_image1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if get_rect().has_point(to_local(event.position)):
			self.set_texture(other_image1)
			clicked.emit(cardImage)
			

func _on_card_pressed():
	if not isFlipped and not isMatched:
		isFlipped = true
		$TextureRect.visible = true
		check_match(self)
		
		
func reset():
	isFlipped = false
	isMatched = false
	$TextureRect.visible = false
	
	
	
func check_match(card):
	if previous_flipped_card and previous_flipped_card != card:
		if previous_flipped_card.cardImage == card.cardImage:
			previous_flipped_card.isMatched = true
			card.isMatched = true
		else:
			# Delay before flipping back unmatched cards
			await
		# Reset the previous flipped card
		previous_flipped_card = null
	else:
		previous_flipped_card = card
		
		

func _not_matching(base_sprite):
	
	self.set_texture(base_sprite)
