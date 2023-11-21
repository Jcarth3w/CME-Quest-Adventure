extends Sprite2D

@export var winning_combo: Array[TextureButton]

var max_shreds = 3
var shreds = []
var current_shred = 0


func add_shred(shred) -> void:
	if current_shred < max_shreds:
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


func check_win() -> bool:
	if shreds == winning_combo:
		return true
	reset_shreds()
	return false


func reset_shreds() -> void:
	shreds[0].reset_shreds()
	shreds[1].reset_shreds()
	shreds[2].reset_shreds()
	shreds.clear()
	current_shred = 0
