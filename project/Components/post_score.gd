extends Node


func _ready():
	Firebase.Auth.login_anonymous()


func make_post_request(scenario, time, username, finished):
	var collection: FirestoreCollection = Firebase.Firestore.collection("scores")
	var query: FirestoreQuery = FirestoreQuery.new()

	query.from("scores")
	query.get("username")

	var result: Array = await Firebase.Firestore.query(query).result_query
	var latest_id = 1

	if result.size() > 0:
		for score in result:
			if score != null and score['doc_fields']['username'].contains(username):
				latest_id += 1
		await collection.add(username + "_" + str(latest_id), {
			"scenario": scenario,
			"time": time,
			"username": username + "_" + str(latest_id),
			"finished": finished,
			"createdAt": Time.get_datetime_string_from_system()
		})
	else:
		await collection.add(username + "_" + str(latest_id), {
		"scenario": scenario,
		"time": time,
		"username": username + "_" + str(latest_id),
		"finished": finished,
		"createdAt": Time.get_datetime_string_from_system()
	})


func make_get_request(scenario_num) -> String:
	var query: FirestoreQuery = FirestoreQuery.new()

	query.from("scores")
	query.where("finished", FirestoreQuery.OPERATOR.EQUAL, 1)
	query.order_by("time", FirestoreQuery.DIRECTION.ASCENDING)
	query.limit(5)

	var result: Array = await Firebase.Firestore.query(query).result_query
	var scores_dict: Dictionary = {}

	for score in result:
		if score.get("doc_fields").get("scenario") == scenario_num:
			print(score)
			var username = score['doc_fields']['username']
			var time = score['doc_fields']['time']
			var scenario = score['doc_fields']['scenario']
			if scores_dict.has(username):
				scores_dict[username].append({"time": time, "scenario": scenario})
			else:
				scores_dict[username] = [{"time": time, "scenario": scenario}]

	return JSON.stringify(scores_dict)

