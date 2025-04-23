import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Timestamp;



@WebServlet(urlPatterns = {"/contact"})
public class contact extends HttpServlet {

  

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        // Retrieve form data
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String message = request.getParameter("message");
       


        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            // Load the JDBC driver
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");

            // Establish a connection
            conn = DriverManager.getConnection("jdbc:odbc:food");

            // SQL query to insert the contact details
            String sql = "INSERT INTO contact (name, email, message) VALUES (?, ?, ?)";
            stmt = conn.prepareStatement(sql);

            // Set parameters
            stmt.setString(1, name);
            stmt.setString(2, email);
            stmt.setString(3, message);

            // Execute the query
            int rowsInserted = stmt.executeUpdate();

            if (rowsInserted > 0) {
                out.println("<script type='text/javascript'>");
                out.println("alert('Thank you for contacting us!');");
                out.println("window.location = 'contact.jsp';");
                out.println("</script>");
            } else {
                out.println("<script type='text/javascript'>");
                out.println("alert('Oops! Something went wrong.');");
                out.println("window.location = 'contact.jsp';");
                out.println("</script>");
            }
        } catch (ClassNotFoundException | SQLException e) {
            out.println("<script type='text/javascript'>");
            out.println("alert('Error: " + e.getMessage() + "');");
            out.println("window.location = 'contact.jsp';");
            out.println("</script>");
        } finally {
            try {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
