/*import java.io.IOException;
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

@WebServlet("/manage_food_item") // Servlet mapped to "/manage_food_item"
@MultipartConfig(maxFileSize = 16177215) // Set max file size for image upload (15 MB)
public class manage_food_item extends HttpServlet {
    
    private static final String DB_URL = "jdbc:ucanaccess://C:/Users/LENOVO/Documents/FastFoodPoint.mdb"; // Your MS Access DB path

    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String foodName = request.getParameter("foodName");
        String foodCategory = request.getParameter("foodCategory");
        String foodPrice = request.getParameter("foodPrice");
        Part filePart = request.getPart("foodImage");

        if (foodName == null || foodCategory == null || foodPrice == null || filePart == null) {
            response.getWriter().println("Missing fields! Please fill all details.");
            return;
        }

        try (Connection conn = DriverManager.getConnection("jdbc:odbc:food");
             PreparedStatement stmt = conn.prepareStatement("INSERT INTO food_items (food_name, category, price, image) VALUES (?, ?, ?, ?)")) {

            // Convert price to double
            double price = Double.parseDouble(foodPrice);

            // Set parameters in the SQL query
            stmt.setString(1, foodName);
            stmt.setString(2, foodCategory);
            stmt.setDouble(3, price);

            // Convert image to byte stream
            InputStream inputStream = filePart.getInputStream();
            stmt.setBinaryStream(4, inputStream, (int) filePart.getSize());

            // Execute the insert statement
            int rowsInserted = stmt.executeUpdate();
            if (rowsInserted > 0) {
                response.getWriter().println("Food item added successfully!");
            } else {
                response.getWriter().println("Failed to add food item.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}*/













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

@WebServlet("/manage_food_item") // Servlet mapped to "/manage_food_item"
@MultipartConfig(maxFileSize = 16177215) // Set max file size for image upload (15 MB)
public class manage_food_item extends HttpServlet {
    
    private static final String DB_URL = "jdbc:ucanaccess://C:/Users/LENOVO/Documents/FastFoodPoint.mdb"; // Your MS Access DB path

    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String foodName = request.getParameter("foodName");
        String foodCategory = request.getParameter("foodCategory");
        String foodPrice = request.getParameter("foodPrice");
        Part filePart = request.getPart("foodImage");

        if (foodName == null || foodCategory == null || foodPrice == null || filePart == null) {
            response.setContentType("text/html");
            response.getWriter().println("<script>alert('Missing fields! Please fill all details.'); window.history.back();</script>");
            return;
        }

        try (Connection conn = DriverManager.getConnection("jdbc:odbc:food");
             PreparedStatement stmt = conn.prepareStatement("INSERT INTO food_items (food_name, category, price, image) VALUES (?, ?, ?, ?)")) {

            // Convert price to double
            double price = Double.parseDouble(foodPrice);

            // Set parameters in the SQL query
            stmt.setString(1, foodName);
            stmt.setString(2, foodCategory);
            stmt.setDouble(3, price);

            // Convert image to byte stream
            InputStream inputStream = filePart.getInputStream();
            stmt.setBinaryStream(4, inputStream, (int) filePart.getSize());

            // Execute the insert statement
            int rowsInserted = stmt.executeUpdate();
            if (rowsInserted > 0) {
                response.setContentType("text/html");
                response.getWriter().println("<script>alert('Food item added successfully!'); window.location.href = 'manage_food_item.jsp';</script>");
            } else {
                response.setContentType("text/html");
                response.getWriter().println("<script>alert('Failed to add food item.'); window.history.back();</script>");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.setContentType("text/html");
            response.getWriter().println("<script>alert('Error: " + e.getMessage() + "'); window.history.back();</script>");
        }
    }
}
