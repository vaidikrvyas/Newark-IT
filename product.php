<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>E-commerce Website</title>
    <link rel="stylesheet" href="styles3.css">
</head>
<body>
    <header>
        <h1 class="logo">Welcome to Newark - IT</h1>
    </header>
    <nav>
        <ul>
            <li><a href="index.php">Home</a></li>
            <li><a href="product.php">Products</a></li>
            <?php
                session_start();
                if (isset($_SESSION['user'])) {
                    // User is logged in
                    echo '<li><a href="order_status.php">Order Status</a></li>';
                    echo '<li><a href="transaction_history.php">Transaction History</a></li>';
                    echo '<li><a href="logout.php">Logout</a></li>';
                } else {
                    // User is not logged in
                    echo '<li><a href="registration.php">Register</a></li>';
                    echo '<li><a href="login.php">Login</a></li>';
                }
            ?>
        </ul>
    </nav>
    

    <div class="product-container" id="product-container">
        <!-- Product cards will be dynamically added here using JavaScript -->
    </div>

    <div id="shopping-cart">
        <h2>Shopping Cart</h2>
        <ul id="cart-list"></ul>
        <p id="total-amount">Total: $0.00</p>
    </div>

    <script>
        const products = [
            { id: 1, name: 'Dell All in One 11th Gen', price: 1199, imageUrl: 'product1.jpg', description: 'Powerful all-in-one computer from Dell.' },
            { id: 2, name: 'HP Omen 10th Gen', price: 899, imageUrl: 'product2.jpg', description: 'High-performance gaming laptop from HP.' },
            { id: 3, name: 'Canon Color Printer', price: 299, imageUrl: 'product3.jpg', description: 'Quality color printer from Canon.' },
            { id: 4, name: 'Logitech Keyboard - Mouse', price: 89, imageUrl: 'product4.jpg', description: 'Durable keyboard and mouse combo from Logitech.' }
        ];

        const productContainer = document.getElementById('product-container');
        const cartList = document.getElementById('cart-list');
        const totalAmountElement = document.getElementById('total-amount');

        const shoppingCart = [];

        function renderProducts() {
            productContainer.innerHTML = '';

            products.forEach(product => {
                const productCard = document.createElement('div');
                productCard.classList.add('product-card');

                const image = document.createElement('img');
                image.src = product.imageUrl;
                image.alt = product.name;
                image.classList.add('product-image');

                const name = document.createElement('h3');
                name.textContent = product.name;

                const description = document.createElement('p');
                description.textContent = product.description;

                const price = document.createElement('p');
                price.textContent = `$${product.price.toFixed(2)}`;

                const buyButton = document.createElement('button');
                buyButton.textContent = 'Buy';
                buyButton.addEventListener('click', () => {
                    addToCart(product);
                });

                productCard.appendChild(image);
                productCard.appendChild(name);
                productCard.appendChild(description);
                productCard.appendChild(price);
                productCard.appendChild(buyButton);

                productContainer.appendChild(productCard);
            });
        }

        function addToCart(product) {
            const existingCartItem = shoppingCart.find(item => item.id === product.id);

            if (existingCartItem) {
                existingCartItem.quantity++;
            } else {
                product.quantity = 1;
                shoppingCart.push(product);
            }

            updateCartUI();
        }

        function updateCartUI() {
            cartList.innerHTML = '';
            let totalAmount = 0;

            shoppingCart.forEach(item => {
                const cartItem = document.createElement('li');
                const counter = document.createElement('span');
                counter.textContent = ` x${item.quantity || 1} `;
                
                const deleteButton = document.createElement('button');
                deleteButton.textContent = 'Delete';
                deleteButton.addEventListener('click', () => {
                    removeFromCart(item);
                });

                cartItem.textContent = `${item.name} - $${item.price.toFixed(2)}`;
                cartItem.appendChild(counter);
                cartItem.appendChild(deleteButton);
                cartList.appendChild(cartItem);
                totalAmount += item.price * (item.quantity || 1);
            });

            totalAmountElement.textContent = `Total: $${totalAmount.toFixed(2)}`;
        }

        function removeFromCart(product) {
    const existingCartItem = shoppingCart.find(item => item.id === product.id);

    if (existingCartItem) {
        existingCartItem.quantity--;

        if (existingCartItem.quantity <= 0) {
            const index = shoppingCart.findIndex(item => item.id === product.id);
            shoppingCart.splice(index, 1);
        }

        updateCartUI();
    }
}


        // Initial render
        renderProducts();
    </script>
</body>
</html>
