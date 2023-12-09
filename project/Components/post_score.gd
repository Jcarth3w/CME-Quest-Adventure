extends Node


func _ready():
	var data = {
		"scenario": 1,
		"username": 'Whatup',
		"time": '00:04:00',
		"finished": 1
	}
	_make_post_request("http://localhost:8000/", data, false)


func _make_post_request(url, data_to_send, use_ssl):
	# Convert data to json string:
	var data = JSON.stringify(data_to_send)
	print(data)
	# Add 'Content-Type' header:
	var headers = ["Content-Type": "application/x-www-form-urlencoded"]
	$HTTPRequest.request(url, headers, use_ssl, HTTPClient.METHOD_POST, data)


func _on_http_request_request_completed(result, response_code, headers, body):
	var response = body.get_string_from_utf8()
	print(response)
