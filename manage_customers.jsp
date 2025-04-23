<%--<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Users - Fast Food Point</title>
    <style>
        /* General Styling */
        body {
            margin: 0;
            font-family: 'Arial', sans-serif;
            background-color: #f4f6f9;
            color: #333;
            padding: 0 20px;
        }

        h1 {
            text-align: center;
            color: #1a73e8;
            margin: 40px 0;
        }

        /* Header Section */
        header {
            background-color: #1a73e8;
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
        }

        .logout-btn {
            padding: 10px 20px;
            border: none;
            background-color: #f44336;
            color: #fff;
            border-radius: 5px;
            cursor: pointer;
            transition: transform 0.3s;
        }

        .logout-btn:hover {
            transform: scale(1.1);
            background-color: #d32f2f;
        }

        /* Table Styling */
        table {
            width: 100%;
            margin-top: 20px;
            border-collapse: collapse;
            border-radius: 10px;
            overflow: hidden;
        }

        th, td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #1a73e8;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        /* Buttons */
        .action-btn {
            padding: 10px 15px;
            background-color: #1a73e8;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-align: center;
            text-decoration: none;
            transition: background-color 0.3s;
        }

        .action-btn:hover {
            background-color: #0b57d0;
        }
    </style>
</head>
<body>
    <!-- Header Section -->
    <header>
        <div class="logo">Fast Food Point</div>
        <button class="logout-btn" onclick="window.location.href='index.jsp';">Logout</button>
    </header>

    <!-- Title -->
    <h1>Manage Registered Users</h1>

    <!-- Users Table -->
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Full name</th>
                <th>Username</th>
                <th>Email</th>
                
            </tr>
        </thead>
        <tbody>
            <%
                // Database Connection
                Connection connection = null;
                Statement statement = null;
                ResultSet resultSet = null;

                try {
                    // Load the JDBC driver
                    Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");

                    // Establish the connection
                    connection = DriverManager.getConnection("jdbc:odbc:food");

                    // Query to fetch users
                    String query = "SELECT id, fullname,username, email FROM customer";
                    statement = connection.createStatement();
                    resultSet = statement.executeQuery(query);

                    // Loop through the result set to populate the table
                    while (resultSet.next()) {
                        int id = resultSet.getInt("id");
                        String fullname = resultSet.getString("fullname");
                        String username = resultSet.getString("username");
                        String email = resultSet.getString("email");
                      

                        // Output each row
                        out.println("<tr>");
                        out.println("<td>" + id + "</td>");
                        out.println("<td>" + fullname + "</td>");
                        out.println("<td>" + username + "</td>");
                        out.println("<td>" + email + "</td>");
                    //    out.println("<td><a href='view_user.jsp?id=" + id + "' class='action-btn'>View</a></td>");
                        out.println("</tr>");
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    out.println("<tr><td colspan='5'>Error fetching data</td></tr>");
                } finally {
                    try {
                        if (resultSet != null) resultSet.close();
                        if (statement != null) statement.close();
                        if (connection != null) connection.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            %>
        </tbody>
    </table>
</body>
</html>
--%>









<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Users - Fast Food Point</title>
    <style>
        /* General Styling */
        body {
            margin: 0;
            font-family: 'Arial', sans-serif;
            background-color: #f4f6f9;
            color: #333;
            padding: 0 20px;
        }

        h1 {
            text-align: center;
            color: #1a73e8;
            margin: 40px 0;
        }

        /* Header Section */
        header {
            background-color: #1a73e8;
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
        }

        .logout-btn {
            padding: 10px 20px;
            border: none;
            background-color: #f44336;
            color: #fff;
            border-radius: 5px;
            cursor: pointer;
            transition: transform 0.3s;
        }

        .logout-btn:hover {
            transform: scale(1.1);
            background-color: #d32f2f;
        }

        /* Table Styling */
        table {
            width: 100%;
            margin-top: 20px;
            border-collapse: collapse;
            border-radius: 10px;
            overflow: hidden;
        }

        th, td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #1a73e8;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        /* Buttons */
        .action-btn {
            padding: 10px 15px;
            background-color: #1a73e8;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-align: center;
            text-decoration: none;
            transition: background-color 0.3s;
        }

        .action-btn:hover {
            background-color: #0b57d0;
        }

        .delete-btn {
            padding: 10px 15px;
            background-color: #f44336;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-align: center;
            text-decoration: none;
            transition: background-color 0.3s;
        }

        .delete-btn:hover {
            background-color: #d32f2f;
        }
    </style>
</head>
<body>
    <!-- Header Section -->
    <header>
        <div class="logo">Fast Food Point</div>
        <button class="logout-btn" onclick="window.location.href='index.jsp';">Logout</button>
    </header>

    <!-- Title -->
    <h1>Manage Registered Customers</h1>

    <!-- Users Table -->
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Full name</th>
                <th>Username</th>
                <th>Email</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <%
                // Database Connection
                Connection connection = null;
                Statement statement = null;
                ResultSet resultSet = null;

                try {
                    // Load the JDBC driver
                    Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");

                    // Establish the connection
                    connection = DriverManager.getConnection("jdbc:odbc:food");

                    // Query to fetch users
                    String query = "SELECT id, fullname, username, email FROM customer";
                    statement = connection.createStatement();
                    resultSet = statement.executeQuery(query);

                    // Loop through the result set to populate the table
                    while (resultSet.next()) {
                        int id = resultSet.getInt("id");
                        String fullname = resultSet.getString("fullname");
                        String username = resultSet.getString("username");
                        String email = resultSet.getString("email");

                        // Output each row
                        out.println("<tr>");
                        out.println("<td>" + id + "</td>");
                        out.println("<td>" + fullname + "</td>");
                        out.println("<td>" + username + "</td>");
                        out.println("<td>" + email + "</td>");
                        out.println("<td>");
                        out.println("<a href='delete_user.jsp?id=" + id + "' class='delete-btn' onclick='return confirm(\"Are you sure you want to delete this customer?\");'>Delete</a>");
                        out.println("</td>");
                        out.println("</tr>");
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    out.println("<tr><td colspan='5'>Error fetching data</td></tr>");
                } finally {
                    try {
                        if (resultSet != null) resultSet.close();
                        if (statement != null) statement.close();
                        if (connection != null) connection.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            %>
        </tbody>
    </table>
</body>
</html>
