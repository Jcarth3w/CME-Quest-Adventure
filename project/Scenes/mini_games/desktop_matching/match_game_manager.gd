extends MiniGame

var flipped_count = 0
var is_timer_started = false
var pair_flip_1
var pair_flip_2


func _ready():
	for child in get_children():
		if child is Node2D:
			child.flip.connect(on_flip.bind(child))


func pair_timer() -> void:
	check_win()
	if is_timer_started == false:
		$CheckPairTimer.start()


func check_win() -> void:
	var matchedCount = 0
	for child in get_children():
		if child is Node2D:
			if(child.is_matched):
				matchedCount = matchedCount + 1
	if(matchedCount == 8):
		win()
		

func win() -> void:
	$Label.text = "You win!"
	finished.emit()
	await get_tree().create_timer(1.5).timeout
	queue_free()


func _on_timer_timeout() -> void:
	timer_timeout()


func on_flip(pair):
	flipped_count += 1
	if flipped_count == 1:
		pair_flip_1 = pair
	elif flipped_count == 2:
		pair_flip_2 = pair
		pair.check_pair()
		disable_inputs()
		pair_timer()
	

func timer_timeout():
	if !pair_flip_1.is_matched:
		pair_flip_1.reset_pair()
		pair_flip_2.reset_pair()
	is_timer_started = false
	pair_flip_1 = null
	pair_flip_2 = null
	flipped_count = 0
	enable_inputs()

func disable_inputs():
	for child in get_children():
		if child is Node2D:
			child.disable_children()


func enable_inputs():
	for child in get_children():
		if child is Node2D:
			child.enable_children()
		
