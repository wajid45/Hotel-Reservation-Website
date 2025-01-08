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

    <!-- Splash Screen -->
    <div id="splashScreen" class="splash-screen">
        <div class="loading-container">
            <div class="loading-bar" id="loadingBar"></div>
            <p>Loading...</p>
        </div>
    </div>
     <!-- Script for Splash Screen with Loading Bar and Multi-threading Simulation -->
    <script>
        window.onload = function() {
            const splashScreen = document.getElementById('splashScreen');
            const loadingBar = document.getElementById('loadingBar');

            // Check if splash screen has been shown before
            if (!localStorage.getItem('splashShown')) {
                // If not, show splash screen
                localStorage.setItem('splashShown', 'true');  // Set flag in localStorage
                
                // Simulate "multi-threading" behavior using setInterval and setTimeout
                let progress = 0;
                let loadingInterval = setInterval(function() {
                    progress += 10;
                    loadingBar.style.width = progress + '%';

                    if (progress >= 100) {
                        clearInterval(loadingInterval); // Stop loading bar once it's full
                    }
                }, 500); // Update every 500ms

                // Simulate another asynchronous "thread" to handle splash screen timeout
                setTimeout(function() {
                    splashScreen.classList.add('hide-splash');
                    window.location.href = 'index.jsp';  // Redirect after 5 seconds
                }, 5000); // Time to show the splash screen (5 seconds)
            } else {
                // If splash screen was shown before, skip it
                splashScreen.classList.add('hide-splash');
            }
        };
    </script>

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
                <li><a href="javascript:void(0);" onclick="redirectToLogin()">Account</a></li>
            </ul>
        </nav>

        <script>
            function redirectToLogin() {
                // Store the redirect URL after successful login in sessionStorage
                sessionStorage.setItem('redirectAfterLogin', 'reservation.jsp');
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
        <a href="penthouse.jsp" class="room-card">
            <img src="img/pent4.jpg" alt="Penthouse Room">
            <h3>Penthouse Room</h3>
            <p>Price: $600 per night</p>
            <p>A luxurious top-floor suite with panoramic views, a private terrace, and exclusive amenities.</p>
        </a>
        <a href="studio-room.jsp" class="room-card">
            <img src="img/studioroom2.jpg" alt="Studio Room">
            <h3>Studio Room</h3>
            <p>Price: $200 per night</p>
            <p>A cozy, open-concept room with a combined living and sleeping area, and a kitchenette for convenience.</p>
        </a>
        <div class="view-all-rooms-btn">
            <a href="rooms.jsp">
                <button>View All Rooms</button>
            </a>
        </div>
    </section>

    <section id="services">
        <h2>Our Services</h2>
        <p>At Royalton Hotel, we offer a wide range of services designed to make your stay as comfortable and enjoyable as possible. Our dedicated team is always available to cater to your needs.</p>
        <h3>Hotel Services:</h3>
        <ul>
            <li>24/7 Room Service</li>
            <li>Free Wi-Fi throughout the hotel</li>
            <li>Swimming Pool & Spa</li>
            <li>Fitness Center</li>
            <li>Complimentary Airport Shuttle</li>
            <li>On-site Restaurant & Bar</li>
        </ul>
    </section>

    <section id="about">
        <h2>About Royalton Hotel</h2>
        <p>Welcome to Royalton Hotel, a place where luxury meets comfort. We provide our guests with world-class amenities, exceptional service, and an unforgettable experience. Our team is dedicated to ensuring your stay is relaxing, enjoyable, and full of memories.</p>
    </section>
    
     <!-- FAQ Icon -->
    <div class="faq-icon" onclick="toggleFaqModal()">?</div>

    <!-- FAQ Modal -->
    <div class="faq-modal" id="faqModal">
        <div class="faq-modal-header">FAQs</div>

        <!-- FAQ List -->
        <div class="faq-item">
            <div class="faq-question" onclick="toggleAnswer(this)">1. How can I track my order?</div>
            <div class="faq-answer">You can track your order through the tracking number provided in your confirmation email.</div>
        </div>
        <div class="faq-item">
            <div class="faq-question" onclick="toggleAnswer(this)">2. Do you offer free shipping?</div>
            <div class="faq-answer">Yes, we offer free shipping on orders over $500 within the United States.</div>
        </div>

        <!-- FAQ Form -->
        <div class="faq-form">
            <h3>Have a question?</h3>
            <form id="faqForm" method="POST" action="data.jsp" onsubmit="return validateFaqForm()">
                <input type="email" id="faq-email" name="email" placeholder="Your E-mail" required>
                <span id="faq-email-error" class="error-message" style="display: none;">Please enter a valid email address.</span>
                <textarea id="faq-question" name="question" rows="4" placeholder="Your Question" required></textarea>
                <span id="faq-question-error" class="error-message" style="display: none;">Please enter a question.</span>
                <button type="submit">Submit</button>
            </form>
        </div>

    </div>

    <script>
        function toggleFaqModal() {
            const faqModal = document.getElementById('faqModal');
            faqModal.style.display = faqModal.style.display === 'none' || faqModal.style.display === '' ? 'flex' : 'none';
        }

        function toggleAnswer(element) {
            const answer = element.nextElementSibling;
            answer.style.display = answer.style.display === 'none' || answer.style.display === '' ? 'block' : 'none';
        }
    </script>
    
     <footer>
        <div class="footer-content">
            <p>&copy; 2024 Royalton Hotel. All Rights Reserved.</p>
            <p>Contact Us: contact@hotelxyz.com</p>
        </div>
    </footer>

</body>
</html>
