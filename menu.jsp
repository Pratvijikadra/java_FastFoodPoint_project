<%--<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Menu - Fast Food Point</title>
    <style>
        /* General Styling */
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #fff;
            color: #ffd700;
        }

        /* Header Section */
        header {
            background-color: #000;
            color: #ffd700;
            padding: 10px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 4px rgba(255, 215, 0, 0.5);
        }

        .logo {
            display: flex;
            align-items: center;
        }

        .logo img {
            height: 50px;
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
            color: #ffd700;
            font-weight: bold;
            transition: color 0.3s;
        }

        nav ul li a:hover {
            color: #fff;
        }

        /* Menu Section Styling */
        .menu-section {
            text-align: center;
            padding: 50px 20px;
        }

        .menu-section h1 {
            font-size: 3rem;
            color: #ffd700;
            margin-bottom: 20px;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
        }

        .category-buttons {
            margin-bottom: 30px;
        }

        .category-buttons button {
            background-color: #ccff66;
            color: #000;
            border: none;
            padding: 10px 20px;
            margin: 5px;
            border-radius: 5px;
            font-size: 1rem;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .category-buttons button:hover {
            background-color: yellowgreen;
            color: #000;
        }

        .menu-items {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 30px;
            padding: 20px;
        }

        .menu-item {
            background-color: #343434;
            color: #ffd700;
            border-radius: 10px;
            overflow: hidden;
            width: 300px;
            box-shadow: 0 4px 8px rgba(255, 215, 0, 0.2);
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .menu-item:hover {
            transform: scale(1.05);
            box-shadow: 0 6px 12px rgb(0, 0, 0);
        }

        .menu-item img {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }

        .menu-item-content {
            padding: 20px;
            text-align: center;
        }

        .menu-item-content h3 {
            font-size: 1.5rem;
            margin-bottom: 10px;
        }

        .menu-item-content .price {
            font-size: 1.2rem;
            margin-bottom: 10px;
        }

        .menu-item-content button {
            background-color: #ffd700;
            color: #000;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            font-size: 1rem;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .menu-item-content button:hover {
            background-color: #fff;
            color: #000;
        }

        /* Footer Styling */
        footer {
            background-color: #000;
            color: #ffd700;
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
    </style>
    <script>
        function filterMenu(category) {
            const items = document.querySelectorAll('.menu-item');
            items.forEach(item => {
                if (category === 'all' || item.classList.contains(category)) {
                    item.style.display = 'block';
                } else {
                    item.style.display = 'none';
                }
            });
        }
    </script>
</head>
<body>
    <!-- Header Section -->
    <header>
        <div class="logo">
            <img src="images/logo.jpg" alt="Fast Food Point Logo">
            <h1>Fast Food Point</h1>
        </div>
        <nav>
            <ul>
                <li><a href="index.jsp">Home</a></li>
                <li><a href="about.jsp">About Us</a></li>
                <li><a href="menu.jsp" class="active">Menu</a></li>
                <li><a href="contact.jsp">Contact</a></li>
                <li><a href="cart.jsp">Cart</a></li>
              <!--  <li><a href="login.jsp">Login</a></li>-->
            </ul>
        </nav>
    </header>

    <!-- Menu Section -->
    <div class="menu-section">
        <h1>Our Menu</h1>
        <div class="category-buttons" id="category">
            <button onclick="filterMenu('all')">All💝</button>
            <button onclick="filterMenu('pizza')">Pizza🍕</button>
            <button onclick="filterMenu('burger')">Burger🍔</button>
            <button onclick="filterMenu('fries')">Fries🍟</button>
            <button onclick="filterMenu('drink')">Drink🥤</button>
            <button onclick="filterMenu('sandwich')">Sandwich🥪</button>
            <button onclick="filterMenu('noodle')">Noodles🍜</button>
        </div>

        <div class="menu-items">
            <%
                String[][] menuItems = {
                    {"burger", "Classic Burger", "5.99", "images/burger.jpg"},
                    {"fries", "Crispy Fries", "2.99", "images/frenchfries.png"},
                    {"pizza", "Margherita Pizza", "8.99", "images/pizza.jpg"},
                    {"drink", "Sprite", "3.99", "images/sprite.jpg"},
                    {"pizza","Italian Pizza","9.99","images/italian-pizza.jpg"},
                    {"drink","Pineapple Juice","2.99","images/Pineapple-Juice.jpg"},
                    {"drink","Fanta","3.99","images/fanta.jpg"},
                    {"burger","Hamburger","5.99","images/hamburger.png"},
                    {"noodle"," Veg Noodle","4.99","images/meggi.jpg"},
                    {"drink","Orange Juice","2.99","images/orange-juice.jpg"},
                    {"sandwich","Veg Sandwich","8.99","images/sandwich.png"},
                    {"drink","Strawberry Juice","3.99","images/strawberry-juice.jpg"}
                };

                for (String[] item : menuItems) {
            %>
           <div class="menu-item <%= item[0] %>">
                <img src="<%= item[3] %>" alt="<%= item[1] %>">
                <div class="menu-item-content">
                    <h3><%= item[1] %></h3>
                    <p class="price">$<%= item[2] %></p>
                     <button style="margin-bottom:10px;" onclick="viewDetails('<%= item[1] %>', '<%= item[2] %>', '<%= item[3] %>')">View Details</button>
                    <form action="cart.jsp" method="post">
                        <input type="hidden" name="itemName" value="<%= item[1] %>">
                        <input type="hidden" name="itemPrice" value="<%= item[2] %>">
                        <input type="hidden" name="itemImage" value="<%= item[3] %>">
                        <button type="submit">Add To Cart</button>
                    </form>
                </div>
            </div>
            <% } %>
        </div>
    </div> 

    <!-- Footer Section -->
    <footer>
        <p>&copy; 2025 Fast Food Point. All rights reserved.</p>
        <div class="social-icons">
            <img src="images/facebook.png" alt="Facebook">
            <img src="images/insta.png" alt="Instagram">
            <img src="images/twitt.png" alt="Twitter">
        </div>
    </footer>
    
    
    
    <script>
    function viewDetails(name, price, image) {
        const deliveryTime = new Date();
        deliveryTime.setMinutes(deliveryTime.getMinutes() + 30);
        const formattedTime = deliveryTime.toLocaleString();
        
        document.getElementById("detailImage").src = image;
        document.getElementById("detailName").textContent = name;
        document.getElementById("detailPrice").textContent = "$" + price;
        document.getElementById("detailTime").textContent = "Estimated Delivery: " + formattedTime;
        
        document.getElementById("detailsPopup").style.display = "flex";
    }
    
    function closeDetails() {
        document.getElementById("detailsPopup").style.display = "none";
    }
</script>

<div id="detailsPopup" style="display:none; position:fixed; top:0; left:0; width:100%; height:100%; background:rgba(0,0,0,0.8); justify-content:center; align-items:center;">
    <div style="background:#fff; padding:20px; border-radius:10px; text-align:center; width:300px;">
        <img id="detailImage" src="" alt="Item Image" style="width:100%; height:150px; object-fit:cover; border-radius:10px;">
        <h2 id="detailName" style="color:#000;"></h2>
        <p id="detailPrice" style="font-size:1.2rem; color:#ff9800;"></p>
        <p id="detailTime" style="font-size:1rem; color:#555;"></p>
        <button onclick="closeDetails()" style="background:#ff9800; color:#fff; border:none; padding:10px 15px; border-radius:5px; cursor:pointer;">Close</button>
    </div>
</div>    
</body>
</html>
--%>
    
    
    
    
    
    
    
    
    
  



<%@ page import="java.sql.*" %>
<%@ page import="sun.misc.BASE64Encoder" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Menu - Fast Food Point</title>
    <style>
        /* Your existing CSS styles */
         body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #fff;
            color: #ffd700;
        }

        /* Header Section */
        header {
            background-color: #000;
        //    color: #ffd700;
        color:white;
            padding: 10px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 4px rgba(255, 215, 0, 0.5);
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
          color:white;
            font-weight: bold;
            transition: color 0.3s;
        }

        nav ul li a:hover {
           // color: #fff;
           color:#ffd700;
        }

        header h1{
            color:#ffd700;
            padding-right: 250px;
        }
        /* Menu Section Styling */
        .menu-section {
            text-align: center;
            padding: 50px 20px;
        }

        .menu-section h1 {
            font-size: 3rem;
            color: #ffd700;
            color:black;
            margin-bottom: 20px;
         //   text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
        }

        .category-buttons {
            margin-bottom: 30px;
        }

        .category-buttons button {
           background-color: #ccff66;
          color: #000;
           
            border: none;
            padding: 10px 20px;
            margin: 5px;
            border-radius: 5px;
            font-size: 1rem;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .category-buttons button:hover {
            background-color: yellowgreen;
            color: #000;
        }

        .menu-items {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 30px;
            padding: 20px;
        }

        .menu-item {
           // background-color: #343434;
           background-color: whitesmoke;
           
           // color: #ffd700;
           color: black;
           
            border-radius: 10px;
            overflow: hidden;
            width: 300px;
            //box-shadow: 0 4px 8px rgba(255, 215, 0, 0.2);
            box-shadow: 0 4px 8px rgb(131,105,83);
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .menu-item:hover {
            transform: scale(1.05);
            box-shadow: 0 6px 12px rgb(0, 0, 0);
        }

        .menu-item img {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }

        .menu-item-content {
            padding: 20px;
            text-align: center;
        }

        .menu-item-content h3 {
            margin-top: 10px;
            font-size: 1.5rem;
            margin-bottom: 10px;
        }

        .menu-item-content .price {
            font-size: 1.2rem;
            margin-bottom: 10px;
        }

        .menu-item-content button {
            background-color: #ffd700;
            color: #000;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            font-size: 1rem;
            cursor: pointer;
            transition: background-color 0.3s;
           
        }

        .menu-item-content button:hover {
            background-color: #fff;
            color: #000;
        }
        
        .menu-item button {
   // background-color: #ffd700; /* Example: Orange color */
   background-color: #5f9ea0;
   // color: #000;
   color: white;
    border: none;
    padding: 10px 20px;
    font-size: 1rem;
    cursor: pointer;
    border-radius: 5px;
    transition: background-color 0.3s;
}

.menu-item button:hover {
    color: white; /* Darker shade on hover */
   // color:#000;
  background-color: #007474;
  // background-color: #757575 ;
}

.view:hover {
    background-color: green;
   
    color: white;
}

.menu-item img {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }

      /*  .menu-item {
          //  padding: 20px;
            text-align: center;
        }*/

        .menu-item h3 {
           // margin-top: 15px;
            font-size: 1.5rem;
          //  margin-bottom: 10px;
        }

        .menu-item .price {
            font-size: 1.2rem;
            margin-bottom: 10px;
        }




        /* Footer Styling */
        footer {
            background-color: #000;
          //  color: #ffd700;
          color:white;
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
        
        
        // for searchbar 
        .search-container {
    display: flex;
    align-items: center;
    background: #e3e3e3; /* Light grey background */
    padding: 5px;
    border-radius: 5px;
    width: fit-content;
    
}

.search-container input {
    padding: 10px;
    font-size: 16px;
    border: 2px solid yellow; /* Black border */
    border-radius: 5px;
    outline: none;
    width: 250px; /* Adjust width as needed */
}

.search-container button {
    background: #d3d3d3; /* Light grey button background */
    border: none;
    padding: 10px 15px;
    cursor: pointer;
    border-radius: 5px;
}

.search-container button:hover {
    background: #c0c0c0;
}

        
        
        
        
        
        
    </style>
    <!-- add by me -->
      <script>
        function filterMenu(category) {
            const items = document.querySelectorAll('.menu-item');
            items.forEach(item => {
                if (category === 'all' || item.classList.contains(category)) {
                    item.style.display = 'block';
                } else {
                    item.style.display = 'none';
                }
            });
        }
    </script>
    <!-- here-->
</head>
<body>
    <!--add my me-->
     <!-- Header Section -->
    <header>
        <div class="logo">
            <img src="images/ff.png" alt="Fast Food Point Logo">
            <h1>Fast Food Point</h1>
            <!-- Add this inside the <body>, before the menu items -->
<!--<div class="search-container" style="text-align: center; margin: 20px;">
    <input type="text" id="searchBar" placeholder="Search menu items..." onkeyup="searchMenu()"
        style="padding: 10px; width: 50%; font-size: 16px; border-radius: 5px; border: 1px solid #ccc;">-->
    <div class="search-container">
    <input type="text" id="searchBar" placeholder="Search menu items..." onkeyup="searchMenu()">
    <button>
        🔍
    </button>
</div>
</div>

<!--<script>
    function searchMenu() {
        let input = document.getElementById('searchBar').value.toLowerCase();
        let items = document.querySelectorAll('.menu-item');

        items.forEach(item => {
            let name = item.querySelector('h3').innerText.toLowerCase();
            if (name.includes(input)) {
                item.style.display = "block";
            } else {
                item.style.display = "none";
            }
        });
    }
</script>-->

<script>
function searchMenu() {
    let input = document.getElementById('searchBar').value.toLowerCase();
    let items = document.querySelectorAll('.menu-item');
    let noResultMessage = document.getElementById('noResultMessage');
    let found = false;

    items.forEach(item => {
        let name = item.querySelector('h3').innerText.toLowerCase();
        if (name.includes(input)) {
            item.style.display = "block";
            found = true;
        } else {
            item.style.display = "none";
        }
    });

    if (!found) {
        noResultMessage.style.display = "block";
    } else {
        noResultMessage.style.display = "none";
    }
}
</script>


        </div>
        <nav>
            <ul>
                <li><a href="index.jsp">Home</a></li>
                <li><a href="about.jsp">About Us</a></li>
                <li><a href="menu.jsp" class="active">Menu</a></li>
                <li><a href="contact.jsp">Contact</a></li>
                <li><a href="cart.jsp">Cart</a></li>
              <!--  <li><a href="login.jsp">Login</a></li>-->
            </ul>
        </nav>
    </header>
    <!--here-->
    <!--add by me-->
     <!-- Menu Section -->
  <%--  <div class="menu-section">
        <h1>Our Menu</h1>
        <div class="category-buttons" id="category">
            <button onclick="filterMenu('all')">All💝</button>
            <button onclick="filterMenu('pizza')">Pizza🍕</button>
            <button onclick="filterMenu('burger')">Burger🍔</button>
            <button onclick="filterMenu('fries')">Fries🍟</button>
            <button onclick="filterMenu('drink')">Drink🥤</button>
            <button onclick="filterMenu('sandwich')">Sandwich🥪</button>
            <button onclick="filterMenu('noodle')">Noodles🍜</button>
        </div>

        <div class="menu-items">
            <%
                String[][] menuItems = {
                    {"burger", "Classic Burger", "5.99", "images/burger.jpg"},
                    {"fries", "Crispy Fries", "2.99", "images/frenchfries.png"},
                    {"pizza", "Margherita Pizza", "8.99", "images/pizza.jpg"},
                    {"drink", "Sprite", "3.99", "images/sprite.jpg"},
                    {"pizza","Italian Pizza","9.99","images/italian-pizza.jpg"},
                    {"drink","Pineapple Juice","2.99","images/Pineapple-Juice.jpg"},
                    {"drink","Fanta","3.99","images/fanta.jpg"},
                    {"burger","Hamburger","5.99","images/hamburger.png"},
                    {"noodle"," Veg Noodle","4.99","images/meggi.jpg"},
                    {"drink","Orange Juice","2.99","images/orange-juice.jpg"},
                    {"sandwich","Veg Sandwich","8.99","images/sandwich.png"},
                    {"drink","Strawberry Juice","3.99","images/strawberry-juice.jpg"}
                };

                for (String[] item : menuItems) {
            %>
           <div class="menu-item <%= item[0] %>">
                <img src="<%= item[3] %>" alt="<%= item[1] %>">
                <div class="menu-item-content">
                    <h3><%= item[1] %></h3>
                    <p class="price">$<%= item[2] %></p>
                     <button style="margin-bottom:10px;" onclick="viewDetails('<%= item[1] %>', '<%= item[2] %>', '<%= item[3] %>')">View Details</button>
                    <form action="cart.jsp" method="post">
                        <input type="hidden" name="itemName" value="<%= item[1] %>">
                        <input type="hidden" name="itemPrice" value="<%= item[2] %>">
                        <input type="hidden" name="itemImage" value="<%= item[3] %>">
                        <button type="submit">Add To Cart</button>
                    </form>
                </div>
            </div>
            <% } %>
        </div>
    </div> 
    <!--here-->
    <h1>Our Menu</h1>
    
    <div class="menu-items">
        <%
            String dbURL = "jdbc:ucanaccess://C:/Users/LENOVO/Documents/FastFoodPoint.mdb";
            Connection conn = null;
            PreparedStatement stmt = null;
            ResultSet rs = null;
            BASE64Encoder encoder = new BASE64Encoder();

            try {
                Class.forName("sun.jdbc.odbc.JdbcOdbcDriver"); // Load Access Driver
                conn = DriverManager.getConnection("jdbc:odbc:food");
                stmt = conn.prepareStatement("SELECT * FROM food_items");
                rs = stmt.executeQuery();

                while (rs.next()) {
                    String category = rs.getString("category").toLowerCase();
                    String name = rs.getString("food_name");
                    double price = rs.getDouble("price");
                    byte[] imageBytes = rs.getBytes("image");
                    String base64Image = (imageBytes != null) ? encoder.encode(imageBytes) : "";
        %>
                <div class="menu-item <%= category %>">
                    <% if (!base64Image.isEmpty()) { %>
                        <img src="data:image/jpeg;base64,<%= base64Image %>" alt="<%= name %>">
                    <% } else { %>
                        <img src="images/default.jpg" alt="No Image Available">
                    <% } %>
                    <h3><%= name %></h3>
                    <p class="price">₹<%= price %></p>
                </div>
        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
        %>
                <p style="color:red;">Error loading menu: <%= e.getMessage() %></p>
        <%
            } finally {
                // Close resources manually
                if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                if (stmt != null) try { stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
            }
        %>
    </div> --%>
  
  
  
  <div class="menu-section">
      <h1>Our Menu</h1>
    <div class="category-buttons" id="category">
        <button onclick="filterMenu('all')">All💝</button>
        <button onclick="filterMenu('pizza')">Pizza🍕</button>
        <button onclick="filterMenu('burger')">Burger🍔</button>
        <button onclick="filterMenu('fries')">Fries🍟</button>
        <button onclick="filterMenu('drink')">Drink🥤</button>
        <button onclick="filterMenu('sandwich')">Sandwich🥪</button>
        <button onclick="filterMenu('noodle')">Noodles🍜</button>
    </div>

      <p id="noResultMessage" style="display: none; text-align: center; color: red; font-weight: bold; font-size: 60px;">
    Item not found!
</p>

      
      
    <div class="menu-items">
        <%
            // Static Menu Items
            String[][] staticMenuItems = {
                {"burger", "Classic Burger", "5.99", "images/burger.jpg"},
                {"fries", "Crispy Fries", "2.99", "images/frenchfries.png"},
                {"pizza", "Margherita Pizza", "8.99", "images/pizza.jpg"},
                {"drink", "Sprite", "3.99", "images/sprite.jpg"},
                {"pizza", "Italian Pizza", "9.99", "images/italian-pizza.jpg"},
                {"drink", "Pineapple Juice", "2.99", "images/Pineapple-Juice.jpg"},
                {"drink", "Fanta", "3.99", "images/fanta.jpg"},
                {"burger", "Hamburger", "5.99", "images/hamburger.png"},
                {"noodle", "Veg Noodle", "4.99", "images/meggi.jpg"},
                {"drink", "Orange Juice", "2.99", "images/orange-juice.jpg"},
                {"sandwich", "Veg Sandwich", "8.99", "images/sandwich.png"},
                {"drink", "Strawberry Juice", "3.99", "images/strawberry-juice.jpg"}
            };

            // Loop through static menu items
            for (String[] item : staticMenuItems) {
        %>
        <div class="menu-item <%= item[0] %>">
            <img src="<%= item[3] %>" alt="<%= item[1] %>">
            <div class="menu-item-content">
                <h3><%= item[1] %></h3>
                <p class="price">$<%= item[2] %></p>
                <button class="view" style="margin-bottom:10px;   " onclick="viewDetails('<%= item[1] %>', '<%= item[2] %>', '<%= item[3] %>')">View Details</button>
                <form action="cart.jsp" method="post">
                    <input type="hidden" name="itemName" value="<%= item[1] %>">
                    <input type="hidden" name="itemPrice" value="<%= item[2] %>">
                    <input type="hidden" name="itemImage" value="<%= item[3] %>">
                    <button  type="submit">Add To Cart</button>
                </form>
            </div>
        </div>
        <% } %>

        <%
            // Dynamic Menu Items from Database
            String dbURL = "jdbc:ucanaccess://C:/Users/LENOVO/Documents/FastFoodPoint.mdb";
            Connection conn = null;
            PreparedStatement stmt = null;
            ResultSet rs = null;
            BASE64Encoder encoder = new BASE64Encoder();

            try {
                Class.forName("sun.jdbc.odbc.JdbcOdbcDriver"); // Load Access Driver
                conn = DriverManager.getConnection("jdbc:odbc:food");
                stmt = conn.prepareStatement("SELECT * FROM food_items");
                rs = stmt.executeQuery();

                while (rs.next()) {
                    String category = rs.getString("category").toLowerCase();
                    String name = rs.getString("food_name");
                    double price = rs.getDouble("price");
                    byte[] imageBytes = rs.getBytes("image");
                    String base64Image = (imageBytes != null) ? encoder.encode(imageBytes) : "";
        %>
                <div class="menu-item <%= category %>">
                    <% if (!base64Image.isEmpty()) { %>
                        <img src="data:image/jpeg;base64,<%= base64Image %>" alt="<%= name %>">
                    <% } else { %>
                        <img src="images/default.jpg" alt="No Image Available">
                    <% } %>
                    <h3><%= name %></h3>
                    <p class="price">$<%= price %></p>
                  <!-- <button style="margin-bottom:10px;" onclick="viewDetails('<%= name %>', '<%= price %>', 'data:image/jpeg;base64,<%= base64Image %>')">View Details</button>-->
                    <button class="view" style="margin-bottom:10px; " onclick='viewDetails("<%= name %>", "<%= price %>", "data:image/jpeg;base64,<%= base64Image.replace("\n", "").replace("\r", "") %>")'>View Details</button>

                   


                    
                    <form action="cart.jsp" method="post">
                        <input type="hidden" name="itemName" value="<%= name %>">
                        <input type="hidden" name="itemPrice" value="<%= price %>">
                        <input type="hidden" name="itemImage" value="data:image/jpeg;base64,<%= base64Image %>">
                        <button style="margin-bottom:15px;" type="submit">Add To Cart</button>
                    </form>
                </div>
        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
        %>
                <p style="color:red;">Error loading menu: <%= e.getMessage() %></p>
        <%
            } finally {
                // Close resources manually
                if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                if (stmt != null) try { stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
            }
        %>
    </div>
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
    function viewDetails(name, price, image) {
        const deliveryTime = new Date();
        deliveryTime.setMinutes(deliveryTime.getMinutes() + 30);
        const formattedTime = deliveryTime.toLocaleString();
        
        document.getElementById("detailImage").src = image;
        document.getElementById("detailName").textContent = name;
        document.getElementById("detailPrice").textContent = "$" + price;
        document.getElementById("detailTime").textContent = "Estimated Delivery:"+formattedTime;
      
        
        document.getElementById("detailsPopup").style.display = "flex";
    }
    
    function closeDetails() {
        document.getElementById("detailsPopup").style.display = "none";
    }
</script>

<div id="detailsPopup" style="display:none; position:fixed; top:0; left:0; width:100%; height:100%; background:rgba(0,0,0,0.8); justify-content:center; align-items:center;">
    <div style="background:#fff; padding:20px; border-radius:10px; text-align:center; width:300px;">
        <img id="detailImage" src="" alt="Item Image" style="width:100%; height:150px; object-fit:cover; border-radius:10px;">
        <h2 id="detailName" style="color:#000;"></h2>
        <p id="detailPrice" style="font-size:1.2rem; color:#ff9800;"></p>
        <p id="detailTime" style="font-size:1rem; color:#555;"></p>
        <p style="font-size:1rem; color:#555;"> Get 5% off! </p>
        <p style="font-size:1rem; color:#555;"> Free Delivery on Order up to $3.99. </p>
        <button onclick="closeDetails()" style="background:#ff9800; color:#fff; border:none; padding:10px 15px; border-radius:5px; cursor:pointer;">Close</button>
    </div>
</div>   
     
     
    
  
     
     
</body>
</html>
