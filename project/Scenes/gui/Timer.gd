extends Timer

signal zero

var seconds = 5;
var ten_seconds = 0;
var minutes = 0;
var ten_minutes = 0;


func _on_timeout():
	update_label()
	var total_time = ((ten_minutes * 10) + minutes) + ((ten_seconds * 10) + seconds)
	if total_time == 0:
		zero.emit()
		stop()
		

func update_label():
	seconds -= 1
	if seconds == -1:
		ten_seconds -= 1
		seconds = 9
	if ten_seconds == -1:
		minutes -= 1
		ten_seconds = 5
	if minutes == -1:
		ten_minutes -= 1
		minutes = 9

	$Label.text = str(ten_minutes) + str(minutes) + ":" + str(ten_seconds) + str(seconds)
