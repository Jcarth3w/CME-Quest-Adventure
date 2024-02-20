extends MiniGame


@export var file_textures: Array[Texture]

var files
var current_file = -1
var current_item
var correct_order = {}
var player_order = {}
var item_positions = {}
var previous_selection



func _ready():
	$FileFind/OffLeft.texture = file_textures[0]

	for item in $OrganizeFiles/Items.get_children():
		if item is TextureButton:
			item.pressed.connect(_on_item_press.bind(item))
			var item_position = {item : item.global_position}
			item_positions.merge(item_position)

	for slot in $OrganizeFiles/Slots.get_children():
		if slot is TextureButton:
			slot.pressed.connect(_on_slot_press.bind(slot))

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


func _on_item_press(item) -> void:
	if current_item != item:
		current_item = item


func _on_slot_press(slot) -> void:
	if current_item != null and current_item != previous_selection:
		current_item.global_position = slot.global_position
		var element = {slot.name : current_item}
		player_order.merge(element)
		current_item.disabled = true
		previous_selection = current_item
		if player_order.size() == 6:
			check_win()


func check_win():
	if player_order == correct_order:
		print("Congrats")
		get_parent().final.emit()
		queue_free()
	else:
		for item in player_order:
			player_order[item].disabled = false
			player_order[item].global_position = item_positions.get(player_order[item])
		player_order.clear()
		current_item = null
		previous_selection = null


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
