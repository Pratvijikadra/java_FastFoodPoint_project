<%@ page import="java.sql.*, java.io.*" %>
<%
    String foodId = request.getParameter("foodId");
    if (foodId != null) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            String dbURL = "jdbc:ucanaccess://C:/path_to_your_database/your_database.accdb";
            conn = DriverManager.getConnection("jdbc:odbc:food");
            
            String sql = "SELECT image FROM food_items WHERE food_id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, foodId);
            rs = pstmt.executeQuery();
            
            if (rs.next()) {
                InputStream imgStream = rs.getBinaryStream("image");
                int imgLength;
                byte[] imgData = new byte[1024];
                OutputStream outStream = response.getOutputStream();
                
                response.setContentType("image/jpeg"); // Adjust according to stored format
                
                while ((imgLength = imgStream.read(imgData)) != -1) {
                    outStream.write(imgData, 0, imgLength);
                }
                outStream.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        }
    }
%>
