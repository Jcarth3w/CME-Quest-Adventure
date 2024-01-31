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

    $query = "SELECT time FROM scores ORDER BY time DESC";
    $stmt = $conn->prepare($query);
    $stmt->execute();

    $result = $stmt->fetchAll(PDO::FETCH_ASSOC);

    $conn = null;

    $json = json_encode($result);

    header('Content-Type: application/json');

    echo $json;
  ?>
    

