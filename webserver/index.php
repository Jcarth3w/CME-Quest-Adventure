<html>
    <link rel="stylesheet" href="index.css">
    <body>
        <h1>CME Quest Adventures Database</h1>
        <form class="search-form" method="GET">
            <span class="answer-field">
                <label for="scenario">Enter Scenario #:</label>
                <input type='text' name="scenario"/>
            </span>
			<span class="answer-field">
                <label for="findname">Enter Username:</label>
                <input type='text' name="findname"/>
            </span>
            <input type='submit' value="Search"/>
        </form>
        <?php require("datatable.php")?>
        <p>You are viewing a read-only table. <a href="exporttable.php">Export Table</p>
    </body>
</html>