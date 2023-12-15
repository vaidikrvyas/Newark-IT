<?php
// Database connection
require 'config.php';


// View query
$sql = "SELECT * FROM mostselling_q3";
$result = $conn->query($sql);

// Display data
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        echo "PID: " . $row["PID"]. " - PName: " . $row["PName"]. " - count: " . $row["count(a.PID)"]. "<br>";
    }
} else {
    echo "No records found.";
}

// Close connection
$conn->close();
?>