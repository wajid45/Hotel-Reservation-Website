<%@page import="javax.servlet.*, javax.servlet.http.*"%>
<%
    HttpSession Session = request.getSession(false);
    if (session != null) {
        session.invalidate();  // End the session
    }
    response.sendRedirect("login.jsp");  // Redirect to login page after logging out
%>
