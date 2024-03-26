extends Node


func make_post_request(scenario, time, username, finished):
	var collection: FirestoreCollection = Firebase.Firestore.collection("scores")
	var data: Dictionary = {
		"scenario": scenario,
		"time": time,
		"username": username,
		"finished": finished,
		"createdAt": Time.get_datetime_string_from_system()
	}
	var task: FirestoreTask = collection.update(username, data)


func _on_http_request_request_completed(_result, _response_code, _headers, body):
	var response = body.get_string_from_utf8()
	print(response)


func make_get_request():
	var url = "http://localhost:8000/pulldata.php"
	# Add 'Content-Type' header:
	var headers = ["Content-Type: application/json"]
	$HTTPRequest.request(url, headers, HTTPClient.METHOD_GET)

