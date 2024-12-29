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
                <li><a href="#rooms">Rooms</a></li>
                <li><a href="#services">Services</a></li>
                <li><a href="#about">About</a></li>
                <li><a href="javascript:void(0);" onclick="redirectToLogin()">Book Now</a></li>
            </ul>
        </nav>

        <script>
            function redirectToLogin() {
                // Store the redirect URL after successful login in sessionStorage
                sessionStorage.setItem('redirectAfterLogin', 'reserve.html');
                window.location.href = 'login.jsp';
            }
        </script>
    </header>
    
    <section class="hero">
        <div class="cta">
            <h1>Welcome to Royalton Hotel</h1>
            <p>Experience luxury and comfort</p>
            <a href="reservation.jsp" class="btn">Book Now</a>
        </div>
    </section>

    <section id="rooms">
        <h2>Our Rooms</h2>
        <!-- Penthouse Room -->
        <a href="penthouse.jsp" class="room-card">
            <img src="img/pent4.jpg" alt="Penthouse Room">
            <h3>Penthouse Room</h3>
            <p>Price: $600 per night</p>
            <p>A luxurious top-floor suite with panoramic views, a private terrace, and exclusive amenities.</p>
        </a>

        <!-- Studio Room -->
        <a href="studio-room.jsp" class="room-card">
            <img src="img/studioroom2.jpg" alt="Studio Room">
            <h3>Studio Room</h3>
            <p>Price: $200 per night</p>
            <p>A cozy, open-concept room with a combined living and sleeping area, and a kitchenette for convenience.</p>
        </a>

        <!-- View All Rooms Button -->
        <div class="view-all-rooms-btn">
            <a href="rooms.jsp">
                <button>View All Rooms</button>
            </a>
        </div>
    </section>

    <!-- Services Section -->
    <section id="services">
        <h2>Our Services</h2>
        <p>At Royalton Hotel, we offer a wide range of services designed to make your stay as comfortable and enjoyable as possible. Our dedicated team is always available to cater to your needs. Here are some of the key services we provide:</p>

        <h3>Key Responsibilities of Our Staff:</h3>
        <ul>
            <li>Provide exceptional customer service to all guests</li>
            <li>Ensure the cleanliness and upkeep of rooms and common areas</li>
            <li>Assist with reservations, special requests, and guest inquiries</li>
            <li>Offer concierge services to help guests plan their stay</li>
            <li>Maintain a safe and secure environment for all guests</li>
        </ul>

        <h3>Hotel Services:</h3>
        <ul>
            <li>24/7 Room Service</li>
            <li>Free Wi-Fi throughout the hotel</li>
            <li>Swimming Pool & Spa</li>
            <li>Fitness Center</li>
            <li>Business Center with meeting rooms</li>
            <li>Complimentary Airport Shuttle</li>
            <li>On-site Restaurant & Bar</li>
            <li>Concierge & Tour Desk</li>
            <li>Laundry and Dry Cleaning Services</li>
            <li>Valet Parking</li>
        </ul>
    </section>

    <!-- About Section -->
    <section id="about">
        <h2>About Royalton Hotel</h2>
        <p>Welcome to Royalton Hotel, a place where luxury meets comfort. Nestled in a serene location, we provide our guests with world-class amenities, exceptional service, and an unforgettable experience. Our team is dedicated to ensuring your stay is relaxing, enjoyable, and full of memories. Whether you're here for business, leisure, or a special occasion, Royalton Hotel offers the perfect blend of style and sophistication.</p>
        <p>Our commitment to excellence and attention to detail make us the perfect choice for your next stay. Let us make your experience extraordinary.</p>
    </section>

    <footer>
        <div class="footer-content">
            <div class="footer-links">
                <p>&copy; 2024 Royalton Hotel. All Rights Reserved.</p>
            </div>
            <div class="footer-contact">
                <p>Contact Us: contact@hotelxyz.com</p>
            </div>
        </div>
    </footer>
</body>
</html>

