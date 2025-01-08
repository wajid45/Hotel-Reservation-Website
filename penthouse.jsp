<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Royalton Hotel - Penthouse Room</title>
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
        <h2>Penthouse Room</h2>
        <div class="room-detail-content">
            <div class="room-slider">
                <!-- Slider Container -->
                <div class="slider-container">
                    <div class="slider">
                        <img src="img/pen1.jpg" alt="Penthouse Room Image 1">
                        <img src="img/pen2.jpg" alt="Penthouse Room Image 2">
                        <img src="img/pen3.jpg" alt="Penthouse Room Image 3">
                        <img src="img/pen4.jpg" alt="Penthouse Room Image 4">
                    </div>
                </div>
                <!-- Navigation Buttons -->
                <button class="prev">&#10094;</button>
                <button class="next">&#10095;</button>
            </div>
        
            <div class="room-description">
                <h3>Room Features: </h3>
                <p>The Penthouse Room offers unmatched luxury and sophistication. With panoramic views, high-end furnishings, and a private terrace, this room provides an exclusive experience designed for the most discerning guests.</p>
                <ul>
                    <li>Private Terrace: A large terrace offering breathtaking views of the city or ocean.</li>
                    <li>Exclusive Furnishings: Top-quality furniture and luxury decor for a regal stay.</li>
                    <li>Full-Size Kitchen: A fully equipped kitchen to cater to your culinary desires.</li>
                    <li>Advanced Technology: State-of-the-art room controls for lighting, temperature, and entertainment.</li>
                    <li>Jacuzzi: An indulgent Jacuzzi to help you unwind in style.</li>
                    <li>24/7 Concierge Service: Available to meet all your needs and arrange exclusive services.</li>
                </ul>
                <p><strong>Price:</strong> $800 per night</p>
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
