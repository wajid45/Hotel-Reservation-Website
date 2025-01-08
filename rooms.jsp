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
                <li><a href="rooms.jsp">Rooms</a></li>
                <li><a href="reservation.jsp">Book Now</a></li>
            </ul>
        </nav>
    </header>
    <section id="rooms">
        <h2>Our Rooms</h2>
        <!-- Penthouse Room -->
        <a href="penthouse.jsp" class="room-card">
            <img src="img/pent1.jpg" alt="Penthouse Room">
            <h3>Penthouse Room</h3>
            <p>Price: $600 per night</p>
            <p>A luxurious top-floor suite with panoramic views, a private terrace, and exclusive amenities.</p>
        </a>

        <!-- Studio Room -->
        <a href="studioroom.jsp" class="room-card">
            <img src="img/studioroom.jpg" alt="Studio Room">
            <h3>Studio Room</h3>
            <p>Price: $450 per night</p>
            <p>A cozy, open-concept room with a combined living and sleeping area, and a kitchenette for convenience.</p>
        </a>
        <!-- Family Room -->
        <a href="familyroom.jsp" class="room-card">
            <img src="img/familyroom1.jpg" alt="Family Room">
            <h3>Family Room</h3>
            <p>Price: $400 per night</p>
            <p>A spacious room designed for families, featuring multiple beds, a cozy seating area, and family-friendly amenities.</p>
        </a>

        <!-- Deluxe Room -->
        <a href="deluxe-room.jsp" class="room-card">
            <img src="img/d1.jpg" alt="Deluxe Room">
            <h3>Deluxe Room</h3>
            <p>Price: $200 per night</p>
            <p>A luxurious room with a king-sized bed, minibar, free Wi-Fi, and panoramic views.</p>
        </a>
        
        <!-- Suite Room -->
        <a href="suite-room.jsp" class="room-card">
            <img src="img/r1.avif" alt="Suite Room">
            <h3>Suite Room</h3>
            <p>Price: $300 per night</p>
            <p>A spacious suite with a separate living area, premium amenities, and breathtaking views.</p>
        </a>
        
        <!-- Standard Room -->
        <a href="standard-room.jsp" class="room-card">
            <img src="img/s1.jpeg" alt="Standard Room">
            <h3>Standard Room</h3>
            <p>Starting at $80 per night</p>
            <p>A comfortable room with modern amenities and cozy decor.</p>
        </a>
        
    </section>
    <footer>
        <div class="footer-content">
            <div class="footer-links">
                @Copyrights reserved Royalton Hotel
            </div>
            <div class="footer-contact">
                <p>Contact Us: contact@hotelxyz.com</p>
            </div>
        </div>
    </footer>
</body>
</html>

