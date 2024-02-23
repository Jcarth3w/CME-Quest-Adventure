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

    $findname = isset($_GET['findname']) ? $_GET['findname'] : null;
    $page = isset($_GET['page']) ? (int)$_GET['page'] : 1;
    $numRecordsPerPage = 15;
    $offset = ($page-1) * $numRecordsPerPage;

    try {
        $conn = new PDO("mysql:host=" . $servername . ";dbname=" . $dbname, $username, $password);
        $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        $sql = "SELECT * FROM scores LIMIT $numRecordsPerPage OFFSET $offset";

        if (isset($findname)) {
            $sql = "SELECT * FROM scores WHERE username LIKE '". $findname . "%' LIMIT $numRecordsPerPage OFFSET $offset";
        }
        
        $stmt = $conn->prepare($sql);
        $stmt->execute();

        // set the resulting array to associative
        $result = $stmt->setFetchMode(PDO::FETCH_ASSOC);
        foreach(new TableRows(new RecursiveArrayIterator($stmt->fetchAll())) as $k=>$v) {
            echo $v;
        }

        // Pagination Links
        if ($page > 1) echo '<a href="?page='.($page-1).'">Previous</a> | ';
        echo '<a href="?page='.($page+1).'">Next</a>';

    } catch(PDOException $e) {
        echo "Error: " . $e->getMessage();
    }

    $conn = null;
    echo "</table>";
?>