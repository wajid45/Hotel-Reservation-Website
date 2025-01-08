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
        <h2>Deluxe Room</h2>
        <div class="room-detail-content">
                <div class="room-slider">
                    <!-- Slider Container -->
                    <div class="slider-container">
                        <div class="slider">
                            <img src="img/d1.jpg" alt="Standard Room Image 1">
                            <img src="img/d2.jpg" alt="Standard Room Image 2">
                            <img src="img/d3.jpg" alt="Standard Room Image 3">
                            <img src="img/d4.jpg" alt="Standard Room Image 4">
                        </div>
                    </div>
                    <!-- Navigation Buttons -->
                    <button class="prev">&#10094;</button>
                    <button class="next">&#10095;</button>
                </div>
        
            <div class="room-description">
                <h3>Room Features: </h3>
                <p>The Deluxe Room offers the ultimate in luxury and comfort. With spacious living areas, exceptional views, and modern amenities, it’s designed to meet the needs of discerning travelers who appreciate style and elegance. Perfect for those seeking a high-end experience with every comfort at their fingertips.</p><ul>
                    <li>Spacious Interiors: Enjoy ample space with luxurious furnishings and a contemporary design, providing a perfect blend of comfort and elegance.</li>
                    <li>King-Size Bed: A plush king-size bed with premium linens ensures a restful night’s sleep.</li>
                    <li>Breathtaking Views: Relax with panoramic views of the city, ocean, or mountains from large windows.</li>
                    <li>Smart Room Technology: Control lighting, temperature, and entertainment systems at the touch of a button with advanced in-room technology.</li>
                    <li>In-Room Safe: A secure safe for storing your valuables.</li>
                    <li>24/7 Room Service: Available round-the-clock to fulfill any dining requests.</li>
                </ul>
                <p><strong>Price:</strong> $200 per night</p>
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

    <!-- Footer Section (Same as the main page) -->
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
