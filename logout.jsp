<%@page import="javax.servlet.*, javax.servlet.http.*"%>

<%
    HttpSession sessions = request.getSession(false);
    if (sessions != null) {
        sessions.invalidate(); // Invalidate the session
    }
    response.sendRedirect("login.jsp"); // Redirect to login page
%>
