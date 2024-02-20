extends GutTest

var url = "http://localhost:8000/testtable.php";
var username = "Johnson";
var scenario = "1";
var finished = "1";
var db

func _before_all():


func _after_all():
    db.close()

func test_insert_data():
    db.execute("INSERT INTO scores (scenario, username, time, finished) VALUES (1, 'TestUser', '12:00:00', 1)")

    assert_eq($db.query("SELECT COUNT(*) FROM scores WHERE username = 'TestUser'"), 1)

func test_update_data():
    db.execute("UPDATE scores SET finished = 0 WHERE username = 'TestUser'")

    assert_eq($db.query("SELECT finished FROM scores WHERE username = 'TestUser'"), 0)

func test_delete_data():
    db.execute("DELETE FROM scores WHERE username = 'TestUser'")

    assert_eq($db.query("SELECT COUNT(*) FROM scores WHERE username = 'TestUser'"), 0)