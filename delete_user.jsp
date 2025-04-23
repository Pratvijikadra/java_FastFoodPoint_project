<%@ page import="java.sql.*" %>
<%
    // Get the user ID from the request
    String userId = request.getParameter("id");

    if (userId != null && !userId.isEmpty()) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            // Load JDBC Driver
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");

            // Establish Connection
            connection = DriverManager.getConnection("jdbc:odbc:food");

            // SQL query to delete user
            String query = "DELETE FROM customer WHERE id=?";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, Integer.parseInt(userId));

            // Execute the delete
            int rowsAffected = preparedStatement.executeUpdate();

            if (rowsAffected > 0) {
                response.sendRedirect("manage_customers.jsp?success=User deleted successfully");
            } else {
                response.sendRedirect("manage_customers.jsp?error=Error deleting user");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("manage_customers.jsp?error=Exception occurred");
        } finally {
            try {
                if (preparedStatement != null) preparedStatement.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    } else {
        response.sendRedirect("manage_customers.jsp?error=Invalid user ID");
    }
%>
