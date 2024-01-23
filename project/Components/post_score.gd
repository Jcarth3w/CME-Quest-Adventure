extends Node


func make_post_request(url, data_to_send):
	# Convert data to json string:
	var data = JSON.stringify(data_to_send)
	print(data)
	# Add 'Content-Type' header:
	var headers = ["Content-Type: application/json"]
	$HTTPRequest.request(url, headers, HTTPClient.METHOD_POST, data)


func _on_http_request_request_completed(result, response_code, headers, body):
	var response = body.get_string_from_utf8()
	print(response)
