extends Node


func _ready():
	Firebase.Auth.login_anonymous()


func make_post_request(scenario, time, username, finished):
	# Firebase.Auth.login_with_email_and_password("jaredbowman@piesrgr8.com", "ctfd120")
	var collection: FirestoreCollection = Firebase.Firestore.collection("scores")
	var query: FirestoreQuery = FirestoreQuery.new()
	query.from("scores")
	query.where("username", FirestoreQuery.OPERATOR.EQUAL, username)
	var query_task: FirestoreTask = Firebase.Firestore.query(query)
	var result: Array = await Firebase.Firestore.query(query).result_query

	if result.size() > 0:
		var latest_id = 0
		for score in result:
			var id_parts = score['doc_name'].split("_")
			if id_parts.size() > 1:
				var id_candidate = id_parts[1].to_int()
				if id_candidate > latest_id:
					latest_id = id_candidate
		latest_id += 1
		collection.add(username + "_" + str(latest_id), {
			"scenario": scenario,
			"time": time,
			"username": username,
			"finished": finished,
			"createdAt": Time.get_datetime_string_from_system()
		})
	else:
		collection.add(username + "_1", {
			"scenario": scenario,
			"time": time,
			"username": username,
			"finished": finished,
			"createdAt": Time.get_datetime_string_from_system()
		})


func make_get_request() -> String:
	var query: FirestoreQuery = FirestoreQuery.new()
	query.from("scores")
	query.where("finished", FirestoreQuery.OPERATOR.EQUAL, 1)
	query.order_by("time", FirestoreQuery.DIRECTION.ASCENDING)
	var query_task: FirestoreTask = Firebase.Firestore.query(query)
	var result: Array = await Firebase.Firestore.query(query).result_query

	var scores_dict: Dictionary = {}
	for score in result:
		var username = score['doc_fields']['username']
		var time = score['doc_fields']['time']
		var scenario = score['doc_fields']['scenario']
		if scores_dict.has(username):
			scores_dict[username].append({"time": time, "scenario": scenario})
		else:
			scores_dict[username] = [{"time": time, "scenario": scenario}]
	return JSON.stringify(scores_dict)

