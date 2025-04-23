<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*" %>
<%
    String contactId = request.getParameter("contact_id");

    if (contactId != null) {
        try {
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            Connection con = DriverManager.getConnection("jdbc:odbc:food");
            PreparedStatement ps = con.prepareStatement("DELETE FROM contact WHERE ID=?");
            ps.setInt(1, Integer.parseInt(contactId));
            int rowsAffected = ps.executeUpdate();
            con.close();

            if (rowsAffected > 0) {
                response.sendRedirect("show_contacts.jsp?status=deleted");
            } else {
                response.sendRedirect("show_contacts.jsp?status=error");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("show_contacts.jsp?status=error");
        }
    }
%>
