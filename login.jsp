<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, javax.servlet.*, javax.servlet.http.*"%>

<%
    String userName = null;
    if (session != null) {
        userName = (String) session.getAttribute("user");
    }

    String email = request.getParameter("login-email");
    String password = request.getParameter("login-password");
    String errorMessage = "";

    // Handle login if email and password are provided
    if (email != null && password != null && request.getParameter("action") != null && request.getParameter("action").equals("login")) {
        if (session == null || userName == null) {
            Connection conn = null;
            PreparedStatement stmt = null;
            ResultSet rs = null;

            try {
                String dbURL = "jdbc:mysql://localhost:3306/home_deco";
                String dbUser = "root";
                String dbPass = "";

                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

                String sql = "SELECT * FROM users WHERE email = ? AND password = ?";
                stmt = conn.prepareStatement(sql);
                stmt.setString(1, email);
                stmt.setString(2, password);

                rs = stmt.executeQuery();

                if (rs.next()) {
                    session = request.getSession();
                    session.setAttribute("user", rs.getString("name"));
                    response.sendRedirect("reservation.jsp");
                    return;
                } else {
                    errorMessage = "Invalid email or password.";
                }
            } catch (Exception e) {
                errorMessage = "Error: " + e.getMessage();
            } finally {
                try {
                    if (rs != null) rs.close();
                    if (stmt != null) stmt.close();
                    if (conn != null) conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    // Handle sign-up logic
    if (request.getParameter("action") != null && request.getParameter("action").equals("signup")) {
        String name = request.getParameter("signup-name");
        String signupEmail = request.getParameter("signup-email");
        String signupPassword = request.getParameter("signup-password");
        String confirmPassword = request.getParameter("signup-confirm-password");

        if (signupEmail != null && signupPassword != null && confirmPassword != null && name != null) {
            if (!signupPassword.equals(confirmPassword)) {
                errorMessage = "Passwords do not match.";
            } else if (signupPassword.length() < 8) {
                errorMessage = "Password must be at least 8 characters long.";
            } else {
                Connection conn = null;
                PreparedStatement stmt = null;

                try {
                    String dbURL = "jdbc:mysql://localhost:3306/hotel_db";
                    String dbUser = "root";
                    String dbPass = "";

                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

                    String sql = "INSERT INTO users (name, email, password) VALUES (?, ?, ?)";
                    stmt = conn.prepareStatement(sql);
                    stmt.setString(1, name);
                    stmt.setString(2, signupEmail);
                    stmt.setString(3, signupPassword);

                    int rowsInserted = stmt.executeUpdate();
                    if (rowsInserted > 0) {
                        errorMessage = "User successfully registered. Please log in.";
                    } else {
                        errorMessage = "An error occurred during signup.";
                    }
                } catch (Exception e) {
                    errorMessage = "Error: " + e.getMessage();
                } finally {
                    try {
                        if (stmt != null) stmt.close();
                        if (conn != null) conn.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            }
        }
    }
%>

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
                <li><a href="javascript:void(0);" onclick="redirectToLogin()">Account</a></li>
            </ul>
        </nav>
        <script>
            function redirectToLogin() {
                sessionStorage.setItem('redirectAfterLogin', 'reservation.jsp');
                window.location.href = 'login.jsp';
            }
        </script>
    </header>

    <div class="container">
        <% if (userName != null) { %> 
            <div class="account-section" style="background-color: white; padding: 20px; border-radius: 8px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); width: 300px; text-align: center; margin: auto;">
                <h2>Welcome, <%= userName %></h2>
                <ul style="list-style-type: none; padding: 0; margin: 0;">
                    <li style="margin-bottom: 10px;">
                        <a href="index.jsp" class="btn">Back to Home</a>
                    </li>
                    <li style="margin-bottom: 10px;">
                        <a href="reservation.jsp" class="btn">Book your Room</a>
                    </li>
                    <li style="margin-bottom: 10px;">
                        <a href="rooms.jsp" class="btn">View Rooms</a>
                    </li>
                    <li style="margin-bottom: 10px;">
                        <a href="logout.jsp" class="btn">Logout</a>
                    </li>
                </ul>
            </div>
        <% } else { %> 
            <div class="form-container" id="login-form">
                <h2>Login</h2>
                <form action="login.jsp" method="POST" onsubmit="return validateLoginForm()">
                    <input type="hidden" name="action" value="login" />
                    <div class="form-group">
                        <label for="login-email">Email</label>
                        <input type="email" id="login-email" name="login-email" placeholder="Enter your email" required>
                        <span id="login-email-error" class="error-message" style="display: none;">Please enter a valid email address.</span>
                    </div>
                    <div class="form-group">
                        <label for="login-password">Password</label>
                        <input type="password" id="login-password" name="login-password" placeholder="Enter your password" required>
                        <span id="login-password-error" class="error-message" style="display: none;">Password cannot be empty.</span>
                    </div>
                    <button type="submit" class="btn">Login</button>
                    <p class="toggle-form">Don't have an account? <a href="javascript:void(0);" onclick="toggleForms()">Sign Up</a></p>
                    <% if (!errorMessage.isEmpty()) { %>
                        <div class="error-message"><%= errorMessage %></div>
                    <% } %>
                </form>
            </div>

            <div class="form-container hidden" id="signup-form">
                <h2>Sign Up</h2>
                <form action="login.jsp" method="POST" onsubmit="return validateSignupForm()">
                    <input type="hidden" name="action" value="signup" />
                    <div class="form-group">
                        <label for="signup-name">Name</label>
                        <input type="text" id="signup-name" name="signup-name" placeholder="Enter your name" required>
                        <span id="signup-name-error" class="error-message" style="display: none;">Name should only contain alphabets.</span>
                    </div>
                    <div class="form-group">
                        <label for="signup-email">Email</label>
                        <input type="email" id="signup-email" name="signup-email" placeholder="Enter your email" required>
                        <span id="signup-email-error" class="error-message" style="display: none;">Please enter a valid email address.</span>
                    </div>
                    <div class="form-group">
                        <label for="signup-password">Password</label>
                        <input type="password" id="signup-password" name="signup-password" placeholder="Enter your password" required>
                        <span id="signup-password-error" class="error-message" style="display: none;">Password must be at least 8 characters long, with at least one uppercase, one lowercase, one numeric, and one special character.</span>
                    </div>
                    <div class="form-group">
                        <label for="signup-confirm-password">Confirm Password</label>
                        <input type="password" id="signup-confirm-password" name="signup-confirm-password" placeholder="Confirm your password" required>
                        <span id="signup-confirm-password-error" class="error-message" style="display: none;">Passwords do not match.</span>
                    </div>
                    <button type="submit" class="btn">Sign Up</button>
                    <p class="toggle-form">Already have an account? <a href="javascript:void(0);" onclick="toggleForms()">Login</a></p>
                    <% if (!errorMessage.isEmpty()) { %>
                        <div class="error-message"><%= errorMessage %></div>
                    <% } %>
                </form>
            </div>
        <% } %> 
    </div>

    <% 
        // After successful login, check if there's a redirect URL stored in session
        String redirectUrl = (String) session.getAttribute("redirectAfterLogin");
        if (redirectUrl != null) {
            // If a redirect URL is found, redirect the user
            response.sendRedirect(redirectUrl);
            // Clear the redirect URL from the session after redirecting
            session.removeAttribute("redirectAfterLogin");
        }
    %>

    <script>
        function toggleForms() {
            const loginForm = document.getElementById("login-form");
            const signupForm = document.getElementById("signup-form");
            loginForm.classList.toggle("hidden");
            signupForm.classList.toggle("hidden");
        }

        function validateLoginForm() {
            const email = document.getElementById("login-email").value;
            const password = document.getElementById("login-password").value;
            let valid = true;

            document.getElementById("login-email-error").style.display = "none";
            document.getElementById("login-password-error").style.display = "none";

            const emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
            if (!emailPattern.test(email)) {
                document.getElementById("login-email-error").style.display = "block";
                valid = false;
            }

            if (password.trim() === "") {
                document.getElementById("login-password-error").style.display = "block";
                valid = false;
            }

            return valid;
        }

        function validateSignupForm() {
            const name = document.getElementById("signup-name").value;
            const email = document.getElementById("signup-email").value;
            const password = document.getElementById("signup-password").value;
            const confirmPassword = document.getElementById("signup-confirm-password").value;
            let valid = true;

            document.getElementById("signup-email-error").style.display = "none";
            document.getElementById("signup-password-error").style.display = "none";
            document.getElementById("signup-confirm-password-error").style.display = "none";
            document.getElementById("signup-name-error").style.display = "none";

            // Name Validation: Only alphabets
            const namePattern = /^[A-Za-z]+$/;
            if (!namePattern.test(name)) {
                document.getElementById("signup-name-error").style.display = "block";
                valid = false;
            }

            // Email Validation: Standard email format
            const emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
            if (!emailPattern.test(email)) {
                document.getElementById("signup-email-error").style.display = "block";
                valid = false;
            }

            // Password Validation: Minimum 8 characters, at least one uppercase, one lowercase, one numeric, one special character
            const passwordPattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
            if (!passwordPattern.test(password)) {
                document.getElementById("signup-password-error").style.display = "block";
                valid = false;
            }

            // Confirm Password Validation: Passwords should match
            if (password !== confirmPassword) {
                document.getElementById("signup-confirm-password-error").style.display = "block";
                valid = false;
            }

            return valid;
        }
    </script>

</body>
</html>
