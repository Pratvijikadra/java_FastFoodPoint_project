<%@ page import="java.sql.*, javax.servlet.http.*, javax.servlet.*" %>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    
   
    try {
        Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
        Connection conn = DriverManager.getConnection("jdbc:odbc:food");

        String sql = "SELECT * FROM customer WHERE username = ? AND password = ?";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, username);
        stmt.setString(2, password);

        ResultSet rs = stmt.executeQuery();

        if (rs.next()) {
            // Successful login
         //   HttpSession session = request.getSession();
            session.setAttribute("username", username); // Store username in session
            response.sendRedirect("index.jsp"); // Redirect to homepage
        } else {
            out.println("<script>alert('Invalid login credentials!');</script>");
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
