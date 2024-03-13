<?php
    $servername = "db";
    $username = "root";
    $password = "root";
    $dbname = "cme_quest_adventures";

    $output = array();

    try {
        $conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
        $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    } catch(PDOException $e) {
        die("Error: " . $e->getMessage());
    }


    $query = "SELECT time, username FROM scores WHERE finished=1 AND scenario=1 ORDER BY time ASC LIMIT 5";
    $stmt = $conn->prepare($query);
    $stmt->execute();

    $result = $stmt->fetchAll(PDO::FETCH_ASSOC);

    $conn = null;

    $json = json_encode($result);

    header('Content-Type: application/json');

    echo $json;
  ?>
    

