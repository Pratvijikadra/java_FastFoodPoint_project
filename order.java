/*import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/order")
public class order extends HttpServlet {
   

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve form data
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String paymentMethod = request.getParameter("paymentMethod");

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            // Load JDBC driver
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");

            // Establish database connection
            conn = DriverManager.getConnection("jdbc:odbc:food");

            // SQL query to insert order details
            String sql = "INSERT INTO orders (name, email, phone, address, payment_method) VALUES (?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);

            // Set parameters
            pstmt.setString(1, name);
            pstmt.setString(2, email);
            pstmt.setString(3, phone);
            pstmt.setString(4, address);
            pstmt.setString(5, paymentMethod);

            // Execute query
            int rowsInserted = pstmt.executeUpdate();

            if (rowsInserted > 0) {
                System.out.println("Order successfully placed.");
            }

            // Redirect to success page
            response.sendRedirect("orderSuccessful.jsp");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            response.getWriter().write("Error: JDBC Driver not found.");
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().write("Error: Unable to connect to the database.");
        } finally {
            // Close resources
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
*/














import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/order")
public class order extends HttpServlet {
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String paymentMethod = request.getParameter("paymentMethod");
        
        HttpSession session = request.getSession();
        List<String[]> cart = (List<String[]>) session.getAttribute("cart");
        
        if (cart == null || cart.isEmpty()) {
            response.getWriter().println("Your cart is empty.");
            return;
        }
        
        String url = "jdbc:mysql://localhost:3306/your_database_name";
        String user = "your_db_user";
        String password = "your_db_password";
        
        try {
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            Connection conn = DriverManager.getConnection("jdbc:odbc:food");
            
            String sql = "INSERT INTO `orders` (name, email, phone, address, payment_method, item_name, quantity, total) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            
            for (String[] cartItem : cart) {
                String itemName = cartItem[0];
                double itemPrice = Double.parseDouble(cartItem[1]);
                int quantity = Integer.parseInt(cartItem[3]);
                double total = itemPrice * quantity;
                
                pstmt.setString(1, name);
                pstmt.setString(2, email);
                pstmt.setString(3, phone);
                pstmt.setString(4, address);
                pstmt.setString(5, paymentMethod);
                pstmt.setString(6, itemName);
                pstmt.setInt(7, quantity);
                pstmt.setDouble(8, total);
                
                pstmt.executeUpdate();
            }
            
            pstmt.close();
            conn.close();
            
            session.removeAttribute("cart"); // Clear cart after successful order
            response.sendRedirect("orderSuccessful.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error processing order: " + e.getMessage());
        }
    }
}
