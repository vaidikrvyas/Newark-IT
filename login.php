<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <link rel="stylesheet" href="styles2.css"> <!-- Add this line to link the new CSS file -->
</head>
<body>
    <div class="login-container">
        <h2>Login</h2>

        <?php
        // Check if an error message is present in the URL
        if (isset($_GET['error'])) {
            $error_message = urldecode($_GET['error']);
            echo "<p style='color: red;'>$error_message</p>";
        }
        ?>

        <form class="login-form" action="login_process.php" method="post">
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>
            </div>
            <div class="form-group">
                <button type="submit">Login</button>
            </div>
        </form>
    </div>
</body>
</html>
