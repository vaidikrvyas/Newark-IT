<?php
// Database connection
require 'config.php';


// View query
$sql = "SELECT * FROM Q2";
$result = $conn->query($sql);

// Display data
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        echo "CID: " . $row["CID"]. " - Name: " . $row["FName"]. " " . $row["LName"]. " - Total Spent: " . $row["total_spent"]. "<br>";
    }
} else 
{
    echo "No records found.";
}
// Close connection
$conn->close();
?>