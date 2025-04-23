<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%--<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Place Your Order - Fast Food Point</title>
    <style>
        body {
            margin: 0;
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f9;
            color: #333;
        }

        .order-form-container {
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            animation: slideIn 0.5s ease-in-out;
        }

        .order-form-container h1 {
            text-align: center;
            color: #ff5722;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }

        .form-group input, .form-group select, .form-group textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 1rem;
        }

        .form-group input:focus, .form-group select:focus, .form-group textarea:focus {
            border-color: #ff5722;
            outline: none;
        }

        .submit-btn {
            display: block;
            width: 100%;
            background-color: #4caf50;
            color: #fff;
            border: none;
            padding: 10px;
            font-size: 1.2rem;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.3s;
        }

        .submit-btn:hover {
            background-color: #388e3c;
            transform: scale(1.05);
        }

        .form-group .required {
            color: red;
        }

        @keyframes slideIn {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>
    <script>
        function handlePaymentMethodChange() {
            const paymentMethod = document.getElementById("payment-method").value;
            if (paymentMethod === "card") {
                window.location.href = "creditdebit.html"; // Redirect to creditdebit.html
            }
            else if(paymentMethod === "upi") {
                window.location.href = "upi.html";
            }
        }
    </script>
</head>
<body>
    <div class="order-form-container">
        <h1>Place Your Order</h1>
        <form action="order" method="post">
            <form action="orderSuccessfull.jsp" method="post">
            <div class="form-group">
                <label for="name">Full Name <span class="required"> </span></label>
                <input type="text" id="name" name="name" required>
            </div>
            <div class="form-group">
                <label for="email">Email <span class="required"> </span></label>
                <input type="email" id="email" name="email" required>
            </div>
            <div class="form-group">
                <label for="phone">Phone Number <span class="required"> </span></label>
                <input type="tel" id="phone" name="phone" required>
            </div>
            <div class="form-group">
                <label for="address">Delivery Address <span class="required"> </span></label>
                <textarea id="address" name="address" rows="3" required></textarea>
            </div>
            <div class="form-group">
                <label for="payment-method">Payment Method <span class="required"> </span></label>
                <select id="payment-method" name="paymentMethod" required onchange="handlePaymentMethodChange()">
                    <option value="" disabled selected>Select Payment Method</option>
                    <option value="cash">Cash on Delivery</option>
                    <option value="card">Credit/Debit Card</option>
                    <option value="upi">UPI Payment</option>
                </select>
            </div>
            <button type="submit" class="submit-btn"> Place Order </a></button>
            </form>
        </form>
        
    </div>
</body>
</html>
--%>












<%@ page import="java.util.List" %>
<%@ page import="java.text.DecimalFormat" %>
<%
   // HttpSession session = request.getSession(false); // Get existing session, if any
    String username = null;

    if (session != null) {
        username = (String) session.getAttribute("username"); // Retrieve username from session
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Place Your Order - Fast Food Point</title>
    <style>
        body {
            margin: 0;
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f9;
            color: #333;
        }
        .order-form-container {
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            animation: slideIn 0.5s ease-in-out;
        }
        .order-form-container h1 {
            text-align: center;
            color: #ff5722;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }
        .form-group input, .form-group select, .form-group textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 1rem;
        }
        .submit-btn {
            display: block;
            width: 100%;
            background-color: #4caf50;
            color: #fff;
            border: none;
            padding: 10px;
            font-size: 1.2rem;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.3s;
        }
        .submit-btn:hover {
            background-color: #388e3c;
            transform: scale(1.05);
        }
        @keyframes slideIn {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>
    
    <script>
        function handlePaymentMethodChange() {
            const paymentMethod = document.getElementById("payment-method").value;
            if (paymentMethod === "card") {
                window.location.href = "creditdebit.html"; // Redirect to creditdebit.html
            }
            else if(paymentMethod === "upi") {
                window.location.href = "upi.html";
            }
        }
    </script>
    
</head>
<body>
    <div class="order-form-container">
        <h1>Place Your Order</h1>
       <!-- <h2><center> <i> <span>Hello <%= username %>!</span></center></i> </h2>-->
        <% if (username != null && !username.equalsIgnoreCase("admin")) { %>
            <h2><center><i><span>Hello <%= username %>!</span></i></center></h2>
        <% } %>
        <h3>Your Cart Items:</h3>
        <ul>
            
             
            <% 
                List<String[]> cart = (List<String[]>) session.getAttribute("cart");
                double totalPrice = 0;
                DecimalFormat df = new DecimalFormat("0.00");
                if (cart != null && !cart.isEmpty()) {
                    for (String[] cartItem : cart) {
                        double itemPrice = Double.parseDouble(cartItem[1]);
                        int quantity = Integer.parseInt(cartItem[3]);
                        double itemTotal = itemPrice * quantity;
                        totalPrice += itemTotal;
            %>
            <li><%= cartItem[0] %> - Quantity: <%= cartItem[3] %></li>
            <% 
                    } 
                } else { 
            %>
            <li>Your cart is empty.</li>
            <% } %>
        </ul>
        <h3>Total Price: $<%= df.format(totalPrice) %></h3>
        <form action="order" method="post">
            <div class="form-group">
                <label for="name">Full Name:</label>
                <input type="text" id="name" name="name" required>
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>
            </div>
            <div class="form-group">
                <label for="phone">Phone Number:</label>
                <input type="tel" id="phone" name="phone" required>
            </div>
            <div class="form-group">
                <label for="address">Delivery Address:</label>
                <textarea id="address" name="address" rows="3" required></textarea>
            </div>
            <div class="form-group">
               <!-- <label for="payment-method">Payment Method:</label>
                <select id="payment-method" name="paymentMethod" required>-->
                <label for="payment-method">Payment Method <span class="required"> </span></label>
                <select id="payment-method" name="paymentMethod" required onchange="handlePaymentMethodChange()">
                    <option value="" disabled selected>Select Payment Method</option>
                    <option value="cash">Cash on Delivery</option>
                    <option value="card">Credit/Debit Card</option>
                    <option value="upi">UPI Payment</option>
                </select>
            </div>
            <button type="submit" class="submit-btn">Place Order</button>
        </form>
    </div>
</body>
</html>
