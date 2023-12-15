<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <title>Newark - IT</title>
</head>
<body>
    <header>
        <h1 class="logo">Welcome to Newark - IT</h1>
    </header>
    <nav>
        <ul>
            <li><a href="#">Home</a></li>
            <li><a href="product.php">Products</a></li>
            <?php
                session_start();
                if (isset($_SESSION['user'])) {
                    // User is logged in
                    echo '<li><a href="order_status.php">Order Status</a></li>';
                    echo '<li><a href="transaction_history.php">Transaction History</a></li>';
                    echo '<li><a href="logout.php">Logout</a></li>';
                    echo '<li><a href="update_profile.php">Update Profile</a></li>';
                } else {
                    // User is not logged in
                    echo '<li><a href="registration.php">Register</a></li>';
                    echo '<li><a href="login.php">Login</a></li>';
                }
            ?>
        </ul>
    </nav>

    <!-- New section for special buttons -->
    <section id="special-buttons">
        <?php
            if (isset($_SESSION['user'])) {
                echo '<a href="stat1.php" class="special-button">Total Amount Charged per CC</a>';
                echo '<a href="stat2.php" class="special-button">10 Best Customers</a>';
                echo '<a href="stat3.php" class="special-button">Most Freq. Sold Products</a>';
                echo '<a href="stat4.php" class="special-button">Highest Sale to Distinct Customers</a>';
                echo '<a href="stat5.php" class="special-button">Max Basket Total Amount per CC</a>';
                echo '<a href="stat6.php" class="special-button">Avg Selling Product Price</a>';
            }
        ?>
    </section>

    <section id="content">
        <!-- Content will be dynamically loaded here -->
        
    </section>
    <footer>
        <p>&copy; 2023 Newark - IT. All rights reserved.</p>
    </footer>
</body>
</html>
