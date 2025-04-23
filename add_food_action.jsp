<%--<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*" %>
<%
    String action = request.getParameter("action");
  
    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
        conn = DriverManager.getConnection("jdbc:odbc:food");

        if ("add".equals(action)) {
            String name = request.getParameter("name");
            String category = request.getParameter("category");
            String price = request.getParameter("price");
            String image = request.getParameter("image");

            String query = "INSERT INTO menu (name, category, price, image) VALUES (?, ?, ?, ?)";
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, name);
            pstmt.setString(2, category);
            pstmt.setString(3, price);
            pstmt.setString(4, image);
            pstmt.executeUpdate();
        } else if ("update".equals(action)) {
            String id = request.getParameter("id");
            String name = request.getParameter("name");
            String category = request.getParameter("category");
            String price = request.getParameter("price");
            String image = request.getParameter("image");

            String query = "UPDATE menu SET name = ?, category = ?, price = ?, image = ? WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, name);
            pstmt.setString(2, category);
            pstmt.setString(3, price);
            pstmt.setString(4, image);
            pstmt.setString(5, id);
            pstmt.executeUpdate();
        } else if ("delete".equals(action)) {
            String id = request.getParameter("id");

            String query = "DELETE FROM menu WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, id);
            pstmt.executeUpdate();
        }

        response.sendRedirect("manage_food_item.jsp");
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (pstmt != null) pstmt.close();
        if (conn != null) conn.close();
    }
%>
--%>







<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.io.*, javax.servlet.*, javax.servlet.http.*,java.nio.file.Paths"%>
<%
    String foodName = request.getParameter("foodName");
    String foodCategory = request.getParameter("foodCategory");
    double foodPrice = Double.parseDouble(request.getParameter("foodPrice"));
    Part filePart = request.getPart("foodImage");
    String foodImage = null;

    // Save the image to a specific directory
    if (filePart != null) {
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        String filePath = "images/" + fileName;
        filePart.write(getServletContext().getRealPath("") + "/" + filePath);
        foodImage = filePath;
    }

    // Microsoft Access JDBC connection setup
    Connection conn = null;
    PreparedStatement stmt = null;
    try {
        // Database URL for Microsoft Access
       
        Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
        conn = DriverManager.getConnection("jdbc:odbc:food");

        String sql = "INSERT INTO food_items (food_name, category, price, image) VALUES (?, ?, ?, ?)";
        stmt = conn.prepareStatement(sql);
        stmt.setString(1, foodName);
        stmt.setString(2, foodCategory);
        stmt.setDouble(3, foodPrice);
        stmt.setString(4, foodImage);

        int result = stmt.executeUpdate();

        if (result > 0) {
            out.println("<script>alert('Food item added successfully'); window.location.href='manage_food_item.jsp';</script>");
        } else {
            out.println("<script>alert('Failed to add food item'); window.location.href='manage_food_item.jsp';</script>");
        }

    } catch (Exception e) {
        e.printStackTrace();
        out.println("<script>alert('Error: " + e.getMessage() + "'); window.location.href='manage_food_item.jsp';</script>");
    } finally {
        try {
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
