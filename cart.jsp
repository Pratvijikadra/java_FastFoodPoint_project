<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Arrays" %>
<%
    // Initialize the cart if it doesn't exist
    List<String[]> cart = null;
    Object cartObj = session.getAttribute("cart");

    if (cartObj == null) {
        // Initialize a new cart if it doesn't exist in the session
        cart = new ArrayList<String[]>();
        session.setAttribute("cart", cart);

    } else if (cartObj instanceof List) {
        try {
            cart = (List<String[]>) cartObj;
        } catch (ClassCastException e) {
            // Reinitialize the cart if casting fails
            cart = new ArrayList<String[]>();
            session.setAttribute("cart", cart);
            out.println("Error: Session cart type mismatch. Reinitialized cart.");
        }
    } else {
        // Reinitialize cart if session attribute isn't compatible
        cart = new ArrayList<String[]>();
        session.setAttribute("cart", cart);
        out.println("Error: Session cart is not compatible. Reinitialized cart.");
    }

    // Retrieve item details from the request parameters
    String itemName = request.getParameter("itemName");
    String itemPrice = request.getParameter("itemPrice");
    String itemImage = request.getParameter("itemImage");
    String action = request.getParameter("action");
    String itemIndexStr = request.getParameter("itemIndex");

    // Add item to cart if not an action request
    if (itemName != null && !itemName.trim().isEmpty() &&
        itemPrice != null && !itemPrice.trim().isEmpty() &&
        itemImage != null && !itemImage.trim().isEmpty() && action == null) {

        // Add new item to cart with default quantity of 1
        cart.add(new String[]{itemName, itemPrice, itemImage, "1"});
        session.setAttribute("cart", cart);
    }

    // Handle cart actions (increase/decrease/remove)
    if (action != null && itemIndexStr != null) {
        int itemIndex = Integer.parseInt(itemIndexStr);

        if (itemIndex >= 0 && itemIndex < cart.size()) {
            String[] cartItem = cart.get(itemIndex);

            // Ensure the cart item has the correct number of fields (4 elements)
            if (cartItem.length == 4) {
                if ("remove".equals(action)) {
                    cart.remove(itemIndex); // Remove item from cart
                } else if ("increase".equals(action)) {
                    int quantity = Integer.parseInt(cartItem[3]) + 1;
                    cartItem[3] = String.valueOf(quantity); // Increase quantity
                } else if ("decrease".equals(action)) {
                    int quantity = Integer.parseInt(cartItem[3]) - 1;
                    if (quantity > 0) {
                        cartItem[3] = String.valueOf(quantity); // Decrease quantity
                    }
                }
            }
            session.setAttribute("cart", cart); // Update cart in session
        }
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cart - Fast Food Point</title>
    <style>
        /* CSS styles for the cart page */
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            color: #333;
        }
        .cart-container {
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            color: #ff5722;
            text-align: center;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 10px;
            text-align: center;
            border: 1px solid #ddd;
        }
        th {
            background-color: #ff5722;
            color: #fff;
        }
        img {
            width: 80px;
            height: 80px;
            border-radius: 8px;
            object-fit: cover;
        }
        .empty-cart {
            text-align: center;
            margin: 20px 0;
            color: #777;
        }
       
        .total-price {
            font-size: 18px;
            font-weight: bold;
            text-align: center;
            margin-top: 20px;
        }
          /* Button Styling */
        .checkout-button {
            display: inline-block;
            background-color: #28a745; /* Green background */
            color: white; /* White text */
            padding: 10px 20px;
            font-size: 18px;
            border-radius: 5px;
            text-decoration: none;
            text-align: center;
            margin-top: 20px;
            width: 150px;
        }
        .checkout-button:hover {
            background-color: #218838; /* Darker green on hover */
        }
        
        .symbol {
  font-size: 20px; /* Adjust size as needed */
  text-decoration: none;
  margin: 0 10px;
}

.plus {
  color: green;
}

.minus{
    color: orangered;
}
.remove {
  color: red;
}
       
.symbol:hover {
  opacity: 0.8;
  transform: scale(1.1);
}

        
    </style>
</head>
<body>
    <div class="cart-container">
        <h1>Your Cart</h1>
        <% if (cart != null && !cart.isEmpty()) { %>
        <table>
            <thead>
                <tr>
                    <th>Item</th>
                    <th>Item Name</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    double totalPrice = 0;
                    for (int i = 0; i < cart.size(); i++) {
                        String[] cartItem = cart.get(i);
                        if (cartItem.length == 4) {
                            double itemPriceDouble = Double.parseDouble(cartItem[1]);
                            int quantity = Integer.parseInt(cartItem[3]);
                            double itemTotal = itemPriceDouble * quantity;
                            totalPrice += itemTotal;
                %>
                <tr>
                    <td><img src="<%= cartItem[2] %>" alt="<%= cartItem[0] %>"></td>
                    <td><%= cartItem[0] %></td>
                    <td>$<%= cartItem[1] %></td>
                    <td><%= cartItem[3] %></td>
                    <td>
                        <a href="?action=increase&itemIndex=<%= i %>" class="symbol plus"> Increase </a>  
                        <a href="?action=decrease&itemIndex=<%= i %>" class="symbol minus"> Decrease </a>  
                        <a href="?action=remove&itemIndex=<%= i %>" class="symbol remove"> Remove </a>
                    </td>
                </tr>
                <% 
                        }
                    }
                %>
            </tbody>
        </table>
    
      <%@ page import="java.text.DecimalFormat" %>

<%
    // Format total price to 2 decimal places
    DecimalFormat df = new DecimalFormat("0.00");
    String formattedTotal = df.format(totalPrice);
%>

<div class="total-price">
    Total: $<%= formattedTotal %>
</div>
        <% } else { %>
        <div class="empty-cart">
            <p>Your cart is empty.</p>
        </div>
        <% } %>
        <div style="text-align: center; margin-top: 20px;">
            <button onclick="window.location.href='order.jsp'" class="checkout-button">Order Now</button>
        </div>
    </div>
</body>
</html>








