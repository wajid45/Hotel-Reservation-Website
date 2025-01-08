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

    <!-- Room Detail Section -->
    <section id="room-details">
        <h2>Suite Room</h2>
        <div class="room-detail-content">
                <div class="room-slider">
                    <!-- Slider Container -->
                    <div class="slider-container">
                        <div class="slider">
                            <img src="img/r1.avif" alt="Standard Room Image 1">
                            <img src="img/r2.avif" alt="Standard Room Image 2">
                            <img src="img/r3.avif" alt="Standard Room Image 3">
                            <img src="img/r4.avif" alt="Standard Room Image 4">
                        </div>
                    </div>
                    <!-- Navigation Buttons -->
                    <button class="prev">&#10094;</button>
                    <button class="next">&#10095;</button>
                </div>
                    <div class="room-description">
                <h3>Room Features:</h3>
                <p>The Suite Room offers an expansive and refined space, featuring a separate living area, a private balcony, and luxury amenities designed for those who enjoy spaciousness and flexibility. Ideal for extended stays, families, or travelers seeking extra comfort and privacy, the Suite combines home-like convenience with hotel luxury.</p>
                <ul>
                    <li>King-Size Bed & Sofa Bed: A king-size bed paired with a plush sofa bed for extra comfort and flexibility.</li>
                    <li>Private Balcony: A private outdoor space to unwind and take in scenic views.</li>
                    <li>Fully Equipped Kitchenette: A small kitchen area with a microwave, refrigerator, and coffee maker for convenience.</li>
                    <li>Smart Entertainment: High-definition flat-screen TV, premium movie selection, and sound system.</li>
                    <li>Work Desk with High-Speed Internet: A dedicated work area with a desk, ergonomic chair, and fast internet for business travelers.</li>
                    <li>Complimentary Concierge Service: Personal concierge service to assist with reservations, special requests, and arranging tours or transportation.</li>
                </ul>
                <p><strong>Price:</strong> $350 per night</p>
                <a href="reservation.jsp" class="btn">Book Now</a>
            </div>
        </div>
    </section>
    <script>
        let currentIndex = 0;
        const images = document.querySelectorAll('.room-slider .slider img');
        const totalImages = images.length;
    
        function showImage(index) {
            const slider = document.querySelector('.room-slider .slider');
            slider.style.transform = `translateX(-${index * 100}%)`;
        }
    
        document.querySelector('.room-slider .next').addEventListener('click', function() {
            currentIndex = (currentIndex + 1) % totalImages;
            showImage(currentIndex);
        });
    
        document.querySelector('.room-slider .prev').addEventListener('click', function() {
            currentIndex = (currentIndex - 1 + totalImages) % totalImages;
            showImage(currentIndex);
        });
    
        // Optional: Automatic slider every 5 seconds
        setInterval(function() {
            currentIndex = (currentIndex + 1) % totalImages;
            showImage(currentIndex);
        }, 3000); // 3 seconds
    </script>

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
