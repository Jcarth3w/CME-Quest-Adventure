extends MiniGame


@export var file_textures: Array[Texture]

var files
var current_file = -1
var current_item
var correct_order = {}
var player_order = {}



func _ready():
	$FileFind/OffLeft.texture = file_textures[0]

	for slot in $OrganizeFiles/Slots.get_children():
		slot.gathered_data.connect(_on_drop_item.bind(slot))

	correct_order = {"Slot1" : $OrganizeFiles/Items/Item1,
					"Slot2" : $OrganizeFiles/Items/Item2,
					"Slot3" : $OrganizeFiles/Items/Item3,
					"Slot4" : $OrganizeFiles/Items/Item4,
					"Slot5" : $OrganizeFiles/Items/Item5,
					"Slot6" : $OrganizeFiles/Items/Item6,}



func _on_previous_pressed() -> void:
	previous_pressed()


func previous_pressed():
	if current_file > 1:
		current_file -= 1
		$FileFind/Center.texture_normal = file_textures[current_file]
		$FileFind/OffLeft.texture = file_textures[current_file + 1]
		$FileFind/OffRight.texture = file_textures[current_file -1]
	elif current_file == 1:
		current_file -= 1
		$FileFind/Center.texture_normal = file_textures[current_file]
		$FileFind/OffLeft.texture = file_textures[current_file + 1]
		$FileFind/OffRight.texture = null
	elif current_file == 0:
		current_file -= 1
		$FileFind/Center.texture_normal = null
		$FileFind/OffLeft.texture = file_textures[current_file + 1]
		$FileFind/OffRight.texture = null


func _on_next_pressed() -> void:
	next_pressed()


func next_pressed():
	if current_file >= -1 and current_file < 4:
		current_file += 1
		$FileFind/Center.texture_normal = file_textures[current_file]
		if current_file < 4:
			$FileFind/OffLeft.texture = file_textures[current_file + 1]
		else:
			$FileFind/OffLeft.texture = null
		if current_file > 0:
			$FileFind/OffRight.texture = file_textures[current_file -1]


func on_center_pressed():
		if current_file == 3:
			$FileFind/Check.text = "Congratulations!"
			await get_tree().create_timer(1).timeout
			$FileFind.visible = false
			$OrganizeFiles.visible = true
		else:
			$FileFind/Check.text = "Incorrect."
			await get_tree().create_timer(1).timeout
			$FileFind/Check.text = "Find the promotional Folder"


func _on_drop_item(slot) -> void:
	player_order.merge(slot.action())
	await get_tree().create_timer(1).timeout
	if player_order.size() == 6 : 
		check_win()


func check_win():
	if player_order == correct_order:
		print("Congrats")
		get_parent().final.emit()
		queue_free()
	else:
		reset()


func reset():
	for slot in $OrganizeFiles/Slots.get_children():
			slot.texture = slot.original_texture
			slot.scale = Vector2(2.5, 2.5)
	
	for item in $OrganizeFiles/Items.get_children():
		item.texture = item.original_texture

	player_order = {}
