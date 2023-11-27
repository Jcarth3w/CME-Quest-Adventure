extends Sprite2D

const maxShreds = 3
var shreds = []
var current_shred = 0
@export var winning_combo: Array [TextureButton]


func add_shred(shred):
	if current_shred < maxShreds:
		current_shred += 1
		shreds.append(shred)
		shred.rotation_degrees = 0
		shred.scale = Vector2(1, .5)
		if current_shred == 1:
			shred.global_position = $Check1.global_position
		if current_shred == 2:
			shred.global_position = $Check2.global_position
		if current_shred == 3:
			shred.global_position = $Check3.global_position

func check_win():
	if shreds.size() == 3:
		if shreds == winning_combo:
			return true
		else:
			reset_shreds()
			return false

func reset_shreds():
	shreds[0].reset_shred()
	shreds[1].reset_shred()
	shreds[2].reset_shred()
	shreds.clear()
	current_shred = 0
	
