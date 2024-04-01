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
	var query: FirestoreQuery = collection.where("username", "==", username)
	query.get_documents().connect("completed", self, "_on_query_completed", [collection, data])


func _on_query_completed(result, collection, data):
	if result.success:
		var documents: Array = result.documents
		var username = data["username"]
		
		if documents.size() > 0:
			username += "_${documents.size()}"
			
			collection.document(username).set(data)
		else:
			print("Query Error:", result.error)


func _on_http_request_request_completed(_result, _response_code, _headers, body):
	var response = body.get_string_from_utf8()
	print(response)


func make_get_request():
	var url = "http://localhost:8000/pulldata.php"
	# Add 'Content-Type' header:
	var headers = ["Content-Type: application/json"]
	$HTTPRequest.request(url, headers, HTTPClient.METHOD_GET)

