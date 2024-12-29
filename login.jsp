<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, javax.servlet.*, javax.servlet.http.*"%>

<%
    // Check if user is already logged in
    HttpSession Sessions = request.getSession(false);
    String userName = null;
    if (session != null) {
        userName = (String) session.getAttribute("user");
    }

    String email = request.getParameter("login-email");
    String password = request.getParameter("login-password");
    String errorMessage = "";

    // Handle login if email and password are provided
    if (email != null && password != null) {
        if (session == null || userName == null) {
            Connection conn = null;
            PreparedStatement stmt = null;
            ResultSet rs = null;

            try {
                // Database connection details
                String dbURL = "jdbc:mysql://localhost:3306/hotel_db";
                String dbUser = "root"; // Your MySQL username
                String dbPass = ""; // Your MySQL password (use the correct password)

                // Load the MySQL JDBC driver (optional for newer versions)
                Class.forName("com.mysql.cj.jdbc.Driver");

                // Establish the connection
                conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

                // SQL query to check user credentials
                String sql = "SELECT * FROM users WHERE email = ? AND password = ?";
                stmt = conn.prepareStatement(sql);
                stmt.setString(1, email);
                stmt.setString(2, password);

                // Execute query
                rs = stmt.executeQuery();

                if (rs.next()) {
                    // User found, login successful
                    session = request.getSession();  // Create a session
                    session.setAttribute("user", rs.getString("name"));  // Store user name in session
                    response.sendRedirect("reservation.jsp");  // Redirect to reservation page
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
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="container">
        <% if (userName != null) { %> 
            <!-- If user is logged in, show account section -->
            <div class="account-section" class="account-section" style="background-color: white; padding: 20px; border-radius: 8px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); width: 300px; text-align: center; margin: auto;">
                <h2>Welcome, <%= userName %></h2>
                <a href="reservation.jsp" class="btn">Go to Reservations</a>
                <a href="logout.jsp" class="btn">Logout</a> <!-- Logout link -->
            </div>
        <% } else { %> 
            <!-- If user is not logged in, show login/signup form -->
            <!-- Login Form -->
            <div class="form-container" id="login-form">
                <h2>Login</h2>
                <form action="login.jsp" method="POST" onsubmit="return validateLoginForm()">
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
                    <% if (!errorMessage.isEmpty()) { %>
                        <div class="error-message"><%= errorMessage %></div>
                    <% } %>
                    <button type="submit" class="btn">Login</button>
                    <p class="toggle-form">Don't have an account? <a href="javascript:void(0);" onclick="toggleForms()">Sign Up</a></p>
                </form>
            </div>

            <!-- Sign Up Form -->
            <div class="form-container hidden" id="signup-form">
                <h2>Sign Up</h2>
                <form action="signup.jsp" method="POST" onsubmit="return validateSignupForm()">
                    <div class="form-group">
                        <label for="signup-name">Name</label>
                        <input type="text" id="signup-name" name="signup-name" placeholder="Enter your name" required>
                    </div>
                    <div class="form-group">
                        <label for="signup-email">Email</label>
                        <input type="email" id="signup-email" name="signup-email" placeholder="Enter your email" required>
                        <span id="signup-email-error" class="error-message" style="display: none;">Please enter a valid email address.</span>
                    </div>
                    <div class="form-group">
                        <label for="signup-password">Password</label>
                        <input type="password" id="signup-password" name="signup-password" placeholder="Enter your password" required>
                        <span id="signup-password-error" class="error-message" style="display: none;">Password must be at least 8 characters long.</span>
                    </div>
                    <div class="form-group">
                        <label for="signup-confirm-password">Confirm Password</label>
                        <input type="password" id="signup-confirm-password" name="signup-confirm-password" placeholder="Confirm your password" required>
                        <span id="signup-confirm-password-error" class="error-message" style="display: none;">Passwords do not match.</span>
                    </div>
                    <button type="submit" class="btn">Sign Up</button>
                    <p class="toggle-form">Already have an account? <a href="javascript:void(0);" onclick="toggleForms()">Login</a></p>
                </form>
            </div>
        <% } %> 
    </div>

    <script>
        // Toggle between Login and Signup Forms
        function toggleForms() {
            const loginForm = document.getElementById("login-form");
            const signupForm = document.getElementById("signup-form");
            loginForm.classList.toggle("hidden");
            signupForm.classList.toggle("hidden");
        }

        // Validate Login Form
        function validateLoginForm() {
            const email = document.getElementById("login-email").value;
            const password = document.getElementById("login-password").value;
            let valid = true;

            // Reset error messages
            document.getElementById("login-email-error").style.display = "none";
            document.getElementById("login-password-error").style.display = "none";

            // Validate Email
            const emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
            if (!emailPattern.test(email)) {
                document.getElementById("login-email-error").style.display = "block";
                valid = false;
            }

            // Validate Password
            if (password.trim() === "") {
                document.getElementById("login-password-error").style.display = "block";
                valid = false;
            }

            return valid;
        }

        // Validate SignUp Form
        function validateSignupForm() {
            const name = document.getElementById("signup-name").value;
            const email = document.getElementById("signup-email").value;
            const password = document.getElementById("signup-password").value;
            const confirmPassword = document.getElementById("signup-confirm-password").value;
            let valid = true;

            // Reset error messages
            document.getElementById("signup-email-error").style.display = "none";
            document.getElementById("signup-password-error").style.display = "none";
            document.getElementById("signup-confirm-password-error").style.display = "none";

            // Validate Email
            const emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
            if (!emailPattern.test(email)) {
                document.getElementById("signup-email-error").style.display = "block";
                valid = false;
            }

            // Validate Password Length
            if (password.length < 8) {
                document.getElementById("signup-password-error").style.display = "block";
                valid = false;
            }

            // Confirm Password Match
            if (password !== confirmPassword) {
                document.getElementById("signup-confirm-password-error").style.display = "block";
                valid = false;
            }

            return valid;
        }
    </script>
</body>
</html>
