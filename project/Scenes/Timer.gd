extends Timer


var timePassed = 0;


func _on_timeout():
	timePassed += 1
	$Label.text = "Time: " + str(timePassed)
