<html>
    <link rel="stylesheet" href="index.css">
    <body>
        <h1>CME Quest Adventures Database</h1>
        <form method="POST">
            <label for="findname">Enter Username:</label>
            <input type='text' name="findname"/>
            <input type='submit' value="Search"/>
        </form>
        <?php require("datatable.php")?>
        <p>You are viewing a read-only table.</p>
    </body>
</html>