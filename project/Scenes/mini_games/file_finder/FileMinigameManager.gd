extends MiniGame


var files
var current_file = 0
var current_item
var correct_order = {}
var player_order = {}


func _ready():
	files = [$FileFind/File1, $FileFind/File2, $FileFind/File3, $FileFind/File4, $FileFind/File5]
	for file in files:
		if file.name == "File1":
			file.global_position = $FileFind/Center.global_position
		else:
			file.global_position = $FileFind/OffLeft.global_position

		file.pressed.connect(on_file_press.bind(file))
	
	for item in $OrganizeFiles/Items.get_children():
		if item is TextureButton:
			item.pressed.connect(_on_item_press.bind(item))
	
	for slot in $OrganizeFiles/Slots.get_children():
		if slot is TextureButton:
			slot.pressed.connect(_on_slot_press.bind(slot))
			
	correct_order = {$OrganizeFiles/Slots/Slot1 : $OrganizeFiles/Items/Item1,
					$OrganizeFiles/Slots/Slot2 : $OrganizeFiles/Items/Item2,
					$OrganizeFiles/Slots/Slot3 : $OrganizeFiles/Items/Item3,
					$OrganizeFiles/Slots/Slot4 : $OrganizeFiles/Items/Item4,
					$OrganizeFiles/Slots/Slot5 : $OrganizeFiles/Items/Item5,
					$OrganizeFiles/Slots/Slot6 : $OrganizeFiles/Items/Item6}


func on_file_press(file):
	if file.global_position == $FileFind/Center.global_position:
		if file.name == "File4":
			$FileFind/Check.text = "Congratulations!"
			await get_tree().create_timer(1).timeout
			$FileFind.visible = false
			$OrganizeFiles.visible = true
		else:
			$FileFind/Check.text = "Incorrect."
			await get_tree().create_timer(1).timeout
			$FileFind/Check.text = "Find the promotional Folder"


func _on_previous_pressed() -> void:
	previous_pressed()


func previous_pressed():
	if current_file > 0:
		files[current_file].global_position = $FileFind/OffLeft.global_position
		files[current_file - 1].global_position = $FileFind/Center.global_position
		current_file -= 1


func _on_next_pressed() -> void:
	next_pressed()


func next_pressed():
	if current_file < 4:
		files[current_file].global_position = $FileFind/OffRight.global_position
		files[current_file + 1].global_position = $FileFind/Center.global_position
		current_file += 1


func _on_item_press(item) -> void:
	current_item = item


func _on_slot_press(slot) -> void:
	if current_item != null:
		current_item.global_position = slot.global_position
		var element = {slot : current_item}
		player_order.merge(element)
		if player_order.size() == 6:
			check_win()

func check_win():
	if player_order == correct_order:
		print("Congrats")
