extends Node


func make_post_request(scenario, time, username, finished):
	var collection: FirestoreCollection = Firebase.Firestore.collection("scores")
	var query: FirestoreQuery = FirestoreQuery.new()
	query.from("scores")
	query.where("username", FirestoreQuery.OPERATOR.EQUAL, username)
	var query_task: FirestoreTask = Firebase.Firestore.query(query)
	var result: Array = await Firebase.Firestore.query(query).result_query
	
	if result.size() > 0:
		var latest_id = 0
		for score in result:
			var id = score['id']
			if id.is_number() and id > latest_id:
				latest_id = id
		latest_id += 1
		collection.set(username + "_1", {
			"scenario": scenario,
			"time": time,
			"username": username,
			"finished": finished,
			"createdAt": Time.get_datetime_string_from_system()
		})
	else:
		collection.set(username + "_1", {
			"scenario": scenario,
			"time": time,
			"username": username,
			"finished": finished,
			"createdAt": Time.get_datetime_string_from_system()
		})


func _on_http_request_request_completed(_result, _response_code, _headers, body):
	var response = body.get_string_from_utf8()
	print(response)


func make_get_request():
	var url = "http://localhost:8000/pulldata.php"
	# Add 'Content-Type' header:
	var headers = ["Content-Type: application/json"]
	$HTTPRequest.request(url, headers, HTTPClient.METHOD_GET)

