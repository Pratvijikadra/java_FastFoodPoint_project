<%--<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.mail.*" %>
<%@ page import="javax.mail.internet.*" %>
<%@ page import="java.util.Properties" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Contacts - Admin</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f9;
            color: #333;
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
            background: #fff;
            border-radius: 10px;
            overflow: hidden;
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
        tr:hover {
            background-color: #f1f1f1;
        }
        .reply-btn {
            padding: 8px 15px;
            border: none;
            background-color: #28a745;
            color: white;
            border-radius: 5px;
            cursor: pointer;
        }
        .reply-btn:hover {
            background-color: #218838;
        }
        .container {
            max-width: 90%;
            margin: auto;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Customer Contact Requests</h2>
        <table>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Message</th>
                <th>Submitted At</th>
                <th>Action</th>
            </tr>
            <%
                Connection con = null;
                PreparedStatement ps = null;
                ResultSet rs = null;
                try {
                    Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
                    con = DriverManager.getConnection("jdbc:odbc:food");
                    String query = "SELECT ID,name,email,message,sumitted_at FROM contact ORDER BY sumitted_at DESC";
                    ps = con.prepareStatement(query);
                    rs = ps.executeQuery();
                    while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getInt("ID") %></td>
                <td><%= rs.getString("name") %></td>
                <td><%= rs.getString("email") %></td>
                <td><%= rs.getString("message") %></td>
                <td><%= rs.getTimestamp("sumitted_at") %></td>
             
             <td><button class="reply-btn" onclick="replyToCustomer('<%= rs.getString("email") %>')">Reply</button></td>

            </tr>
            <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    if (rs != null) rs.close();
                    if (ps != null) ps.close();
                    if (con != null) con.close();
                }
            %>
        </table>
    </div>

    <script>
        function replyToCustomer(email) {
            var response = prompt("Enter your reply message:");
            if (response) {
                window.location.href = 'send_reply.jsp?email=' + encodeURIComponent(email) + '&message=' + encodeURIComponent(response);
            }
        }
    </script>
</body>
</html>
--%>























<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Contacts - Fast Food Point</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f9;
            padding: 20px;
        }
        h2 {
            text-align: center;
            color: #1a73e8;
            font-size: 2rem;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            background: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            overflow: hidden;
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
        tr:hover {
            background-color: #f1f1f1;
        }
        .btn {
            padding: 8px 12px;
            border: none;
            cursor: pointer;
            color: #fff;
            border-radius: 5px;
            transition: 0.3s;
        }
        .reply-btn {
            background-color: #4CAF50;
        }
        .reply-btn:hover {
            background-color: #388E3C;
        }
        .delete-btn {
            background-color: #ff4757;
        }
        .delete-btn:hover {
            background-color: #d32f2f;
        }
    </style>
    <script>
        function confirmDelete(contactId) {
            let confirmAction = confirm("Are you sure you want to delete this contact?");
            if (confirmAction) {
                window.location.href = "delete_contact.jsp?contact_id=" + contactId;
            }
        }
    </script>
</head>
<body>

<h2>Customer Contact Messages 📧</h2>

<table>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Email</th>
        <th>Message</th>
     
        <th>Actions</th>
    </tr>
    
    <%
        try {
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            Connection con = DriverManager.getConnection("jdbc:odbc:food");
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT ID, name, email, message FROM contact");

            while (rs.next()) {
                int id = rs.getInt("ID");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String message = rs.getString("message");
            
    %>
    <tr>
        <td><%= id %></td>
        <td><%= name %></td>
        <td><%= email %></td>
        <td><%= message %></td>
    
        <td>
            <!-- Reply via Email -->
            <a href="mailto:<%= email %>?subject=Response from Fast Food Point" class="btn reply-btn" style="text-decoration: none;" >Reply</a>

            <!-- Delete Contact with Confirmation -->
            <button onclick="confirmDelete(<%= id %>)" class="btn delete-btn">Delete</button>
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
