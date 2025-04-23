<%--<%@ page import="java.sql.*, java.io.*, java.nio.file.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    // Get form parameters
    String foodId = request.getParameter("foodId");
    String foodName = request.getParameter("foodName");
    String foodCategory = request.getParameter("foodCategory");
    String foodPrice = request.getParameter("foodPrice");
    Part foodImagePart = request.getPart("foodImage");

    // Database connection details
    String dbURL = "jdbc:ucanaccess://C:/Users/LENOVO/Documents/FastFoodPoint.mdb";
    Connection conn = null;
    PreparedStatement stmt = null;
    String message = "";

    try {
        if (foodId != null && !foodId.isEmpty() && foodName != null && !foodName.isEmpty() &&
            foodCategory != null && !foodCategory.isEmpty() && foodPrice != null && !foodPrice.isEmpty()) {

            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver"); // Load UCanAccess driver
            conn = DriverManager.getConnection("jdbc:odbc:food");

            // Check if a new image was uploaded
            String imagePath = null;
            if (foodImagePart != null && foodImagePart.getSize() > 0) {
                // Define upload path
                String uploadDir = application.getRealPath("/") + "images/";
                File uploadDirFile = new File(uploadDir);
                if (!uploadDirFile.exists()) {
                    uploadDirFile.mkdirs();
                }

                // Generate unique filename
                String fileName = System.currentTimeMillis() + "_" + Paths.get(foodImagePart.getSubmittedFileName()).getFileName().toString();
                imagePath = "images/" + fileName;

                // Save the file
                foodImagePart.write(uploadDir + fileName);
            }

            // SQL UPDATE statement
            String sql;
            if (imagePath != null) {
                sql = "UPDATE food_items SET food_name = ?, category = ?, price = ?, image = ? WHERE food_id = ?";
                stmt = conn.prepareStatement(sql);
                stmt.setString(1, foodName);
                stmt.setString(2, foodCategory);
                stmt.setDouble(3, Double.parseDouble(foodPrice));
                stmt.setString(4, imagePath);
                stmt.setInt(5, Integer.parseInt(foodId));
            } else {
                sql = "UPDATE food_items SET food_name = ?, category = ?, price = ? WHERE food_id = ?";
                stmt = conn.prepareStatement(sql);
                stmt.setString(1, foodName);
                stmt.setString(2, foodCategory);
                stmt.setDouble(3, Double.parseDouble(foodPrice));
                stmt.setInt(4, Integer.parseInt(foodId));
            }

            int rowsAffected = stmt.executeUpdate();
            if (rowsAffected > 0) {
                message = "Food item with ID " + foodId + " updated successfully.";
            } else {
                message = "Error: No food item found with ID " + foodId + ".";
            }
        } else {
            message = "Error: All fields are required.";
        }
    } catch (Exception e) {
        message = "Error: " + e.getMessage();
        e.printStackTrace();
    } finally {
        try { if (stmt != null) stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
        try { if (conn != null) conn.close(); } catch (SQLException e) { e.printStackTrace(); }
    }
%>

<script>
    alert("<%= message %>");
    window.location.href = "manage_food_item.jsp"; // Redirect back to the management page
</script>
--%>















<%--<%@ page import="java.sql.*, java.io.*, java.util.*, javax.servlet.http.*, javax.servlet.ServletException, javax.servlet.annotation.MultipartConfig" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    // Database connection details
    String dbURL = "jdbc:ucanaccess://C:/path_to_your_database/your_database.accdb";
    Connection conn = null;
    PreparedStatement pstmt = null;

    // Ensure multipart form handling
    request.setCharacterEncoding("UTF-8");

    try {
        // Retrieve form data
        String foodId = request.getParameter("foodId");
        String foodName = request.getParameter("foodName");
        String foodCategory = request.getParameter("foodCategory");
        String foodPrice = request.getParameter("foodPrice");
        Part foodImage = request.getPart("foodImage");

        if (foodId == null || foodId.trim().isEmpty()) {
            throw new Exception("Food ID is required.");
        }

        // Convert foodPrice to double safely
        double price = 0.0;
        try {
            price = Double.parseDouble(foodPrice);
        } catch (NumberFormatException e) {
            throw new Exception("Invalid price format.");
        }

        // Load database driver and establish connection
        Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
        conn = DriverManager.getConnection("jdbc:odbc:food");

        // SQL Update query
        String sql = "UPDATE food_items SET food_name = ?, category = ?, price = ?, image = ? WHERE food_id = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, foodName);
        pstmt.setString(2, foodCategory);
        pstmt.setDouble(3, price);

        // Handle image upload
        InputStream inputStream = null;
        byte[] imageBytes = null;

        if (foodImage != null && foodImage.getSize() > 0) {
            inputStream = foodImage.getInputStream();
            ByteArrayOutputStream buffer = new ByteArrayOutputStream();
            int nRead;
            byte[] data = new byte[1024];

            while ((nRead = inputStream.read(data, 0, data.length)) != -1) {
                buffer.write(data, 0, nRead);
            }

            imageBytes = buffer.toByteArray();
            pstmt.setBytes(4, imageBytes);
        } else {
            pstmt.setNull(4, Types.BLOB); // If no image uploaded, set to NULL
        }

        pstmt.setInt(5, Integer.parseInt(foodId));

        int rowsUpdated = pstmt.executeUpdate();

        if (rowsUpdated > 0) {
            out.println("<script>alert('Food item updated successfully!'); window.location='edit_food_item.jsp';</script>");
        } else {
            throw new Exception("Food ID not found.");
        }

    } catch (Exception e) {
        out.println("<script>alert('Error: " + e.getMessage() + "'); window.history.back();</script>");
    } finally {
        if (pstmt != null) pstmt.close();
        if (conn != null) conn.close();
    }
%>--%>










<%@ page import="java.sql.*, java.io.*, javax.servlet.http.Part" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    String dbURL = "jdbc:ucanaccess://C:/path_to_your_database/your_database.accdb";
    Connection conn = null;
    PreparedStatement pstmt = null;

    String foodId = request.getParameter("foodId");
    String foodName = request.getParameter("foodName");
    String foodCategory = request.getParameter("foodCategory");
    String foodPrice = request.getParameter("foodPrice");

    InputStream inputStream = null;

    try {
        // Get the uploaded file from the form
        Part foodImage = request.getPart("foodImage");

        // Open a connection to the database
        Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
        conn = DriverManager.getConnection("jdbc:odbc:food");

        // Check if an image was uploaded
        if (foodImage != null && foodImage.getSize() > 0) {
            inputStream = foodImage.getInputStream(); // Get input stream of the uploaded file
        }

        // SQL query to update the food item details
        String sql = "UPDATE food_items SET food_name = ?, category = ?, price = ?, image = ? WHERE food_id = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, foodName);
        pstmt.setString(2, foodCategory);
        pstmt.setDouble(3, Double.parseDouble(foodPrice));
        
        if (inputStream != null) {
            pstmt.setBinaryStream(4, inputStream, (int) foodImage.getSize()); // Set image as binary stream
        } else {
            pstmt.setNull(4, Types.BLOB); // No image uploaded
        }
        
        pstmt.setInt(5, Integer.parseInt(foodId));

        // Execute the update
        int rowsUpdated = pstmt.executeUpdate();
        if (rowsUpdated > 0) {
            out.println("<script>alert('Food item updated successfully!'); window.location='edit_food_item.jsp';</script>");
        } else {
            out.println("<script>alert('Failed to update food item. Please check the ID.'); window.history.back();</script>");
        }
    } catch (Exception e) {
        out.println("<script>alert('Error: " + e.getMessage() + "'); window.history.back();</script>");
    } finally {
        if (pstmt != null) pstmt.close();
        if (conn != null) conn.close();
    }
%>
