<!DOCTYPE html>
<html>
<head>
    <title>Add Credit Card</title>
    <link rel="stylesheet" href="styles4.css">
</head>
<body>

<h2>Add New Credit Card</h2>

<form method="post" action="creditcard_process.php">
    <label for="ccNumber">Credit Card Number:</label>
    <input type="text" name="ccNumber" required><br>

    <label for="secNumber">Security Number:</label>
    <input type="text" name="secNumber" required><br>

    <label for="ownerName">Owner Name:</label>
    <input type="text" name="ownerName" required><br>

    <label for="ccType">Credit Card Type:</label>
    <input type="text" name="ccType" required><br>

    <label for="bilAddress">Billing Address:</label>
    <input type="text" name="bilAddress" required><br>

    <label for="expDate">Expiration Date:</label>
    <input type="date" name="expDate" required><br>

    <input type="submit" value="Add Credit Card">
</form>

</body>
</html>