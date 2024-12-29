<%-- 
    Document   : reservation
    Created on : Dec 28, 2024, 11:36:53 PM
    Author     : lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                <li><a href="reservation.jsp">Book Now</a></li>
            </ul>
        </nav>
    </header>

    <!-- Reservation Section -->
    <section id="reserve">
        <form method="POST" action="https://formspree.io/f/mgvebery">
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
    
            <button type="submit" class="btn">Confirm Booking</button>
        </form>
    </section>    

   
</body>
</html>
