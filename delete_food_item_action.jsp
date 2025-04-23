<%--<%@ page import="java.sql.*" %>
<%@ page import="javax.swing.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Food Item</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            padding: 20px;
            text-align: center;
        }
        .message {
            font-size: 18px;
            font-weight: bold;
            padding: 15px;
            border-radius: 5px;
            width: 50%;
            margin: auto;
        }
        .success {
            background-color: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
        }
        .error {
            background-color: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
        }
    </style>
</head>
<body>

<%
    // Get food ID from form
    String foodId = request.getParameter("foodId");
    
    // Database connection details
    String dbURL = "jdbc:ucanaccess://C:/Users/LENOVO/Documents/FastFoodPoint.mdb";
    Connection conn = null;
    PreparedStatement stmt = null;
    
    try {
        if (foodId != null && !foodId.isEmpty()) {
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver"); // Load UCanAccess driver
            conn = DriverManager.getConnection("jdbc:odbc:food");
            
            // SQL DELETE statement
            String sql = "DELETE FROM food_items WHERE food_id = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, Integer.parseInt(foodId));

            int rowsAffected = stmt.executeUpdate();
            
            if (rowsAffected > 0) {
%>
                <div class="message success">Food item with ID <%= foodId %> deleted successfully.</div>
<%
            } else {
%>
                <div class="message error">Error: No food item found with ID <%= foodId %>.</div>
<%
            }
        } else {
%>
            <div class="message error">Error: Food ID cannot be empty.</div>
<%
        }
    } catch (Exception e) {
%>
        <div class="message error">Error: <%= e.getMessage() %></div>
<%
        e.printStackTrace();
    } finally {
        try { if (stmt != null) stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
        try { if (conn != null) conn.close(); } catch (SQLException e) { e.printStackTrace(); }
    }
%>

<br>
<a href="manage_food_items.jsp">Back to Manage Items</a>

</body>
</html>
--%>


















<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Food Item</title>
    <script>
        function showAlert(message, isSuccess) {
            alert(message);
            window.location.href = "manage_food_item.jsp";
        }
    </script>
</head>
<body>

<%
    String foodId = request.getParameter("foodId");
    String dbURL = "jdbc:ucanaccess://C:/Users/LENOVO/Documents/FastFoodPoint.mdb";
    Connection conn = null;
    PreparedStatement stmt = null;
    String message = "";
    boolean isSuccess = false;
    
    try {
        if (foodId != null && !foodId.isEmpty()) {
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            conn = DriverManager.getConnection("jdbc:odbc:food");
            
            String sql = "DELETE FROM food_items WHERE food_id = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, Integer.parseInt(foodId));
            
            int rowsAffected = stmt.executeUpdate();
            
            if (rowsAffected > 0) {
                message = "Food item with ID " + foodId + " deleted successfully.";
                isSuccess = true;
            } else {
                message = "Error: No food item found with ID " + foodId + ".";
            }
        } else {
            message = "Error: Food ID cannot be empty.";
        }
    } catch (Exception e) {
        message = "Error: " + e.getMessage();
        e.printStackTrace();
    } finally {
        try { if (stmt != null) stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
        try { if (conn != null) conn.close(); } catch (SQLException e) { e.printStackTrace(); }
    }
%>

<script>
    showAlert("<%= message %>", <%= isSuccess %>);
</script>

</body>
</html>










