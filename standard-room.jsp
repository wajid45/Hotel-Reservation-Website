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

    <section id="room-details">
        <h2>Standard Room</h2>
        <div class="room-detail-content">
            <div class="room-slider">
                <!-- Slider Container -->
                <div class="slider-container">
                    <div class="slider">
                        <img src="img/s1.jpeg" alt="Standard Room Image 1">
                        <img src="img/s2.avif" alt="Standard Room Image 2">
                        <img src="img/s3.avif" alt="Standard Room Image 3">
                   <!--     <img src="img/r4.avif" alt="Standard Room Image 4">  -->
                    </div>
                </div>
                <!-- Navigation Buttons -->
                <button class="prev">&#10094;</button>
                <button class="next">&#10095;</button>
            </div>
    
            <div class="room-description">
                <h3>Room Features:</h3>
                <p>The Standard Room offers a cozy and comfortable space for travelers who want a practical and affordable option. Equipped with all the essentials and modern amenities, this room is perfect for short stays, solo travelers, or couples. Enjoy a simple, yet comfortable experience without compromising on quality.</p>
                <ul>
                    <li>Queen-sized bed</li>
                    <li>Modern Decor</li>
                    <li>Free Wi-Fi</li>
                    <li>Flat-screen TV</li>
                    <li>Private Bathroom</li>
                    <li>Complimentary toiletries</li>
                </ul>
                <p><strong>Price:</strong> Starting at $80 per night</p>
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
    
    <!-- Footer Section -->
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
