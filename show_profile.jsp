<%@ page import="java.sql.*, javax.servlet.http.*, javax.servlet.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Show Profile</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #fff;
            text-align: center;
        }

        .profile-details {
            background-color: #fff5e6;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            margin: 50px auto;
            padding: 20px;
            width: 50%;
            border-radius: 10px;
        }

        .profile-details h1 {
            color: #0033ff;
            //color: #ff5722;
        }
        .profile-details img {
            width: 100px;
            margin-bottom: 20px;
        }

        .profile-details p {
            font-size: 1.2rem;
            margin: 10px 0;
        }
    </style>
</head>
<body>
    <div class="profile-details">
          <img src="images/loginlogo.png" alt="Fast Food Point Logo">
        <h1>Your Profile</h1>
        <%
           
            
            Connection connection = null;
            PreparedStatement preparedStatement = null;
            ResultSet resultSet = null;
            
            // Fetch username from session
           // HttpSession session = request.getSession(false);
            if (session != null) {
                String username = (String) session.getAttribute("username");
                if (username != null) {
                    try {
                        // Connect to the database
                        Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
                        connection = DriverManager.getConnection("jdbc:odbc:food");
                        
                        // Query to fetch user details
                        String query = "SELECT fullname, email, username FROM customer WHERE username = ?";
                        preparedStatement = connection.prepareStatement(query);
                        preparedStatement.setString(1, username);
                        resultSet = preparedStatement.executeQuery();

                        if (resultSet.next()) {
                            // Display user details
                            String fullname = resultSet.getString("fullname");
                            String email = resultSet.getString("email");
                            out.println("<p><strong>Full Name:</strong> " + fullname + "</p>");
                            out.println("<p><strong>Email:</strong> " + email + "</p>");
                            out.println("<p><strong>Username:</strong> " + username + "</p>");
                        } else {
                            out.println("<p>User not found in the database.</p>");
                        }
                    } catch (Exception e) {
                        out.println("<p>Error: " + e.getMessage() + "</p>");
                    } finally {
                        // Close resources
                        if (resultSet != null) resultSet.close();
                        if (preparedStatement != null) preparedStatement.close();
                        if (connection != null) connection.close();
                    }
                } else {
                    out.println("<p>No user is logged in. Please log in to view your profile.</p>");
                }
            } else {
                out.println("<p>Session expired. Please log in again.</p>");
            }
        %>
    </div>
</body>
</html>
