<?php
require 'config.php';

// Start the session
session_start();

// Check if the form is submitted
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Check if session variable is set
    if (isset($_SESSION['user'])) {
        $cid = $_SESSION['user']; // Assuming custid is stored in a session variable

        // Get user inputs from the form
        $firstName = $_POST['first_name'];
        $lastName = $_POST['last_name'];
        $email = $_POST['email'];
        $password = $_POST['password']; // Directly using the password from the form
        $shippingAddress = $_POST['address'];
        $phone = $_POST['phone_number'];

        // Prepare and bind
        $stmt = $conn->prepare("UPDATE customer SET FName = ?, LName = ?, EMail = ?, `Password` = ?, `Address` = ?, Phone = ? WHERE CID = ?");
        $stmt->bind_param("ssssssi", $firstName, $lastName, $email, $password, $shippingAddress, $phone, $cid);

        // Execute the statement
        if ($stmt->execute()) {
            // Update successful!
            header('Location: index.php');
            exit; // Ensure that no further code is executed after the redirection
        } else {
            // Update failed
            echo "Error updating record: " . $stmt->error;
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
