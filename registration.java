/*import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;

/*@WebServlet(urlPatterns = {"/registration"})
public class registration extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Database connection parameters
    private static final String DB_DSN = "jdbc:odbc:food";
    private static final String DB_USER = ""; // No username needed for MS Access
    private static final String DB_PASSWORD = ""; // No password needed for MS Access

    protected void service(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirm_password");

        if (!password.equals(confirmPassword)) {
            out.println("<script>alert('Passwords do not match!'); location='registration.jsp';</script>");
            return;
        }

        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            // Load the JDBC-ODBC bridge driver
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");

            // Establish the connection using DSN
            connection = DriverManager.getConnection(DB_DSN, DB_USER, DB_PASSWORD);

            // SQL query to insert data
            String sql = "INSERT INTO customer (fullname, email, username, password) VALUES (?, ?, ?, ?)";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, fullname);
            preparedStatement.setString(2, email);
            preparedStatement.setString(3, username);
            preparedStatement.setString(4, password);

            int rowsInserted = preparedStatement.executeUpdate();

            if (rowsInserted > 0) {
                out.println("<script>alert('Registration successful!'); location='registration.jsp';</script>");
            } else {
                out.println("<script>alert('Registration failed. Please try again.'); location='registration.jsp';</script>");
            }
        } catch (ClassNotFoundException e) {
            out.println("<script>alert('Database driver not found.'); location='registration.jsp';</script>");
            e.printStackTrace();
        } catch (SQLException e) {
            out.println("<script>alert('Error connecting to the database.'); location='registration.jsp';</script>");
            e.printStackTrace();
        } finally {
            try {
                if (preparedStatement != null) preparedStatement.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
*/





import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/registration"})
public class registration extends HttpServlet {

  

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        // Retrieve form data
        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        Connection con = null;
        PreparedStatement ps = null;

        try {
            // Load JDBC driver
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");

            // Establish database connection
            con = DriverManager.getConnection("jdbc:odbc:food");

            // Prepare SQL query
            String query = "INSERT INTO customer (fullname, email, username, password) VALUES (?, ?, ?, ?)";
            ps = con.prepareStatement(query);
            ps.setString(1, fullname);
            ps.setString(2, email);
            ps.setString(3, username);
            ps.setString(4, password);

            // Execute update
            int rowsInserted = ps.executeUpdate();

            // Check if insertion was successful
            if (rowsInserted > 0) {
                out.println("<script type='text/javascript'>");
                out.println("alert('Registration successful!');");
                out.println("window.location = 'registration.jsp';"); // Redirect to a page after successful registration
                out.println("</script>");
            } else {
                out.println("<script type='text/javascript'>");
                out.println("alert('Registration failed. Please try again.');");
                out.println("window.location = 'registration.jsp';"); // Redirect to the registration page
                out.println("</script>");
            }
        } catch (Exception e) {
            out.println("<script type='text/javascript'>");
            out.println("alert('Error: " + e.getMessage() + "');");
            out.println("window.location = 'registration.jsp';");
            out.println("</script>");
        } finally {
            // Close resources
            try {
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        out.close();
    }
}

       

      

      

     

      
            
