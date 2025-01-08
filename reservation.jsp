<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>

<%
    // Database connection parameters
    String dbURL = "jdbc:mysql://localhost:3306/hotel_db";
    String dbUser = "root";
    String dbPassword = "";

    // Initialize variables for feedback messages
    String reservationMessage = "";

    // Retrieve user-submitted form data (from reservation form)
    String userName = request.getParameter("name");
    String userEmail = request.getParameter("email");
    String checkinDate = request.getParameter("checkin");
    String checkoutDate = request.getParameter("checkout");
    String roomType = request.getParameter("room");
    String specialRequests = request.getParameter("requests");

    // Check if dates are valid, if not set appropriate error message
    if (checkinDate == null || checkinDate.isEmpty() || checkoutDate == null || checkoutDate.isEmpty()) {
        reservationMessage = "Check-in and Check-out dates are required.";
    }

    // Initialize database connection and prepared statement
    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        // Only proceed if the dates are valid
        if (reservationMessage.isEmpty()) {
            // Establish database connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

            // SQL query to insert data into the reservations table
            String reservationSQL = "INSERT INTO reservations (name, email, checkin_date, checkout_date, room_type, special_requests) VALUES (?, ?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(reservationSQL);

            // Check if parameters are not null and set them to the prepared statement
            pstmt.setString(1, userName != null && !userName.isEmpty() ? userName : "");
            pstmt.setString(2, userEmail != null && !userEmail.isEmpty() ? userEmail : "");
            pstmt.setString(3, checkinDate != null && !checkinDate.isEmpty() ? checkinDate : "0000-00-00");
            pstmt.setString(4, checkoutDate != null && !checkoutDate.isEmpty() ? checkoutDate : "0000-00-00");
            pstmt.setString(5, roomType != null && !roomType.isEmpty() ? roomType : "");
            pstmt.setString(6, specialRequests != null ? specialRequests : "");

            // Execute the query to insert reservation
            int rowsInserted = pstmt.executeUpdate();

            // Check if the reservation was successfully inserted into the database
            if (rowsInserted > 0) {
                reservationMessage = "Your reservation has been submitted successfully!";
            } else {
                reservationMessage = "Failed to submit your reservation. Please try again.";
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
        reservationMessage = "An error occurred: " + e.getMessage();
    } finally {
        // Close database resources
        if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Royalton Hotel - Luxury Stay</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <header>
        <div class="logo">
            <a href="index.jsp">
                <img src="img/logo.png" alt="Royalton Hotel">
            </a>
        </div>
        
        <nav>
            <ul>
                <li><a href="index.jsp">Home</a></li>
                <li><a href="rooms.jsp">Rooms</a></li>
                <li><a href="reservation.jsp">Book Now</a></li>
                <li><a href="login.jsp">Account</a>
            </ul>
        </nav>
    </header>

    <!-- Reservation Section -->
    <section id="reserve">
        
        <form method="POST" action="reservation.jsp">
            <h2>Book Your Stay</h2>
    
            <label for="name">Full Name:</label>
            <input type="text" id="name" name="name" required>
    
            <label for="email">Email Address:</label>
            <input type="email" id="email" name="email" required>
    
            <label for="checkin">Check-in Date:</label>
            <input type="date" id="checkin" name="checkin" required>
    
            <label for="checkout">Check-out Date:</label>
            <input type="date" id="checkout" name="checkout" required>
    
            <label for="room">Select Room Type:</label>
            <select id="room" name="room" required>
                <option value="deluxe">Deluxe Room</option>
                <option value="suite">Suite Room</option>
                <option value="standard">Standard Room</option>
                <option value="penthouse">Penthouse Room</option>
                <option value="family">Family Room</option>
                <option value="studio">Studio Room</option>
            </select>
    
            <label for="requests">Special Requests:</label>
            <textarea id="requests" name="requests" rows="4" placeholder="Any special requests..."></textarea>
            
            <script>
        // Function to hide the message after 2 seconds
        function hideMessage() {
            setTimeout(function() {
                // Hide both the error and success messages if they exist
                var successMessage = document.querySelector('.success-message');
                if (successMessage) {
                    successMessage.style.display = 'none';
                }
            }, 3000);  // 3 seconds
        }

        // Run the hideMessage function when the document is loaded
        window.onload = hideMessage;
    </script>
 <!-- Display Reservation Success/Error Message -->
        <%
            if (reservationMessage != null && !reservationMessage.isEmpty()) {
        %>
            <div class="success-message"><%= reservationMessage %></div>
        <%
            }
        %>
            <button type="submit" class="btn">Confirm Booking</button>
        </form>

        <div class="description">
            <h2>Plan Your Perfect Stay</h2>
            <p>Welcome to Royalton Hotel, where comfort meets luxury. Use our reservation form to book your stay quickly and easily.</p>
            <p>We are here to make your stay seamless and enjoyable. If you have any questions or need assistance, feel free to contact us during our front desk hours.</p>
            <p><strong>Front Desk Hours:</strong></p>
            <ul>
                <li>Mon - Fri: 09:00 am - 05:00 pm</li>
                <li>Sat: By Appointment</li>
                <li>Sun: By Appointment</li>
            </ul>
        </div>

    </section>
</body>
</html>
