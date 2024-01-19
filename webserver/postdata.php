<?php
    $servername = "db";
    $username = "root";
    $password = "root";
    $dbname = "cme_quest_adventures";

	$json_data = file_get_contents("php://input");

    // Decode the JSON data
    $data = json_decode($json_data, true);

    // Process the data as needed
    // Example: Print the received data
    print_r($data);

	if ($data !== null) {
        // Extract individual fields and assign them to variables
        $scenario_num = $data['scenario'];
        $user = $data['username'];
        $time = $data['time'];
        $finished = $data['finished'];
    } else {
        echo "Error decoding JSON data\n";
    }


	try {

	  $conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
	  $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	 

	  $sql = "INSERT INTO scores (scenario, username, time, finished)
	  VALUES ('". $scenario_num ."', '". $user ."', '". $time ."', '". $finished ."')";


	  $conn->exec($sql);
	  echo "New record created successfully";

	} catch(PDOException $e) {
	  echo $sql . "<br>" . $e->getMessage();
	}
	
	$conn = null;
?>