<?php
// Database connection
require 'config.php';


// View query
$sql = "SELECT * FROM Q4";
$result = $conn->query($sql);

// Display data
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        echo "PID: " . $row["PID"]. " - Product Name: " . $row["PName"]. " - Number of Customers: " . $row["NumberofCustomer"]. "<br>";
    }
} else {
    echo "No records found.";
}

// Close connection
$conn->close();
?>