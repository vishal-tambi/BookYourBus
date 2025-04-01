<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>About Us - Bus Booking</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg">
        <div class="container-fluid">
            <a class="navbar-brand text-white" href="index.jsp">Bus Booking</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
                    <li class="nav-item"><a class="nav-link" href="register.jsp">Register</a></li>
                    <li class="nav-item"><a class="nav-link" href="search.jsp">Search</a></li>
                    <li class="nav-item"><a class="nav-link" href="admin.jsp">Admin</a></li>
                    <li class="nav-item"><a class="nav-link" href="contact.jsp">Contact Us</a></li>
                    <li class="nav-item"><a class="nav-link" href="about.jsp">About Us</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Hero Section -->
    <section class="hero-about">
        <div>
            <h1>About Us</h1>
            <p>Discover the story behind Bus Booking and our mission to make travel seamless.</p>
        </div>
    </section>

    <!-- About Content -->
    <section class="content-section">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <div class="card p-4 mb-4">
                        <h3>Our Story</h3>
                        <p>Founded in 2023, Bus Booking was created to revolutionize the way people travel by bus. Our goal is to provide a fast, secure, and user-friendly platform for booking tickets across the country.</p>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card p-4 mb-4">
                        <h3>Our Mission</h3>
                        <p>We aim to connect travelers with reliable bus services, ensuring comfort and convenience at every step. Sustainability and customer satisfaction are at the heart of our operations.</p>
                    </div>
                </div>
            </div>
            <div class="text-center mt-4">
                <a href="search.jsp" class="btn btn-primary">Start Booking Now</a>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer>
        <p>© 2025 Bus Booking. All rights reserved.</p>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>