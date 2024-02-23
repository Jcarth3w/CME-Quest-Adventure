<html>
    <link rel="stylesheet" href="index.css">
    <body>
        <h1>CME Quest Adventures Database</h1>
        <form class="search-form" method="GET">
            <span class="answer-field">
                <label for="scenario">Enter Scenario #:</label>
                <input type='number' name="scenario" placeholder="1" min="1" max="10"/>
            </span>
			<span class="answer-field">
                <label for="findname">Enter Username:</label>
                <input type='text' name="findname" placeholder="Johnson"/>
            </span>
            <input id='submit' type='submit' value="Search"/>
        </form>
        <?php require("datatable.php")?>
        <p>You are viewing a read-only table. <a href="exporttable.php">Export Table</p>
    </body>
</html>