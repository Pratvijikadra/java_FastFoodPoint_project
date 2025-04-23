/*package food;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
 
public class menu {
    private int id;
    private String name;
    private double price;
    private byte[] image;
    private String category;

    // Constructor
    public menu(int id, String name, double price, byte[] image, String category) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.image = image;
        this.category = category;
    }

    public menu(String name, double price, byte[] image, String category) {
        this.name = name;
        this.price = price;
        this.image = image;
        this.category = category;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public double getPrice() {
        return price;
    }

    public byte[] getImagePath() {
        return image;
    }

    public String getCategory() {
        return category;
    }

    // Database Operations

    // Establish database connection
    private static Connection getConnection() throws SQLException {
      
        return DriverManager.getConnection("jdbc:odbc:food");
    }

    // 1. Add Menu Item
    public static void addMenuItem(menu menu) {
        String sql = "INSERT INTO menu (name, price, image, category) VALUES (?, ?, ?, ?)";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, menu.getName());
            pstmt.setDouble(2, menu.getPrice());
            pstmt.setBytes(3, menu.getImagePath());
            pstmt.setString(4, menu.getCategory());
            pstmt.executeUpdate();
            System.out.println("Menu item added successfully!");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // 2. Retrieve All Menu Items
    public static List<menu> getAllMenuItems() {
        List<menu> menuList = new ArrayList<>();
        String sql = "SELECT * FROM menu";
        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                menu menu = new menu(
                    rs.getInt("id"),
                    rs.getString("name"),
                    rs.getDouble("price"),
                    rs.getBytes("image"),
                    rs.getString("category")
                );
                menuList.add(menu);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return menuList;
    }

    // 3. Delete Menu Item
    public static void deleteMenuItem(int id) {
        String sql = "DELETE FROM menu WHERE id = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            pstmt.executeUpdate();
            System.out.println("Menu item deleted successfully!");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Main Method for Testing
    public static void main(String[] args) {
        // Example: Add a new menu item
       FileInputStream imageStream = new FileInputStream("images/burger.jpg");
        byte[] imageBytes = imageStream.readAllBytes(); // Read image as byte array
        menu newItem = new menu("Cheese Burger", 6.99, imageBytes, "burger");
        addMenuItem(newItem);

        // Example: Retrieve all menu items
        List<menu> menuItems = getAllMenuItems();
        for (menu item : menuItems) {
            System.out.println(item.getName() + " - $" + item.getPrice());
        }

        // Example: Delete a menu item
        if (!menuItems.isEmpty()) {
            deleteMenuItem(menuItems.get(0).getId());
        }
    }
}
*/