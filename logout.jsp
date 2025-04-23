<%@ page import="javax.servlet.http.*, javax.servlet.*" %>
<%
  //  HttpSession session = request.getSession(false); 
// Get the existing session
    if (session != null) {
        session.invalidate(); // Invalidate the session
    }
    response.sendRedirect("index.jsp"); // Redirect to home page
%>
