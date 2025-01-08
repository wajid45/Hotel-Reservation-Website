<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Royalton Hotel - Family Room</title>
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
        <h2>Family Room</h2>
        <div class="room-detail-content">
            <div class="room-slider">
                <!-- Slider Container -->
                <div class="slider-container">
                    <div class="slider">
                        <img src="img/familyroom1.jpg" alt="Family Room Image 1">
                        <img src="img/familyroom2.jpg" alt="Family Room Image 2">
                        <img src="img/familyroom3.jpg" alt="Family Room Image 3">
                        <img src="img/familyroom4.jpg" alt="Family Room Image 4">
                    </div>
                </div>
                <!-- Navigation Buttons -->
                <button class="prev">&#10094;</button>
                <button class="next">&#10095;</button>
            </div>
        
            <div class="room-description">
                <h3>Room Features: </h3>
                <p>The Family Room is perfect for families seeking comfort and convenience. With spacious interiors, multiple beds, and family-friendly amenities, this room provides the ideal space for your loved ones to unwind and enjoy their stay.</p>
                <ul>
                    <li>Multiple Beds: Designed with large families in mind, offering multiple beds for a comfortable stay.</li>
                    <li>Spacious Interiors: Plenty of room for everyone to relax, with comfortable seating and modern decor.</li>
                    <li>Kid-Friendly Amenities: The room is equipped with toys, books, and entertainment options for children.</li>
                    <li>Private Bathroom: A large bathroom with all the necessary amenities to cater to the family.</li>
                    <li>Panoramic Views: Enjoy scenic views of the surroundings through large windows.</li>
                    <li>24/7 Room Service: Available to cater to your family’s needs at any time.</li>
                </ul>
                <p><strong>Price:</strong> $400 per night</p>
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
