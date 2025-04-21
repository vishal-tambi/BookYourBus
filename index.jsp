<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bus Booking - Home</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="css/style.css">
    <style>
        /* Additional styles for the landing page */
        .hero {
            background: linear-gradient(rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.6)), 
                        url('https://images.unsplash.com/photo-1544620347-c4fd4a3d5957?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8YnVzfGVufDB8fDB8fHww&auto=format&fit=crop&w=1000&q=60');
            background-size: cover;
            background-position: center;
            height: 100vh;
            display: flex;
            align-items: center;
            text-align: center;
        }
        
        .search-box {
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 10px;
            padding: 30px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
            margin-top: 30px;
        }
        
        .popular-routes {
            padding: 80px 0;
            background-color: #f8f9fa;
        }
        
        .route-card {
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
            margin-bottom: 30px;
            height: 100%;
        }
        
        .route-card:hover {
            transform: translateY(-10px);
        }
        
        .route-card img {
            height: 200px;
            object-fit: cover;
            width: 100%;
        }
        
        .route-card .card-body {
            padding: 20px;
        }
        
        .route-price {
            font-size: 1.5rem;
            font-weight: 700;
            color: #1abc9c;
        }
        
        .how-it-works {
            padding: 80px 0;
            background-color: #fff;
        }
        
        .step-card {
            text-align: center;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            transition: transform 0.3s ease;
            height: 100%;
        }
        
        .step-card:hover {
            transform: translateY(-10px);
        }
        
        .step-card i {
            font-size: 3rem;
            color: #1abc9c;
            margin-bottom: 20px;
        }
        
        .step-card .step-number {
            display: inline-block;
            width: 40px;
            height: 40px;
            line-height: 40px;
            background-color: #1abc9c;
            color: white;
            border-radius: 50%;
            margin-bottom: 15px;
        }
        
        .testimonials {
            padding: 80px 0;
            background-color: #f8f9fa;
        }
        
        .testimonial-card {
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            margin-bottom: 30px;
            position: relative;
            background-color: #fff;
        }
        
        .testimonial-card::before {
            content: '\201C';
            font-size: 80px;
            position: absolute;
            top: -20px;
            left: 20px;
            color: #1abc9c;
            opacity: 0.2;
        }
        
        .testimonial-avatar {
            width: 70px;
            height: 70px;
            border-radius: 50%;
            object-fit: cover;
            margin-right: 20px;
        }
        
        .app-download {
            padding: 80px 0;
            background: linear-gradient(135deg, #2c3e50, #3498db);
            color: white;
        }
        
        .app-download img {
            max-width: 200px;
            margin: 10px;
        }
        
        .app-features {
            margin-top: 30px;
        }
        
        .app-feature {
            margin-bottom: 20px;
        }
        
        .app-feature i {
            font-size: 1.5rem;
            color: #1abc9c;
            margin-right: 10px;
        }
        
        .partners {
            padding: 60px 0;
            background-color: #fff;
        }
        
        .partner-logo {
            height: 80px;
            object-fit: contain;
            filter: grayscale(100%);
            opacity: 0.7;
            transition: all 0.3s ease;
        }
        
        .partner-logo:hover {
            filter: grayscale(0%);
            opacity: 1;
        }
        
        footer {
            background-color: #2c3e50;
            color: white;
            padding: 50px 0 20px;
        }
        
        .footer-links h5 {
            margin-bottom: 20px;
            font-weight: 600;
        }
        
        .footer-links ul {
            list-style: none;
            padding: 0;
        }
        
        .footer-links li {
            margin-bottom: 10px;
        }
        
        .footer-links a {
            color: #ddd;
            text-decoration: none;
            transition: color 0.3s ease;
        }
        
        .footer-links a:hover {
            color: #1abc9c;
        }
        
        .social-icons a {
            display: inline-block;
            width: 40px;
            height: 40px;
            line-height: 40px;
            text-align: center;
            background-color: rgba(255, 255, 255, 0.1);
            border-radius: 50%;
            margin-right: 10px;
            color: white;
            transition: all 0.3s ease;
        }
        
        .social-icons a:hover {
            background-color: #1abc9c;
            transform: translateY(-3px);
        }
        
        .copyright {
            margin-top: 30px;
            padding-top: 20px;
            border-top: 1px solid rgba(255, 255, 255, 0.1);
        }
        
        @media (max-width: 768px) {
            .hero {
                padding: 100px 0;
                height: auto;
            }
        }
    </style>
</head>
<body>
    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top">
        <div class="container">
            <a class="navbar-brand" href="index.jsp">
                <i class="fas fa-bus me-2"></i>Bus Booking
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link active" href="index.jsp">Home</a></li>
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
    <section class="hero">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 mx-auto text-center">
                    <h3 class="text-warning mb-2">Powered by Vishal's Travel</h3>
                    <h1 class="display-3 fw-bold mb-4">Book Your Bus Journey Today</h1>
                    <p class="lead mb-4">Experience the most convenient way to book bus tickets online. Fast, secure, and reliable service across India.</p>
                    <a href="search.jsp" class="btn btn-hero btn-lg">Book Now</a>
                </div>
            </div>
            
            <!-- Quick Search Box -->
            <div class="row">
                <div class="col-lg-8 mx-auto">
                    <div class="search-box">
                        <h4 class="mb-4">Find Your Bus</h4>
                        <form action="search.jsp" method="get">
                            <div class="row g-3">
                                <div class="col-md-5">
                                    <label for="fromCity" class="form-label">From</label>
                                    <select class="form-select" id="fromCity" name="from" required>
                                        <option value="" selected disabled>Select departure city</option>
                                        <option value="Mumbai">Mumbai</option>
                                        <option value="Delhi">Delhi</option>
                                        <option value="Bangalore">Bangalore</option>
                                        <option value="Chennai">Chennai</option>
                                        <option value="Kolkata">Kolkata</option>
                                    </select>
                                </div>
                                <div class="col-md-5">
                                    <label for="toCity" class="form-label">To</label>
                                    <select class="form-select" id="toCity" name="to" required>
                                        <option value="" selected disabled>Select destination city</option>
                                        <option value="Mumbai">Mumbai</option>
                                        <option value="Delhi">Delhi</option>
                                        <option value="Bangalore">Bangalore</option>
                                        <option value="Chennai">Chennai</option>
                                        <option value="Kolkata">Kolkata</option>
                                    </select>
                                </div>
                                <div class="col-md-2">
                                    <label for="travelDate" class="form-label">Date</label>
                                    <input type="date" class="form-control" id="travelDate" name="date" required>
                                </div>
                                <div class="col-12 text-center mt-3">
                                    <button type="submit" class="btn btn-primary">Search Buses</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Popular Routes Section -->
    <section class="popular-routes">
        <div class="container">
            <h2 class="text-center mb-2">Popular Routes</h2>
            <p class="text-center mb-5">Explore our most booked destinations with great deals</p>
            
            <div class="row">
                <div class="col-md-4">
                    <div class="card route-card">
                        <img src="https://images.unsplash.com/photo-1582510003544-4d00b7f74220?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8bXVtYmFpfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60" class="card-img-top" alt="Mumbai to Delhi">
                        <div class="card-body">
                            <h5 class="card-title">Mumbai to Delhi</h5>
                            <p class="card-text">Daily departures with premium buses</p>
                            <div class="d-flex justify-content-between align-items-center">
                                <span class="route-price">₹1,200</span>
                                <a href="search.jsp?from=Mumbai&to=Delhi" class="btn btn-outline-primary">Book Now</a>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-4">
                    <div class="card route-card">
                        <img src="https://images.unsplash.com/photo-1587474260584-136574528ed5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8YmFuZ2Fsb3JlfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60" class="card-img-top" alt="Bangalore to Chennai">
                        <div class="card-body">
                            <h5 class="card-title">Bangalore to Chennai</h5>
                            <p class="card-text">Luxury AC buses with reclining seats</p>
                            <div class="d-flex justify-content-between align-items-center">
                                <span class="route-price">₹800</span>
                                <a href="search.jsp?from=Bangalore&to=Chennai" class="btn btn-outline-primary">Book Now</a>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-4">
                    <div class="card route-card">
                        <img src="https://images.unsplash.com/photo-1582510003544-4d00b7f74220?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8bXVtYmFpfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60"~ class="card-img-top" alt="Delhi to Jaipur">
                        <div class="card-body">
                            <h5 class="card-title">Delhi to Jaipur</h5>
                            <p class="card-text">Express service with onboard entertainment</p>
                            <div class="d-flex justify-content-between align-items-center">
                                <span class="route-price">₹650</span>
                                <a href="search.jsp?from=Delhi&to=Jaipur" class="btn btn-outline-primary">Book Now</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- How It Works Section -->
    <section class="how-it-works">
        <div class="container">
            <h2 class="text-center mb-2">How It Works</h2>
            <p class="text-center mb-5">Book your bus tickets in 3 simple steps</p>
            
            <div class="row">
                <div class="col-md-4">
                    <div class="step-card">
                        <div class="step-number">1</div>
                        <i class="fas fa-search"></i>
                        <h4>Search</h4>
                        <p>Enter your source, destination, and travel date to find available buses.</p>
                    </div>
                </div>
                
                <div class="col-md-4">
                    <div class="step-card">
                        <div class="step-number">2</div>
                        <i class="fas fa-chair"></i>
                        <h4>Select</h4>
                        <p>Choose your preferred bus and select your seats from the seating layout.</p>
                    </div>
                </div>
                
                <div class="col-md-4">
                    <div class="step-card">
                        <div class="step-number">3</div>
                        <i class="fas fa-ticket-alt"></i>
                        <h4>Book</h4>
                        <p>Make a secure payment and receive your e-ticket instantly via email.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Features Section -->
    <section class="features">
        <div class="container">
            <h2 class="text-center mb-2">Why Choose Us?</h2>
            <p class="text-center mb-5">We offer the best bus booking experience in India</p>
            
            <div class="row">
                <div class="col-md-3">
                    <div class="feature-card">
                        <i class="fas fa-search"></i>
                        <h4>Easy Search</h4>
                        <p>Find the best routes with a simple search interface.</p>
                    </div>
                </div>
                
                <div class="col-md-3">
                    <div class="feature-card">
                        <i class="fas fa-chair"></i>
                        <h4>Seat Selection</h4>
                        <p>Choose your preferred seat with real-time availability.</p>
                    </div>
                </div>
                
                <div class="col-md-3">
                    <div class="feature-card">
                        <i class="fas fa-lock"></i>
                        <h4>Secure Booking</h4>
                        <p>Enjoy a safe and secure booking experience.</p>
                    </div>
                </div>
                
                <div class="col-md-3">
                    <div class="feature-card">
                        <i class="fas fa-headset"></i>
                        <h4>24/7 Support</h4>
                        <p>Our customer service team is always ready to help.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Testimonials Section -->
    <section class="testimonials">
        <div class="container">
            <h2 class="text-center mb-2">What Our Customers Say</h2>
            <p class="text-center mb-5">Thousands of satisfied travelers trust Bus Booking</p>
            
            <div class="row">
                <div class="col-md-4">
                    <div class="testimonial-card">
                        <div class="d-flex align-items-center mb-3">
                            <img src="https://randomuser.me/api/portraits/men/32.jpg" alt="Customer" class="testimonial-avatar">
                            <div>
                                <h5 class="mb-0">Rahul Sharma</h5>
                                <small class="text-muted">Mumbai</small>
                            </div>
                        </div>
                        <p>"The booking process was incredibly smooth. I was able to select my seat and complete payment in less than 5 minutes. Highly recommended!"</p>
                        <div class="text-warning">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-4">
                    <div class="testimonial-card">
                        <div class="d-flex align-items-center mb-3">
                            <img src="https://randomuser.me/api/portraits/women/44.jpg" alt="Customer" class="testimonial-avatar">
                            <div>
                                <h5 class="mb-0">Priya Patel</h5>
                                <small class="text-muted">Bangalore</small>
                            </div>
                        </div>
                        <p>"I had to reschedule my journey, and the customer service was extremely helpful. They processed my request quickly without any additional charges."</p>
                        <div class="text-warning">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star-half-alt"></i>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-4">
                    <div class="testimonial-card">
                        <div class="d-flex align-items-center mb-3">
                            <img src="https://randomuser.me/api/portraits/men/67.jpg" alt="Customer" class="testimonial-avatar">
                            <div>
                                <h5 class="mb-0">Amit Kumar</h5>
                                <small class="text-muted">Delhi</small>
                            </div>
                        </div>
                        <p>"I've been using Bus Booking for all my travels for the past year. The prices are competitive, and the buses are always clean and comfortable."</p>
                        <div class="text-warning">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- App Download Section -->
    <section class="app-download">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6">
                    <h2 class="mb-3">Download Our Mobile App</h2>
                    <p class="lead mb-4">Get the Bus Booking experience on your smartphone. Book tickets, manage bookings, and receive updates on the go.</p>
                    
                    <div class="app-features">
                        <div class="app-feature d-flex align-items-center">
                            <i class="fas fa-check-circle"></i>
                            <span>Easy booking interface</span>
                        </div>
                        <div class="app-feature d-flex align-items-center">
                            <i class="fas fa-check-circle"></i>
                            <span>Real-time bus tracking</span>
                        </div>
                        <div class="app-feature d-flex align-items-center">
                            <i class="fas fa-check-circle"></i>
                            <span>Exclusive app-only discounts</span>
                        </div>
                        <div class="app-feature d-flex align-items-center">
                            <i class="fas fa-check-circle"></i>
                            <span>Offline ticket access</span>
                        </div>
                    </div>
                    
                    <div class="mt-4">
                        <a href="#" class="me-2">
                            <img src="https://upload.wikimedia.org/wikipedia/commons/7/78/Google_Play_Store_badge_EN.svg" alt="Get it on Google Play" class="img-fluid" style="height: 50px;">
                        </a>
                        <a href="#">
                            <img src="https://upload.wikimedia.org/wikipedia/commons/3/3c/Download_on_the_App_Store_Badge.svg" alt="Download on App Store" class="img-fluid" style="height: 50px;">
                        </a>
                    </div>
                </div>
                
                <div class="col-lg-6 text-center mt-5 mt-lg-0">
                    <img src="https://cdn.pixabay.com/photo/2017/02/11/22/38/smartphone-2059232_1280.png" alt="Mobile App" class="img-fluid" style="max-height: 500px;">
                </div>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer>
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-6 mb-4 mb-md-0">
                    <div class="footer-links">
                        <h5>Bus Booking</h5>
                        <p>Your trusted partner for hassle-free bus travel across India.</p>
                        <div class="social-icons">
                            <a href="#"><i class="fab fa-facebook-f"></i></a>
                            <a href="#"><i class="fab fa-twitter"></i></a>
                            <a href="#"><i class="fab fa-instagram"></i></a>
                            <a href="#"><i class="fab fa-linkedin-in"></i></a>
                        </div>
                    </div>
                </div>
                
                <div class="col-lg-3 col-md-6 mb-4 mb-md-0">
                    <div class="footer-links">
                        <h5>Quick Links</h5>
                        <ul>
                            <li><a href="index.jsp">Home</a></li>
                            <li><a href="search.jsp">Search Buses</a></li>
                            <li><a href="about.jsp">About Us</a></li>
                            <li><a href="contact.jsp">Contact Us</a></li>
                        </ul>
                    </div>
                </div>
                
                <div class="col-lg-3 col-md-6 mb-4 mb-md-0">
                    <div class="footer-links">
                        <h5>Support</h5>
                        <ul>
                            <li><a href="#">FAQs</a></li>
                            <li><a href="#">Terms & Conditions</a></li>
                            <li><a href="#">Privacy Policy</a></li>
                            <li><a href="#">Refund Policy</a></li>
                        </ul>
                    </div>
                </div>
                
                <div class="col-lg-3 col-md-6">
                    <div class="footer-links">
                        <h5>Contact Us</h5>
                        <p><i class="fas fa-map-marker-alt me-2"></i> 123 Travel Lane, Mumbai, India</p>
                        <p><i class="fas fa-phone me-2"></i> +91 1234567890</p>
                        <p><i class="fas fa-envelope me-2"></i> info@busbooking.com</p>
                    </div>
                </div>
            </div>
            
            <div class="text-center copyright">
                <p>&copy; 2025 Bus Booking. All rights reserved.</p>
                <p>Developed by "Vishal Tambi"</p>
            </div>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Add fixed-top class to navbar when scrolling
        window.addEventListener('scroll', function() {
            const navbar = document.querySelector('.navbar');
            if (window.scrollY > 50) {
                navbar.classList.add('bg-dark');
                navbar.classList.add('shadow');
            } else {
                navbar.classList.remove('bg-dark');
                navbar.classList.remove('shadow');
            }
        });
        
        // Set minimum date for date picker to today
        const today = new Date().toISOString().split('T')[0];
        document.getElementById('travelDate').setAttribute('min', today);
        
        // Default to today's date
        document.getElementById('travelDate').value = today;
    </script>
</body>
</html>