import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/settings")
public class settings extends HttpServlet {
   


    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Set response content type
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        // Retrieve form data
        String username = request.getParameter("username");
        String currentPassword = request.getParameter("current_password");
        String newPassword = request.getParameter("new_password");
        String confirmPassword = request.getParameter("confirm_password");

        String message = ""; // Message to show in the alert

        try {
            // Step 1: Connect to the database
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            Connection conn = DriverManager.getConnection("jdbc:odbc:food");

            // Step 2: Verify the current password
            String checkPasswordQuery = "SELECT password FROM admins WHERE username = ?";
            PreparedStatement checkStmt = conn.prepareStatement(checkPasswordQuery);
            checkStmt.setString(1, username);
            ResultSet rs = checkStmt.executeQuery();

            if (rs.next()) {
                String storedPassword = rs.getString("password");

                // Step 3: Validate password and update details
                if (!storedPassword.equals(currentPassword)) {
                    message = "Current password is incorrect.";
                } else if (!newPassword.equals(confirmPassword)) {
                    message = "New password and confirm password do not match.";
                } else {
                    String updateQuery = "UPDATE admins SET username = ?, password = ? WHERE username = ?";
                    PreparedStatement updateStmt = conn.prepareStatement(updateQuery);
                    updateStmt.setString(1, username);
                    updateStmt.setString(2, newPassword);
                    updateStmt.setString(3, username);

                    int rowsUpdated = updateStmt.executeUpdate();
                    if (rowsUpdated > 0) {
                        message = "Settings updated successfully.";
                    } else {
                        message = "Failed to update settings.";
                    }
                }
            } else {
                message = "User not found.";
            }

            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
            message = "An error occurred: " + e.getMessage();
        }

        // Step 4: Send alert and redirect back to settings.jsp
        out.println("<script type='text/javascript'>");
        out.println("alert('" + message + "');");
        out.println("window.location.href = 'settings.jsp';");
        out.println("</script>");
    }
}
