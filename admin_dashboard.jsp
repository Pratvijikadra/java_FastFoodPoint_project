<!--<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - Fast Food Point</title>
    <style>
        /* General Styling */
        body {
            margin: 0;
            font-family: 'Arial', sans-serif;
            background-color: #fff;
            color: #333;
            overflow-x: hidden;
        }

        h1, h2 {
            font-weight: bold;
            text-transform: uppercase;
            text-align: center;
        }

        /* Header Styling */
        header {
            background-color: #f8f9fa;
            padding: 15px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .logo {
            font-size: 1.5rem;
            color: #ff69b4;
            font-weight: bold;
            text-transform: uppercase;
        }

        .logout-btn {
            padding: 10px 20px;
            border: none;
            background-color: #ff69b4;
            color: #fff;
            border-radius: 5px;
            cursor: pointer;
            transition: transform 0.3s;
        }

        .logout-btn:hover {
            transform: scale(1.1);
        }

        /* Dashboard Grid */
        .dashboard {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            padding: 20px;
        }

        .card {
            background: #f9f9f9;
            border: 2px solid #ff69b4;
            border-radius: 10px;
            text-align: center;
            padding: 20px;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s, background-color 0.3s;
        }

        .card:hover {
            transform: translateY(-10px);
            background-color: #ffe6f2;
        }

        .card h2 {
            color: #ff69b4;
            margin-bottom: 15px;
        }

        .card p {
            color: #555;
            font-size: 1rem;
        }

        /* Welcome Animation */
        .welcome {
            text-align: center;
            font-size: 2.5rem;
            color: #333;
            margin-top: 20px;
            animation: fadeIn 2s ease-in-out;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* Admin Features Styling */
        .action {
            margin-top: 10px;
            padding: 10px;
            background-color: #ff69b4;
            color: #fff;
            text-transform: uppercase;
            font-weight: bold;
            border-radius: 5px;
            border: none;
            cursor: pointer;
            transition: transform 0.3s;
        }

        .action:hover {
            transform: scale(1.1);
        }
    </style>
</head>
<body>
    <!-- Header Section -->
  <!--  <header>
        <div class="logo">Fast Food Point</div>
        <button class="logout-btn" onclick="window.location.href='index.html';">Logout</button>
    </header>

    <!-- Welcome Section -->
   <!-- <div class="welcome">
        Welcome, Admin!
    </div>

    <!-- Dashboard Features -->
   <!-- <div class="dashboard">
        <div class="card">
            <h2>Manage Customers</h2>
            <p>View and manage all registered customers of the platform.</p>
            <button class="action" onclick="window.location.href='manage_users.jsp';">Go</button>
        </div>
        <div class="card">
            <h2>Manage Products</h2>
            <p>Add, update, or remove products available on the menu.</p>
            <button class="action" onclick="window.location.href='manage_products.jsp';">Go</button>
        </div>
        <div class="card">
            <h2>View Orders</h2>
            <p>Track and manage all customer orders in real time.</p>
            <button class="action" onclick="window.location.href='view_orders.jsp';">Go</button>
        </div>
        <div class="card">
            <h2>Analytics</h2>
            <p>View sales and performance analytics to improve services.</p>
            <button class="action" onclick="window.location.href='analytics.jsp';">Go</button>
        </div>
        <div class="card">
            <h2>Settings</h2>
            <p>Update account settings or platform preferences.</p>
            <button class="action" onclick="window.location.href='settings.jsp';">Go</button>
        </div>
    </div>
</body>
</html>-->
 
 
 
 
 
 
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - Fast Food Point</title>
    <style>
        /* General Styling */
        body {
            margin: 0;
            font-family: 'Arial', sans-serif;
            background-color: #f4f6f9;
            color: #333;
            overflow-x: hidden;
        }

        h1, h2 {
            font-weight: bold;
            text-transform: uppercase;
            text-align: center;
        }

        /* Header Styling */
        header {
            background-color: #1a73e8; /* Professional Blue */ 
            padding: 15px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .logo {
            font-size: 1.5rem;
            color: #fff;
            font-weight: bold;
            text-transform: uppercase;
        }

        .logout-btn {
            padding: 10px 20px;
            border: none;
            background-color: #f44336; /* Red for Logout */
            color: #fff;
            border-radius: 5px;
            cursor: pointer;
            transition: transform 0.3s, background-color 0.3s;
        }

        .logout-btn:hover {
            transform: scale(1.1);
            background-color: #d32f2f;
        }

        /* Dashboard Grid */
       /* .dashboard {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            padding: 20px;
        }*/
       
       
      

   /*    .card {
            background: #ffffff;
            border: 2px solid #1a73e8; /* Blue Border  
            border-radius: 10px;
            text-align: center;
            padding: 20px;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s, background-color 0.3s;
        } */
   
   
   .dashboard {
    display: flex;
    flex-wrap: wrap;
    gap: 20px;
    justify-content: center;
}

.card {
    width: 25%; /* Adjust width to fit 3 in a row */
    min-width: 250px;
    border: 2px solid #1a73e8;  
    padding: 20px;
    background: #ffffff;
    border-radius: 10px;
    box-shadow:  0 6px 12px rgba(0, 0, 0, 0.1);
    text-align: center;
     transition: transform 0.3s, background-color 0.3s;
}
   

       
   
       
        .card:hover {
            transform: translateY(-10px);
            background-color: #e8f0fe; /* Light Blue Hover */
        }

        .card h2 {
            color: #1a73e8; /* Blue Text */
            margin-bottom: 15px;
        }

        .card p {
            color: #555;
            font-size: 1rem;
        }

        /* Welcome Animation */
        .welcome {
            text-align: center;
            font-size: 2.5rem;
            color: #333;
            margin-top: 20px;
            animation: fadeIn 2s ease-in-out;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* Admin Features Styling */
        .action {
            margin-top: 10px;
            padding: 10px;
            background-color: #1a73e8; /* Blue Buttons */
            color: #fff;
            text-transform: uppercase;
            font-weight: bold;
            border-radius: 5px;
            border: none;
            cursor: pointer;
            transition: transform 0.3s, background-color 0.3s;
        }

        .action:hover {
            transform: scale(1.1);
            background-color: #0b57d0; /* Darker Blue Hover */
        }
        
        
        /* additional */
        @keyframes confetti-fall {
    0% { transform: translateY(-100vh) rotate(0deg); opacity: 1; }
    100% { transform: translateY(100vh) rotate(720deg); opacity: 0; }
}


:root {
    --color: #ff4757; /* Default fallback color */
}

.confetti {
    position: fixed;
    top: 0;
    left: 50%;
    width: 10px;
    height: 15px;
    background-color: var(--color, #ff4757); /* Fallback color */
    opacity: 0.8;
    transform-origin: center;
    animation: confetti-fall 3s ease-out forwards;
}


        /* addtional above */
        
        
        
    </style>
</head>
<body>
    <!-- Header Section -->
    <header>
        <div class="logo">Fast Food Point</div>
        <button class="logout-btn" onclick="window.location.href='index.jsp';">Logout</button>
    </header>

    <!-- Welcome Section -->
    <div class="welcome"><br>
        Welcome, Admin! 
    </div><br><br><br>

    <!-- Dashboard Features -->
    <div class="dashboard">
        <div class="card">
            <h2>Registered Customers👤</h2>
            <p>View list of all registered customers of the platform.</p>
            <button class="action" onclick="window.location.href='manage_customers.jsp';">Go</button>
        </div>
        <div class="card">
            <h2>Manage Food Items🍽️</h2>
            <p>Add, update, or remove Food Item available on the menu.</p>
            <button class="action" onclick="window.location.href='manage_food_item.jsp';">Go</button>
        </div>
        <div class="card">
            <h2>View Orders🛒</h2>
            <p>Track and manage all customer orders in real time.</p>
            <button class="action" onclick="window.location.href='view_orders.jsp';">Go</button>
        </div>
        
        
        
         <div class="card">
            <h2>Customers contact📧</h2>
            <p>View list of customers that want to contact the Fast Food Point.</p>
            <button class="action" onclick="window.location.href='show_contacts.jsp';">Go</button>
        </div>
        
        
        
        <div class="card">
            <h2>Analytics📈</h2>
            <p>View sales and performance analytics to improve services.</p>
            <button class="action" onclick="window.location.href='analytics.jsp';">Go</button>
        </div>
        <div class="card">
            <h2>Settings⚙️</h2>
            <p>Update account settings or platform preferences.</p>
            <button class="action" onclick="window.location.href='settings.jsp';">Go</button>
        </div>
    </div>
    
    <script>
    function createConfettiPiece() {
    const confetti = document.createElement("div");
    confetti.classList.add("confetti");
    document.body.appendChild(confetti);

    // Randomize position, size, and color
    confetti.style.left = Math.random() * 100 + "vw";
    confetti.style.width = Math.random() * 10 + 5 + "px";
    confetti.style.height = Math.random() * 15 + 5 + "px";
    
    // Random bright colors
    const colors = ["#ff4757", "#1e90ff", "#2ed573", "#f9ca24", "#e84393"];
    confetti.style.setProperty("--color", colors[Math.floor(Math.random() * colors.length)]);

    // Remove confetti after animation
    setTimeout(() => confetti.remove(), 3000);
}

// Create multiple confetti pieces
function startConfetti() {
    for (let i = 0; i < 50; i++) {
        setTimeout(createConfettiPiece, i * 50);
    }
}

// Run on page load
window.onload = startConfetti;

    </script>
    
</body>
</html>
