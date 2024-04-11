extends Timer


var seconds = 9;
var ten_seconds = 5;
var minutes = 9;
var ten_minutes = 2;


func _on_timeout():
	update_label()

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
