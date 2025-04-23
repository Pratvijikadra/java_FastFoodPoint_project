import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/admin_login")
public class admin_login extends HttpServlet {

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();


        String username = request.getParameter("username");
        String password = request.getParameter("password");

        
        
         Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            // Load JDBC driver
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");

            // Establish connection to the database
            con = DriverManager.getConnection("jdbc:odbc:food");

            // Prepare SQL query to check credentials
            String query = "SELECT * FROM admins WHERE username = ? AND password = ?";
            ps = con.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, password);

            rs = ps.executeQuery();

            if (rs.next()) {
                // Successful login
                HttpSession session = request.getSession();
                session.setAttribute("username", username);

                // Redirect to a dashboard or welcome page
                response.sendRedirect("admin_dashboard.jsp");
            } else {
                // Invalid credentials
                out.println("<script type='text/javascript'>");
                out.println("alert('Invalid username or password. Please try again.');");
                out.println("window.location = 'admin_login.jsp';");
                out.println("</script>");
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<script type='text/javascript'>");
            out.println("alert('Error: " + e.getMessage() + "');");
            out.println("window.location = 'admin_login.jsp';");
            out.println("</script>");
        } finally {
            // Close resources
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
        out.close();
    }
}
