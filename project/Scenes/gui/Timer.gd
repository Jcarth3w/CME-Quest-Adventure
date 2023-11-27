extends Timer

var seconds = 0;
var ten_seconds = 0;
var minutes = 0;
var ten_minutes = 0;


func _on_timeout():
	seconds += 1
	if seconds == 10:
		ten_seconds += 1
		seconds = 0
	if ten_seconds == 6:
		minutes += 1
		ten_seconds = 0
	if minutes == 10:
		ten_minutes += 1
		minutes = 0

	$Label.text = "Time: " + str(ten_minutes) + str(minutes) + ":" + str(ten_seconds) + str(seconds)
