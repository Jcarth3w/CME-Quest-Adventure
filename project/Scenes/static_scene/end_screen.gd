extends CanvasLayer

var username
var scen_num
var time_val

# Called when the node enters the scene tree for the first time.
func _ready():
	$User.text = username
	$ScenNum.text = str(scen_num)
	$TimeVal.text = time_val



func _on_main_menu_pressed():
	get_parent().send_data(1)
	await get_tree().create_timer(1).timeout
	get_tree().change_scene_to_file("res://Scenes/main_menus/main_menu.tscn")
