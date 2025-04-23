import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/profile_update")
public class profile_update extends HttpServlet {
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        

        try {
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            Connection conn = DriverManager.getConnection("jdbc:odbc:food");

            // Update the user data in the database
            String sql = "UPDATE customer SET fullname = ?, email = ?, username = ?, password = ? WHERE username = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, fullname);
            stmt.setString(2, email);
            stmt.setString(3, username);
            stmt.setString(4, password);

            // Retrieve the current user's username from the session
            HttpSession session = request.getSession(false);
            String currentUsername = (String) session.getAttribute("username");

            stmt.setString(5, currentUsername);

            int rowsUpdated = stmt.executeUpdate();
            if (rowsUpdated > 0) {
                // Update session data
                session.setAttribute("username", username);
                response.getWriter().println("<script>alert('Your profile has been updated successfully!');</script>");
                response.getWriter().println("<script>window.location.href = 'index.jsp';</script>");
            } else {
                response.getWriter().println("<script>alert('Failed to update profile. Please try again.');</script>");
                response.getWriter().println("<script>window.location.href = 'profile_update.jsp';</script>");
            }

            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("<script>alert('An error occurred. Please try again later.');</script>");
            response.getWriter().println("<script>window.location.href = 'profile_update.jsp';</script>");
        }
    }
}
