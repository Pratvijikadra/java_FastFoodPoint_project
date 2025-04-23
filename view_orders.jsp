<%--<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Orders - Fast Food Point</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f9;
            margin: 0;
            padding: 20px;
        }
        h2 {
            text-align: center;
            color: #1a73e8;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background: #fff;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
        }
        th, td {
            padding: 12px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #1a73e8;
            color: white;
        }
        .status-btn {
            padding: 5px 10px;
            border: none;
            cursor: pointer;
            border-radius: 5px;
        }
        .pending {
            background-color: orange;
            color: white;
        }
        .completed {
            background-color: green;
            color: white;
        }
    </style>
</head>
<body>
    <h2>Customer Orders</h2>
    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Phone</th>
            <th>Address</th>
            <th>Payment Method</th>
            <th>Item Name</th>
            <th>Quantity</th>
            <th>Total</th>
            <th>Status</th>
        </tr>
        <%
            try {
                Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
                Connection con = DriverManager.getConnection("jdbc:odbc:food");
                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM orders");
                while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt("ID") %></td>
            <td><%= rs.getString("name") %></td>
            <td><%= rs.getString("email") %></td>
            <td><%= rs.getString("phone") %></td>
            <td><%= rs.getString("address") %></td>
            <td><%= rs.getString("payment_method") %></td>
            <td><%= rs.getString("item_name") %></td>
            <td><%= rs.getInt("quantity") %></td>
            <td><%= rs.getDouble("total") %></td>
            <td>
                <form action="update_order_status.jsp" method="post">
                    <input type="hidden" name="order_id" value="<%= rs.getInt("ID") %>">
                    <select name="status" class="status-btn">
                        <option value="Pending" class="pending">Pending</option>
                        <option value="Completed" class="completed">Completed</option>
                    </select>
                    <button type="submit" class="status-btn">Update</button>
                </form>
            </td>
        </tr>
        <%
                }
                con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </table>
</body>
</html>
--%>





















<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Orders - Fast Food Point</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f9;
            padding: 20px;
        }
         h2 {
             font-size: 2.5rem;
            text-align: center;
            color: #1a73e8;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            background: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #1a73e8;
            color: white;
        }
        .status-btn delete {
            padding: 8px 12px;
            border: none;
          //  cursor: pointer;
            color: #fff;
            border-radius: 5px;
        }
        .pending {
            background-color: #f44336;
        }
        .completed {
            background-color: #4caf50;
        }
    </style>
</head>
<body>
<center> <h2 class="c">Customer Orders</h2></center>
    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Phone</th>
            <th>Address</th>
            <th>Payment Method</th>
            <th>Item Name</th>
            <th>Quantity</th>
            <th>Total</th>
            <th>Status</th>
            <th>Action</th>
           
        </tr>
        
        
        <%
            try {
                Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
                Connection con = DriverManager.getConnection("jdbc:odbc:food");
                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT ID,name,email,phone,address,payment_method,item_name,quantity,total FROM orders");
                while (rs.next()) {
                    int id = rs.getInt("ID");
                    String name = rs.getString("name");
                    String email = rs.getString("email");
                    String phone = rs.getString("phone");
                    String address = rs.getString("address");
                    String payment = rs.getString("payment_method");
                    String item = rs.getString("item_name");
                    String quantity = rs.getString("quantity");
                    String total = rs.getString("total");
//                    String status = rs.getString("status");
        %>
        <tr>
            <td><%= id %></td>
            <td><%= name %></td>
            <td><%= email %></td>
            <td><%= phone %></td>
            <td><%= address %></td>
            <td><%= payment %></td>
            <td><%= item %></td>
            <td><%= quantity %></td>
            <td><%= total %></td>
         
   
            
<td>
    <select id="status" onchange="lockSelection(this)">
        <option value="Pending">Pending</option>
        <option value="Completed">Completed</option>
    </select>
</td>

<script>
    // Load status from local storage on page load
   <%-- window.onload = function () {
        let savedStatus = localStorage.getItem("orderStatus");
        let selectElement = document.getElementById("status");

        if (savedStatus) {
            selectElement.value = savedStatus;
            if (savedStatus === "Completed") {
                selectElement.disabled = true;
            }
        }
    };--%>

    function lockSelection(selectElement) {
        let selectedValue = selectElement.value;
        localStorage.setItem("orderStatus", selectedValue); // Save in local storage

        if (selectedValue === "Completed") {
            selectElement.disabled = true;
        }
    }
</script>










            
<td>
    <form action="delete_order.jsp" method="post" style="display:inline;">
        <input type="hidden" name="order_id" value="<%= id %>">
        <button type="submit" class="status-btn delete">Delete</button>
    </form>
</td>


            
        </tr>
        <%
                }
                con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </table>




</body>
</html>
