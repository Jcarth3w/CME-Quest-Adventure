<?php

use PHPUnit\Framework\TestCase;

class testdata extends TestCase
{
    protected $pdo;

    public function setUp(): void
    {
		$servername = "db";
		$username = "root";
		$password = "root";
		$dbname = "cme_quest_adventures";

        // Set up a PDO connection to your testing database
        $this->pdo = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
    }

    public function tearDown(): void
    {
        // Clean up after each test
        $this->pdo = null;
    }

    public function testInsertScore()
    {
        // Insert a test score into the `scores` table
        $stmt = $this->pdo->prepare('INSERT INTO scores (scenario, username, time, finished) VALUES (?, ?, ?, ?)');
        $stmt->execute([1, 'testuser', '00:10:00', true]);

        // Check if the score was inserted successfully
        $this->assertEquals(1, $stmt->rowCount());
    }

    public function testGetScores()
    {
        // Get scores from the `scores` table
        $stmt = $this->pdo->query('SELECT * FROM scores');
        $scores = $stmt->fetchAll(PDO::FETCH_ASSOC);

        // Check if the scores were retrieved successfully
        $this->assertNotEmpty($scores);
    }
}
?>