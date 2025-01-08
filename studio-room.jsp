<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Royalton Hotel - Studio Room</title>
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
        <h2>Studio Room</h2>
        <div class="room-detail-content">
            <div class="room-slider">
                <!-- Slider Container -->
                <div class="slider-container">
                    <div class="slider">
                        <img src="img/studioroom.jpg" alt="Studio Room Image 1">
                        <img src="img/studioroom2.jpg" alt="Studio Room Image 2">
                        <img src="img/studioroom3.jpg" alt="Studio Room Image 3">
                        <img src="img/studioroom4.jpg" alt="Studio Room Image 4">
                    </div>
                </div>
                <!-- Navigation Buttons -->
                <button class="prev">&#10094;</button>
                <button class="next">&#10095;</button>
            </div>
        
            <div class="room-description">
                <h3>Room Features: </h3>
                <p>The Studio Room offers a comfortable and functional open-plan space, perfect for solo travelers or couples. It combines a living and sleeping area along with a kitchenette for a convenient, self-sufficient stay.</p>
                <ul>
                    <li>Open Concept: A spacious, open design combining the living, sleeping, and cooking areas.</li>
                    <li>Fully Equipped Kitchenette: Includes a microwave, fridge, and other essentials for self-catering.</li>
                    <li>Compact Yet Comfortable: Ideal for short stays, with all the amenities you need in a compact space.</li>
                    <li>Smart TV: For entertainment and streaming your favorite content.</li>
                    <li>Private Bathroom: Equipped with modern amenities for comfort.</li>
                    <li>Work Desk: A small desk area perfect for business travelers.</li>
                </ul>
                <p><strong>Price:</strong> $150 per night</p>
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

