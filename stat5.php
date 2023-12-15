<?php
// Database connection
require 'config.php';


// View query
$sql = "SELECT * FROM Q5";
$result = $conn->query($sql);

// Display data
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        echo "CCNumber: " . $row["CCNumber"]. " - Max Basket Total Amount: " . $row["MaxBasketTotalAmount"]. "<br>";
    }
} else {
    echo "No records found.";
}

// Close connection
$conn->close();
?>