/*import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/edit_food_item")
public class edit_food_item extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String foodId = request.getParameter("food_id");
        String foodName = request.getParameter("food_name");
        String category = request.getParameter("category");
        String price = request.getParameter("price");

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            // Load JDBC-ODBC Bridge Driver
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            
            // Database Path
            String dbURL = "jdbc:ucanaccess://C:/path_to_your_database/FastFoodDB.accdb";
            conn = DriverManager.getConnection("jdbc:odbc:food");

            // Update Query
            String sql = "UPDATE food_items SET food_name = ?, category = ?, price = ? WHERE food_id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, foodName);
            pstmt.setString(2, category);
            pstmt.setString(3, price);
            pstmt.setString(4, foodId);

            int rowsUpdated = pstmt.executeUpdate();
            if (rowsUpdated > 0) {
                response.getWriter().println("<h3>Food item updated successfully!</h3>");
            } else {
                response.getWriter().println("<h3>Error: Food ID not found!</h3>");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("<h3>Error: " + e.getMessage() + "</h3>");
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    }
}
*/










/*import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/edit_food_item")
public class edit_food_item extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String foodId = request.getParameter("food_id");
        String foodName = request.getParameter("food_name");
        String category = request.getParameter("category");
        String price = request.getParameter("price");
        

        Connection conn = null;
        PreparedStatement pstmt = null;
        String message = "";

        try {
            // Load JDBC-ODBC Bridge Driver
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            
            // Database Path
            String dbURL = "jdbc:ucanaccess://C:/path_to_your_database/FastFoodDB.accdb";
            conn = DriverManager.getConnection("jdbc:odbc:food");

            // Update Query
            String sql = "UPDATE food_items SET food_name = ?, category = ?, price = ? WHERE food_id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, foodName);
            pstmt.setString(2, category);
            pstmt.setString(3, price);
            pstmt.setString(4, foodId);
            

            int rowsUpdated = pstmt.executeUpdate();
            if (rowsUpdated > 0) {
                message = "Food item updated successfully!";
            } else {
                message = "Error: Food ID not found!";
            }
        } catch (Exception e) {
            e.printStackTrace();
            message = "Error: " + e.getMessage();
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }

        // Redirect back to the JSP form with an alert message
        response.sendRedirect("edit_food_item.jsp?msg=" + java.net.URLEncoder.encode(message, "UTF-8"));
    }
}
*/










import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/edit_food_item")
@MultipartConfig(maxFileSize = 16177215)
public class edit_food_item extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String foodId = request.getParameter("food_id");
        String foodName = request.getParameter("food_name");
        String category = request.getParameter("category");
        String price = request.getParameter("price");
        Part filePart = request.getPart("image");

        Connection conn = null;
        PreparedStatement pstmt = null;
        String message = "";

        try {
            // Load JDBC-ODBC Bridge Driver
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            
            // Database Path
            String dbURL = "jdbc:ucanaccess://C:/path_to_your_database/FastFoodDB.accdb";
            conn = DriverManager.getConnection("jdbc:odbc:food");

            // Update Query
            String sql = "UPDATE food_items SET food_name = ?, category = ?, price = ?, image = ? WHERE food_id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, foodName);
            pstmt.setString(2, category);
            pstmt.setString(3, price);
            
            if (filePart != null && filePart.getSize() > 0) {
                InputStream inputStream = filePart.getInputStream();
                pstmt.setBinaryStream(4, inputStream, (int) filePart.getSize());
            } else {
                pstmt.setNull(4, java.sql.Types.BLOB);
            }
            
            pstmt.setString(5, foodId);
            
            int rowsUpdated = pstmt.executeUpdate();
            if (rowsUpdated > 0) {
                message = "Food item updated successfully!";
            } else {
                message = "Error: Food ID not found!";
            }
        } catch (Exception e) {
            e.printStackTrace();
            message = "Error: " + e.getMessage();
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }

        // Redirect back to the JSP form with an alert message
        response.sendRedirect("edit_food_item.jsp?msg=" + java.net.URLEncoder.encode(message, "UTF-8"));
    }
}
