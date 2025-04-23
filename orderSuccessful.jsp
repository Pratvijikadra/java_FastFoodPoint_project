<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Placed Successfully</title>
    <style>
        body {
            margin: 0;
            font-family: 'Arial', sans-serif;
            background-color: #f3f9f7;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            text-align: center;
        }

        .success-container {
            background: #fff;
            padding: 50px;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
            animation: fadeIn 0.5s ease-in-out;
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

        .icon {
            width: 100px;
            height: 100px;
            margin: 0 auto 20px;
            border-radius: 50%;
            background: #4caf50;
            display: flex;
            justify-content: center;
            align-items: center;
            animation: popIn 0.6s ease-in-out;
        }

        @keyframes popIn {
            from {
                transform: scale(0);
            }
            to {
                transform: scale(1);
            }
        }

        .icon::after {
            content: "✔";
            font-size: 50px;
            color: #fff;
        }

        h1 {
            font-size: 2rem;
            color: #333;
            margin-bottom: 10px;
        }

        p {
            font-size: 1rem;
            color: #666;
            margin: 0 0 20px;
        }

        .btn-container {
            display: flex;
            justify-content: center;
            gap: 15px;
        }

        button {
            padding: 10px 20px;
            font-size: 1rem;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .home-btn {
            background-color: #4caf50;
            color: #fff;
        }

        .home-btn:hover {
            background-color: #388e3c;
        }
    </style>
</head>
<body>
    <div class="success-container">
        <div class="icon"></div>
        <h1>Order Placed Successfully!🎉</h1>
        <p>Your order has been placed. We will notify you when it's ready for delivery.</p>
        <p><b>Thank You! 😊</b></p>

       <%-- <p><h2>Your Details:</h2></p>
        <p><strong>Name:</strong> <%= request.getParameter("name") %></p>
        <p><strong>Email:</strong> <%= request.getParameter("email") %></p>
        <p><strong>Phone:</strong> <%= request.getParameter("phone") %></p>
        <p><strong>Delivery Address:</strong> <%= request.getParameter("address") %></p>
        <p><strong>Payment Method:</strong> <%= request.getParameter("paymentMethod") %></p>--%>
      
      
     
      
      

        <div class="btn-container">
            <button class="home-btn" onclick="window.location.href='index.jsp'">Back to Home</button>
        </div>
    </div>
</body>
</html>














