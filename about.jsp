<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us - Fast Food Point</title>
    <style>
        /* General Styles */
        body {
            margin: 0;
            font-family: 'Arial', sans-serif;
            background-color: #fff;
            color: #000;
        }

        /* Header */
        header {
            background-color: #000;
           // color: #ffd700;
           color: white;
            padding: 10px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 4px rgba(255, 215, 0, 0.5);
           //box-shadow: 0 2px 4px  rgb(255,140,0);

        }

        .logo {
            display: flex;
            align-items: center;
        }

        .logo img {
            height: 80px;
            margin-right: 10px;
        }

        nav ul {
            list-style: none;
            display: flex;
            margin: 0;
            padding: 0;
        }

        nav ul li {
            margin: 0 15px;
        }

        nav ul li a {
            text-decoration: none;
          //  color: #ffd700;
          color: white;
            font-weight: bold;
            transition: color 0.3s;
        }

        nav ul li a:hover {
          //  color: #fff;
          color: #ffd700;
        }
         header h1{
            color:#ffd700;
        }

        /* About Section */
        .about-section {
            text-align: center;
            padding: 50px 20px;
        }

        .about-section h1 {
            font-size: 3rem;
          //  color: #ffd700;
          color:black;
            margin-bottom: 20px;
            animation: fadeIn 2s;
        //    text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
        }

        .about-section p {
            font-size: 1.2rem;
            line-height: 1.8;
            margin: 20px auto;
            max-width: 800px;
            animation: slideIn 2s;
        }

        /* Image Section */
        .image-gallery {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
            padding: 20px;
            animation: zoomIn 2s;
        }

        .image-gallery img {
            width: 300px;
            height: 200px;
            object-fit: cover;
            border: 3px solid #ffdf00;
            border-radius: 10px;
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .image-gallery img:hover {
            transform: scale(1.1);
            box-shadow: 0 4px 8px rgba(255, 215, 0, 0.5);
        }

        /* Footer */
        footer {
            background-color: #000;
           // color: #ffd700;
           color: white;
            text-align: center;
            padding: 20px;
        }

        .social-icons {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 15px;
            margin-top: 10px;
        }

        .social-icons img {
            width: 30px;
            height: 30px;
            cursor: pointer;
            transition: transform 0.3s;
        }

        .social-icons img:hover {
            transform: scale(1.2);
        }

        /* Animations */
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        @keyframes slideIn {
            from { transform: translateY(50px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }

        @keyframes zoomIn {
            from { transform: scale(0.8); opacity: 0; }
            to { transform: scale(1); opacity: 1; }
        }
    </style>
</head>
<body>
    <!-- Header Section -->
    <header>
        <div class="logo">
            <img src="images/ff.png" alt="Fast Food Point Logo">
            <h1>Fast Food Point</h1>
        </div>
        <nav>
            <ul>
                <li><a href="index.jsp">Home</a></li>
                <li><a href="about.jsp" class="active">About Us</a></li>
                <li><a href="menu.jsp">Menu</a></li>
                <li><a href="contact.jsp">Contact</a></li>
                <li><a href="cart.jsp">Cart</a></li>
            <!--    <li><a href="login.jsp">Login</a></li>-->
            </ul>
        </nav>
    </header>

    <!-- About Us Section -->
    <div class="about-section">
        <h1>About Us 🍔🍕</h1><br>
        <p>
           Welcome to Fast Food Point! 🍟✨ We're passionate about serving up mouth-watering, high-quality fast food with a twist of love and flavor.
           Whether you're craving a juicy burger 🍔, crispy fries 🍟, or a hot pizza 🍕, we've got you covered. Our mission is simple: to bring the best of fast food straight to your table with unbeatable taste and speed! 🚀❤️
        </p>
        <p>
            At Fast Food Point, we take pride in using only the freshest ingredients 🌱 to create delicious meals that will make you smile 😁. 
            From our famous burgers 🍔 to the creamy cold drinks 🥤 and tasty sandwiches 🥪, we have something for everyone! Whether you're grabbing a quick bite or enjoying a meal with friends, we're here to satisfy your cravings. 🧑‍🤝‍🧑
        </p>
        <p>Join us and experience food that not only fills your stomach but also warms your heart! 
            ❤️ Let’s make every meal an unforgettable experience together. 🥳🍽️</p>
    </div>

    <!-- Image Gallery Section -->
    <div class="image-gallery">
        <img src="images/burger.jpg" alt="Burgers">
        <img src="images/frenchfries2.png" alt="Fries">
        <img src="images/pizza.jpg" alt="Pizza">
        <img src="images/menu-image.jpeg" alt="Desserts">
    </div>

    <!-- Footer Section -->
    <footer>
        <p>&copy; 2025 Fast Food Point. All rights reserved.</p>
        <p>Follow us on:</p>
        <div class="social-icons">
            <img src="images/facebook.png" alt="Facebook">
            <img src="images/insta.png" alt="Instagram">
            <img src="images/twitt.png" alt="Twitter">
        </div>
    </footer>
</body>
</html>
