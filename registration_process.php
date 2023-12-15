<?php
// Include your database configuration
require 'config.php';

// Function to generate a random 5-digit number
function generateRandom5DigitNumber() {
    return rand(10000, 99999);
}

// Check if the form is submitted
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Get user inputs from the form
    $firstName = $_POST['first_name'];
    $lastName = $_POST['last_name'];
    $email = $_POST['email'];
    $password = $_POST['password'];
    $shippingAddress = $_POST['address'];
    $phone = $_POST['phone_number'];

    // Generate a random 5-digit number
    $randomNumber = generateRandom5DigitNumber();

    // SQL query to insert data into the database
    $sql = "INSERT INTO customer (FName, LName, EMail, `Password`, `Address`, Phone, CID)
            VALUES ('$firstName', '$lastName', '$email', '$password', '$shippingAddress', '$phone', $randomNumber)";

    // Perform the SQL query
    if ($conn->query($sql) === TRUE) {
        // Registration successful!
        // Redirect to index.php after successful registration
        header('Location: index.php');
        exit; // Ensure that no further code is executed after the redirection
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
}

// Close the database connection
$conn->close();
?>