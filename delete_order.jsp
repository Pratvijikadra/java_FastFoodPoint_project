<%@ page import="java.sql.*" %>
<%
    String orderId = request.getParameter("order_id");

    if (orderId != null && !orderId.isEmpty()) {
        Connection con = null;
        PreparedStatement ps = null;

        try {
            // Load JDBC Driver (Modify if needed)
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");

            // Establish Database Connection (Update credentials)
            con = DriverManager.getConnection("jdbc:odbc:food");

            // Delete Query
            String sql = "DELETE FROM orders WHERE id = ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, orderId);

            int rowsAffected = ps.executeUpdate();

            if (rowsAffected > 0) {
                out.println("<script>alert('Order deleted successfully!'); window.location.href='view_orders.jsp';</script>");
            } else {
                out.println("<script>alert('Order not found!'); window.location.href='view_orders.jsp';</script>");
            }

        } catch (Exception e) {
            e.printStackTrace();
            out.println("<script>alert('Error deleting order!'); window.location.href='view_orders.jsp';</script>");
        } finally {
            try {
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    } else {
        out.println("<script>alert('Invalid order ID!'); window.location.href='view_orders.jsp';</script>");
    }
%>
