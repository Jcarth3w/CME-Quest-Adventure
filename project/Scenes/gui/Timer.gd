extends Timer

var time_passed = 0;


func _on_timeout() -> void:
	time_passed += 1
	$Label.text = "Time: " + str(time_passed)
