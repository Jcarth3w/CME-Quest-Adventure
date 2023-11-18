extends MiniGame

var flipped_count = 0
var checkPairMatching = false
var isTimerStarted = false

@export var winning_pair : Node2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	check_win()
	check_pair()



func check_pair():
	if flipped_count == 2 and checkPairMatching == false:
		checkPairMatching = true
		if isTimerStarted == false:
			$CheckPairTimer.start()
		flipped_count = 0


func check_win():
	if winning_pair.isMatched == true:
			win()

func win():
	$Label.text = "You win!"
	await get_tree().create_timer(1.5).timeout
	finished.emit()
	queue_free()



func _on_timer_timeout():
	checkPairMatching = false
	isTimerStarted = false

