/*import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import java.util.*;

@WebServlet("/MenuServlet")
public class MenuServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:ucanaccess://C:/Users/LENOVO/Documents/FastFoodPoint.mdb"; // Update this with your DB path
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<MenuItem> menuItems = new ArrayList<>();
        
        try (Connection conn = DriverManager.getConnection("jdbc:odbc:food");
             PreparedStatement stmt = conn.prepareStatement("SELECT food_id, name, category, price, image FROM food_items")) {
            
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                int foodId = rs.getInt("food_id");
                String name = rs.getString("name");
                String category = rs.getString("category");
                double price = rs.getDouble("price");
                InputStream imageStream = rs.getBinaryStream("image");

                MenuItem item = new MenuItem(foodId, name, category, price, imageStream);
                menuItems.add(item);
            }
            
            // Set the menu items in the request
            request.setAttribute("menuItems", menuItems);
            RequestDispatcher dispatcher = request.getRequestDispatcher("menu.jsp");
            dispatcher.forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }
}

class MenuItem {
    private int foodId;
    private String name;
    private String category;
    private double price;
    private InputStream imageStream;

    public MenuItem(int foodId, String name, String category, double price, InputStream imageStream) {
        this.foodId = foodId;
        this.name = name;
        this.category = category;
        this.price = price;
        this.imageStream = imageStream;
    }

    public int getFoodId() {
        return foodId;
    }

    public String getName() {
        return name;
    }

    public String getCategory() {
        return category;
    }

    public double getPrice() {
        return price;
    }

    public InputStream getImageStream() {
        return imageStream;
    }
}
*/