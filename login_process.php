<?php
require 'config.php';

// Start the session
session_start();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Get user inputs from the form
    $email = $_POST['email'];
    $password = $_POST['password'];

    // SQL query to check if the email and password match and get the customer ID
    $sql = "SELECT CID FROM customer WHERE EMail = '$email' AND Password = '$password'";
    $result = mysqli_query($conn, $sql);

    if ($result && mysqli_num_rows($result) > 0) {
        // Login successful
        $row = mysqli_fetch_assoc($result);
        $_SESSION['user'] = $row['CID']; // Store customer ID in session
        header("Location: index.php"); // Redirect to index.php
        exit;
    } else {
        // Email or password is incorrect
        $error_message = "Incorrect email or password!";
        header("Location: login.php?error=" . urlencode($error_message)); // Redirect to login.php with error message
        exit;
    }
}

// Close the database connection
$conn->close();
?>
