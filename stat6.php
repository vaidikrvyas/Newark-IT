<?php
// Database connection
require 'config.php';


// View query
$sql = "SELECT * FROM Q6";
$result = $conn->query($sql);

// Display data
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        echo "Product Type: " . $row["PType"]. " - Average Product Price: " . $row["AVG(a.PriceSold)"]. "<br>";
    }
} else {
    echo "No records found.";
}

// Close connection
$conn->close();
?>