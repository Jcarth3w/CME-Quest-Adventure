<?php
    echo "<table>";
    echo "<tr><th>Id</th><th>Scenario</th><th>Username</th><th>Time</th><th>Finished</th><th>CreatedAt</th></tr>";

    class TableRows extends RecursiveIteratorIterator {
        function __construct($it) {
            parent::__construct($it, self::LEAVES_ONLY);
        }

        function current() {
            return "<td style='width:150px;border:1px solid black;'>" . parent::current(). "</td>";
        }

        function beginChildren() {
            echo "<tr>";
        }

        function endChildren() {
            echo "</tr>" . "\n";
        }
    }

    $servername = "db";
    $username = "root";
    $password = "root";
    $dbname = "cme_quest_adventures";

    $findname = $_GET['findname'];

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
        foreach(new TableRows(new RecursiveArrayIterator($stmt->fetchAll())) as $k=>$v) {
            echo $v;
        }
    } catch(PDOException $e) {
        echo "Error: " . $e->getMessage();
    }

    $conn = null;
    echo "</table>";
?>