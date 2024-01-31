extends Node


func make_post_request(scenario, time, username, finished):
	var url = "http://localhost:8000/postdata.php"
	var json_object = {
		"scenario": scenario,
		"time": time,
		"username": username,
		"finished": finished
	}
	# Convert data to json string:
	var data = JSON.stringify(json_object)
	# Add 'Content-Type' header:
	var headers = ["Content-Type: application/json"]
	$HTTPRequest.request(url, headers, HTTPClient.METHOD_POST, data)


func _on_http_request_request_completed(result, response_code, headers, body):
	var response = body.get_string_from_utf8()
	print(response)


func make_get_request():
	var url = "http://localhost:8000/pulldata.php"
	# Add 'Content-Type' header:
	var headers = ["Content-Type: application/json"]
	$HTTPRequest.request(url, headers, HTTPClient.METHOD_GET)
