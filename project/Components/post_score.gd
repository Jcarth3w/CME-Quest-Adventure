extends Node


func _ready():
	Firebase.Auth.login_succeeded.connect(on_login_success)
	Firebase.Auth.login_failed.connect(on_login_failure)
	Firebase.Auth.login_with_email_and_password("jaredbowman@piesrgr8.com", "jfkgotshotbro")

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


func _on_http_request_request_completed(_result, _response_code, _headers, body):
	var response = body.get_string_from_utf8()
	print(response)


func make_get_request():
	var url = "http://localhost:8000/pulldata.php"
	# Add 'Content-Type' header:
	var headers = ["Content-Type: application/json"]
	$HTTPRequest.request(url, headers, HTTPClient.METHOD_GET)

func on_login_success(auth):
	print("Login to Firebase was successful!")

func on_login_failure(error_code, message):
	print(error_code)
	print(message)
