<?php
    $servername = "db";
    $username = "root";
    $password = "root";
    $dbname = "cme_quest_adventures";


    $json_data = file_get_contents("php://input");

    // Decode the JSON data
    $data = json_decode($json_data, true);

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

        $sql = $conn->prepare("SELECT time FROM scores ORDER BY time DESC");
        $sql->execute();
        $result = $sql->setFetchMode(PDO::FETCH_ASSOC);
 
        foreach($result as $row) {
            echo $row['user'];
            echo $row['time'];
            echo $row['scenario_num'];
            echo $row['finished'];
        }

    }catch(PDOException $e) {
        echo $sql . "<br>" . $e->getMessage();
    }
      $conn = null;
  ?>
    

