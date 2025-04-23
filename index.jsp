<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.*, javax.servlet.*" %>
<%
   // HttpSession session = request.getSession(false); // Get existing session, if any
    String username = null;

    if (session != null) {
        username = (String) session.getAttribute("username"); // Retrieve username from session
         
    }
      boolean isAdmin = "Admin".equalsIgnoreCase(username); // Check if the user is Admin
%>




<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fast Food Point</title>
    <style>
        /* Include your CSS styles here */
         body {
            margin: 0;
            font-family: 'Arial', sans-serif;
            background-color: #ff;
            color: #ffd700;
        }

        /* Header Section */
         header h1{
            color:#ffd700;
        }
        
        header {
            background-color: #000;
           // color: #ffd700;
           color: white;
            padding: 10px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 4px rgba(255, 215, 0, 0.5);
           //  box-shadow: 0 2px 4px  rgb(255,159,0);
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
           // color: #ffd700;
           color: white;
            font-weight: bold;
            transition: color 0.3s;
        }

        nav ul li a:hover {
           // color: #fff;
           color: #ffd700;
        }
        .w{
            color: black;
        }
        .wel {
            color:wheat;
        }
         /* Dropdown Menu Styles */
    .dropdown {
        position: relative;
    }

    .dropdown .dropdown-toggle {
        text-decoration: none;
       // color: #ffd700;
       color: white;
        font-weight: bold;
        cursor: pointer;
        transition: color 0.3s;
    }

    .dropdown .dropdown-menu {
        display: none;
        position: absolute;
        top: 100%;
        left: 0;
        background-color: #FFFFFF;
        color: #ffd700;
        list-style: none;
        padding: 10px 0;
        margin: 0;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        z-index: 1000;
    }

    .dropdown .dropdown-menu li {
        padding: 10px 20px;
    }

    .dropdown .dropdown-menu li a {
        text-decoration: none;
      //  color: #ffd700;
      color:black;
        display: block;
        transition: background-color 0.3s, color 0.3s;
    }

    .dropdown .dropdown-menu li a:hover {
      //  background-color: #ffd700;
        color:darkslateblue;
    }

    .dropdown:hover .dropdown-menu {
        display: block;
    }

        /* Slideshow Section */
        .slideshow {
            position: relative;
            max-width: 1200px;
            margin: 20px auto;
            overflow: hidden;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .slide {
            display: none;
            position: relative;
        }

        .slide img {
            width: 100%;
            border-radius: 10px;
        }

        .slide.active {
            display: block;
        }

        .slide-caption {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: rgba(0,0,0, 0.4);
            color: #fff;
            padding: 20px 30px;
            border-radius: 5px;
            font-size: 2.5rem;
            font-weight: bold;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.9); /* Add shadow for extra contrast */
            text-align: center;
            line-height: 1.4; /* Controls the space between lines */
            width: 80%; /* Ensures the text has enough space to wrap */
            max-width: 90%; /* Prevents text from expanding too far */
            word-wrap: break-word; /* Allows long words to break and wrap */
        }

        /* Welcome Section */
        .center-content {
            text-align: center;
            padding: 40px 20px;
        }

        .center-content h2 {
            font-size: 2.5rem;
            color: #000;
        }

        .center-content p {
            font-size: 1.2rem;
            color: #555;
            margin-left: 100px;
            margin-right: 100px;
            
        }
         /* Welcome Section */
        .center-content {
            text-align: center;
            padding: 40px 20px;
        }

        .center-content h2 {
            font-size: 2.5rem;
            color: #000;
        }

        .center-content p {
            font-size: 1.2rem;
            color: #555;
            margin-left: 100px;
            margin-right: 100px;
            
        }

        /* Footer Section */
        footer {
            background-color: #000;
           // color: #ffd700;
           color: white;
            text-align: center;
            padding: 20px;
            margin-top: 20px;
        }

        .social-icons img {
            height: 30px;
            margin: 0 10px;
            cursor: pointer;
            transition: transform 0.3s;
        }

        .social-icons img:hover {
            transform: scale(1.2);
        }
        
          /* Dark overlay background */
        .overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.7);
            display: none;
            z-index: 999;
        }

        /* Popup Styling */
        .popup {
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%) scale(0.9);
            background: #fff;
            color: black;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
            text-align: center;
            width: 300px;
            display: none;
            z-index: 1000;
            animation: popupFadeIn 0.5s ease-out forwards;
        }

        .popup h2 {
            font-size: 1.5rem;
            margin-bottom: 10px;
            margin-left: 0px;
            margin-right: 0px;
              
        }

        .popup p {
            font-size: 1rem;
            margin-bottom: 15px;
        }

        .popup button {
            background: black;
            color: #ffd700;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            font-size: 1rem;
            border-radius: 5px;
            transition: 0.3s;
        }

        .popup button:hover {
            background: #ffd700;
            color: black;
        }

        @keyframes popupFadeIn {
            from { opacity: 0; transform: translate(-50%, -50%) scale(0.5); }
            to { opacity: 1; transform: translate(-50%, -50%) scale(1); }
        }
    </style>
</head>
<body>
    
    <!-- Header Section -->
    <header>
        <div class="logo">
            <img src="images/ff.png" alt="Fast Food Point Logo">
            <h1>Fast Food Point</h1>
            <%--<iframe src="paper.html" width="125" height="99" style="border:none; "></iframe>--%>

        </div>
        <%--<nav>
            <ul>
                <li><a href="#home">Home</a></li>
                <li><a href="about.jsp">About Us</a></li>
                <li><a href="menu.jsp">Menu</a></li>
                <li><a href="cart.jsp">Cart</a></li>
                <li><a href="contact.jsp">Contact</a></li>
            
                
                 
                
                <% if (username != null) { %>
                 <!-- Profile Dropdown Menu --!>
            <li class="dropdown">
                <a href="#" class="dropdown-toggle">Profile</a>
                <ul class="dropdown-menu">
                    <li><a href="show_profile.jsp">Show Profile</a></li>
                    <li><a href="profile_update.jsp">Update Profile</a></li>
                    <li><a href="logout.jsp">Logout</a></li>
                </ul>
            </li>
            <li class="wel">
                      
                        <span>Welcome, <%= username %>!</span> 
                          <div class="overlay" id="popupOverlay"></div>
    <div class="popup" id="offerPopup">
        <h2>Limited Time Offer! Order Now & Get 50% OFF!🔥</h2>
        <p>Order now and get <strong>50% OFF</strong> on your first meal! 🍔🍕🍟</p>
        <p>Hurry! Offer valid for today only.</p>
        <button onclick="closePopup()">Let's Go</button>
    </div>
                      
                    </li>
                <% } else { %>
                    <li><a href="login.jsp">Login</a></li>
                      <li><a href="admin_login.jsp">Admin</a></li>
                <% } %>   
                  
                  
            </ul>
        </nav>--%>
                
                
                
                
                
                
                
            <nav>
    <ul>
        <li><a href="#home">Home</a></li>
        <li><a href="about.jsp">About Us</a></li>
        <li><a href="menu.jsp">Menu</a></li>
        <li><a href="cart.jsp">Cart</a></li>
        <li><a href="contact.jsp">Contact</a></li>

        <% if (username != null && !isAdmin) { %>
            <!-- Profile Dropdown Menu for Users -->
            <li class="dropdown">
                <a href="#" class="dropdown-toggle">Profile</a>
                <ul class="dropdown-menu">
                    <li><a href="show_profile.jsp">Show Profile</a></li>
                    <li><a href="profile_update.jsp">Update Profile</a></li>
                    <li><a href="logout.jsp">Logout</a></li>
                </ul>
            </li>
            <li class="wel">
                <span>Welcome, <%= username %>!</span> 
                <div class="overlay" id="popupOverlay"></div>
                <div class="popup" id="offerPopup">
                    <h2>Limited Time Offer! Order Now & Get 50% OFF!🔥</h2>
                    <p>Order now and get <strong>50% OFF</strong> on your first meal! 🍔🍕🍟</p>
                    <p>Hurry! Offer valid for today only.</p>
                    <button onclick="closePopup()">Let's Go</button>
                </div>
            </li>
        <% } else { %>
            <!-- Show Login and Admin options if no one is logged in -->
            <li><a href="login.jsp">Login</a></li>
            <li><a href="admin_login.jsp">Admin</a></li>
        <% } %>
    </ul>
</nav>
                
          
                    
                
    </header>
            
           

    <!-- Slideshow Section -->
   
   
     <center><h2 class="w">Welcome to Fast Food Point! 🍔🍟</h2></center>
    <div class="slideshow">
        <!-- Slideshow content here -->
       
       
        <div class="slide active">
            <img src="images/bg-1.jpg" alt="Delicious Burgers">
            <div class="slide-caption">Delicious food, fast service, and happy vibes!🌭</div>
        </div>
        <div class="slide">
            <img src="images/image2.jpg" alt="Crispy Fries">
            <div class="slide-caption">Burgers, fries, and everything nice! 🍔🍟❤️ We're serving food, made with a twist!</div>
        </div>
        <div class="slide">
            <img src="images/pizza-bg.jpg" alt="Fresh Pizzas">
            <div class="slide-caption">Fast food, faster smiles! 🏃‍♂️🍕😊 Enjoy quick bites that will leave you smiling all day long!</div>
        </div>
    </div>

      <!-- Welcome Section -->
    <div class="center-content">
        <h2>Welcome to Fast Food Point! 🍔🍟</h2>
        <p>
Step into a world where flavor meets fun, and every bite takes you closer to happiness!
🌟 Whether you're craving a juicy burger,crispy fries,
or a fresh, cheesy pizza, we’ve got just what you need to satisfy those hunger pangs. 🍕</p>
        <p>🍔 No matter what you choose, it’s all about the flavors, fun, and fast food vibes. 🥳🍟
Come hungry, leave with a smile! 😋🍕 Every meal here is made to be memorable, and we can’t wait for you to indulge in the deliciousness. 💯
So, sit back, relax, and let us bring the joy to your table. Your next favorite meal is just a click away! 🥳🍔"

</p>
    </div>


    <!-- Footer Section -->
    <footer>
        <p>&copy; 2025 Fast Food Point. All rights reserved.</p>
        <p>Email: support@fastfoodpoint.com</p>
          <div class="social-icons">
            <img src="images/facebook.png" alt="Facebook">
            <img src="images/insta.png" alt="Instagram">
            <img src="images/twitt.png" alt="Twitter">
        </div>
    </footer>
     <script>
        // JavaScript for Slideshow
        let currentSlide = 0;
        const slides = document.querySelectorAll('.slide');

        function showSlide(index) {
        slides.forEach((slide, i) => {
            slide.classList.remove('active');
                if (i === index) {
                    slide.classList.add('active');
                }
            });
        }

       function nextSlide() {
            currentSlide = (currentSlide + 1) % slides.length;
            showSlide(currentSlide);
        }

        setInterval(nextSlide, 3000); // Change image every 3 seconds
        
        // Show popup with overlay after 1 second
        setTimeout(() => {
            document.getElementById('popupOverlay').style.display = 'block';
            document.getElementById('offerPopup').style.display = 'block';
        }, 1000);

        // Auto-close after 5 seconds
        setTimeout(() => {
            closePopup();
        }, 6000);

        // Close popup function
        function closePopup() {
            document.getElementById('popupOverlay').style.display = 'none';
            document.getElementById('offerPopup').style.display = 'none';
        }

        // Prevent popup from reappearing on scroll
        window.addEventListener('scroll', () => {
            document.getElementById('popupOverlay').style.display = 'none';
            document.getElementById('offerPopup').style.display = 'none';
        }, { once: true });
   </script>
   
</body>
</html>
