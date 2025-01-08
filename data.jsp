<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>

<%
    // Database connection parameters
    String dbURL = "jdbc:mysql://localhost:3306/hotel_db";
    String dbUser = "root";
    String dbPassword = "";

    // Retrieve user-submitted email and question from the form
    String userEmail = request.getParameter("email");
    String userQuestion = request.getParameter("question");

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        // Establish database connection
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

        // SQL query to insert data into the faq_submissions table
        String sql = "INSERT INTO faq_submissions (email, question) VALUES (?, ?)";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, userEmail);
        pstmt.setString(2, userQuestion);

        // Execute the query
        int rowsInserted = pstmt.executeUpdate();

        if (rowsInserted > 0) {
            response.sendRedirect("index.jsp");
        } else {
            out.println("<script>alert('Failed to submit your question. Please try again.');</script>");
        }
    } catch (Exception e) {
        out.println("<script>alert('An error occurred: " + e.getMessage() + "');</script>");
    } finally {
        // Close resources
        if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
    }

    // Redirect back to the main page
    response.setHeader("Refresh", "2; URL=index.jsp");
%>
