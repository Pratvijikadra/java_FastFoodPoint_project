import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/admin_register")
public class admin_register extends HttpServlet {

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();


        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirm_password");

        

        if (!password.equals(confirmPassword)) {
            out.println("<script>alert('Passwords do not match!');</script>");
            out.println("<script>window.location.href = 'admin_register.jsp';</script>");
            return;
        }

        try {
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            Connection connection = DriverManager.getConnection("jdbc:odbc:food");

            String checkQuery = "SELECT * FROM admins";
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(checkQuery);

            if (resultSet.next()) {
                // Admin already registered
                out.println("<script>alert('Admin is already registered. Please log in.');</script>");
                out.println("<script>window.location.href = 'admin_login.jsp';</script>");
            } else {
                // Register the admin
                String insertQuery = "INSERT INTO admins (username, password) VALUES (admin,admin)";
                PreparedStatement preparedStatement = connection.prepareStatement(insertQuery);
                preparedStatement.setString(1, username);
                preparedStatement.setString(2, password);
                int rows = preparedStatement.executeUpdate();     

                if (rows > 0) {
                    out.println("<script>alert('Registration successful! Please log in.');</script>");
                    out.println("<script>window.location.href = 'admin_login.jsp';</script>");
                } else {
                     out.println("<script>Registration failed. Please try again.');</script>");
                     out.println("<script>window.location.href = 'admin_register.jsp';</script>");
                    
                }

                preparedStatement.close();
            }

            statement.close();
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<script type='text/javascript'>");
            out.println("alert('Error: Database Connection Error. " + e.getMessage() + "');");
            out.println("window.location = 'admin_login.jsp';");
            out.println("</script>");
        }
    }
}
