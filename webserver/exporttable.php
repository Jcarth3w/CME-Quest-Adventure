<?php
	ob_start();

	header('Content-Type: text/csv; charset=utf-8');
	header('Content-Disposition: attachment; filename=datasheet_export.csv');

	$header_args = array('ID', 'Scenario', 'Username', 'Time', 'Finished', 'CreatedAt');

	$servername = "db";
    $username = "root";
    $password = "root";
    $dbname = "cme_quest_adventures";

    $findname = $_POST['findname'];

	$data = array();

    try {
        $conn = new PDO("mysql:host=" . $servername . ";dbname=" . $dbname, $username, $password);
        $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        $stmt = $conn->prepare("SELECT * FROM scores");

        if (isset($findname)) {
            $stmt = $conn->prepare("SELECT * FROM scores WHERE username LIKE '". $findname . "%'");
        }
        $stmt->execute();

        // set the resulting array to associative
        $result = $stmt->setFetchMode(PDO::FETCH_ASSOC);
        // foreach($stmt->fetchAll() as $k=>$v) {
        //     $data = $v;
        // }
		$data = $stmt->fetchAll();
    } catch(PDOException $e) {
        echo "Error: " . $e->getMessage();
    }

	ob_end_clean();

	$output = fopen('php://output', 'w');

	fputcsv($output, $header_args);

	foreach($data as $data_item) {
		fputcsv($output, $data_item);
	}

	fclose($output);
	exit;
?>