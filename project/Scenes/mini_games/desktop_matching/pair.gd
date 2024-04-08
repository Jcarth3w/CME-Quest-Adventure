extends Node2D

@export var card_1: TextureButton
@export var card_2: TextureButton

var is_matched = false

signal flip

func _ready():
	for child in get_children():
		child.pressed.connect(on_flip.bind(child))


func check_pair() -> void:
	if card_1.is_flipped == true && card_2.is_flipped == true:
		is_matched = true


func on_flip(card):
	card.action()
	flip.emit()


func reset_pair():
	card_1.reset()
	card_2.reset()

func disable_children():
	for child in get_children():
		child.disabled = true


func enable_children():
	for child in get_children():
		child.disabled = false
