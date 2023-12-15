<?php
require 'config.php';

session_start();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Check if session variable is set
    if (isset($_SESSION['user'])) {
        $cid = $_SESSION['user']; // Using the customer ID from the session

        // Get user inputs from the form
        $ccNumber = $_POST['ccNumber'];
        $secNumber = $_POST['secNumber'];
        $ownerName = $_POST['ownerName'];
        $ccType = $_POST['ccType'];
        $bilAddress = $_POST['bilAddress'];
        $expDate = $_POST['expDate'];

        // Perform validation and sanitation as needed

        // Prepare and bind
        $stmt = $conn->prepare("INSERT INTO credit_card (CCNumber, SecNumber, OwnerName, CCType, BilAddress, ExpDate, StoredCardCID) 
                                VALUES (?, ?, ?, ?, ?, ?, ?)");
        $stmt->bind_param("ssssssi", $ccNumber, $secNumber, $ownerName, $ccType, $bilAddress, $expDate, $cid);

        // Execute the statement
        if ($stmt->execute()) {
            echo "New credit card added successfully!";
        } else {
            echo "Error: " . $stmt->error;
        }

        $stmt->close();
    } else {
        echo "User session not set.";
    }
} else {
    echo "No form submission detected.";
}

// Close the database connection
$conn->close();
?>
