<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us - Bus Booking</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="css/style.css">
    <style>
        .hero-about {
            background: linear-gradient(rgba(0, 0, 0, 0.7), rgba(0, 0, 0, 0.7)), url('https://images.unsplash.com/photo-1544620347-c4fd4a3d5957?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8YnVzfGVufDB8fDB8fHww&auto=format&fit=crop&w=1000&q=60');
            background-size: cover;
            background-position: center;
            color: white;
            padding: 100px 0;
            text-align: center;
            margin-bottom: 40px;
        }
        
        .hero-about h1 {
            font-size: 3.5rem;
            font-weight: 700;
            margin-bottom: 20px;
        }
        
        .hero-about p {
            font-size: 1.2rem;
            max-width: 700px;
            margin: 0 auto;
        }
        
        .content-section {
            padding: 60px 0;
        }
        
        .feature-card {
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            transition: transform 0.3s ease;
            height: 100%;
        }
        
        .feature-card:hover {
            transform: translateY(-10px);
        }
        
        .feature-card h3 {
            color: #0d6efd;
            margin-bottom: 15px;
        }
        
        .team-member {
            text-align: center;
            margin-bottom: 30px;
        }
        
        .team-member img {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            object-fit: cover;
            margin-bottom: 15px;
            border: 5px solid #f8f9fa;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }
        
        .testimonial {
            background-color: #f8f9fa;
            border-radius: 10px;
            padding: 25px;
            margin-bottom: 20px;
            position: relative;
        }
        
        .testimonial::before {
            content: '\201C';
            font-size: 60px;
            position: absolute;
            top: -10px;
            left: 10px;
            color: #0d6efd;
            opacity: 0.2;
        }
        
        .stats-container {
            background-color: #0d6efd;
            color: white;
            padding: 60px 0;
            text-align: center;
        }
        
        .stat-item h2 {
            font-size: 3rem;
            font-weight: 700;
            margin-bottom: 10px;
        }
        
        .timeline {
            position: relative;
            max-width: 1200px;
            margin: 0 auto;
        }
        
        .timeline::after {
            content: '';
            position: absolute;
            width: 6px;
            background-color: #0d6efd;
            top: 0;
            bottom: 0;
            left: 50%;
            margin-left: -3px;
        }
        
        .timeline-container {
            padding: 10px 40px;
            position: relative;
            background-color: inherit;
            width: 50%;
        }
        
        .timeline-container::after {
            content: '';
            position: absolute;
            width: 25px;
            height: 25px;
            right: -17px;
            background-color: white;
            border: 4px solid #0d6efd;
            top: 15px;
            border-radius: 50%;
            z-index: 1;
        }
        
        .left {
            left: 0;
        }
        
        .right {
            left: 50%;
        }
        
        .left::before {
            content: " ";
            height: 0;
            position: absolute;
            top: 22px;
            width: 0;
            z-index: 1;
            right: 30px;
            border: medium solid #f8f9fa;
            border-width: 10px 0 10px 10px;
            border-color: transparent transparent transparent #f8f9fa;
        }
        
        .right::before {
            content: " ";
            height: 0;
            position: absolute;
            top: 22px;
            width: 0;
            z-index: 1;
            left: 30px;
            border: medium solid #f8f9fa;
            border-width: 10px 10px 10px 0;
            border-color: transparent #f8f9fa transparent transparent;
        }
        
        .right::after {
            left: -16px;
        }
        
        .timeline-content {
            padding: 20px 30px;
            background-color: #f8f9fa;
            position: relative;
            border-radius: 6px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }
        
        footer {
            background-color: #343a40;
            color: white;
            padding: 30px 0;
            text-align: center;
        }
        
        .social-icons a {
            color: white;
            font-size: 1.5rem;
            margin: 0 10px;
            transition: color 0.3s ease;
        }
        
        .social-icons a:hover {
            color: #0d6efd;
        }
        
        @media screen and (max-width: 768px) {
            .timeline::after {
                left: 31px;
            }
            
            .timeline-container {
                width: 100%;
                padding-left: 70px;
                padding-right: 25px;
            }
            
            .timeline-container::before {
                left: 60px;
                border: medium solid #f8f9fa;
                border-width: 10px 10px 10px 0;
                border-color: transparent #f8f9fa transparent transparent;
            }
            
            .left::after, .right::after {
                left: 15px;
            }
            
            .right {
                left: 0%;
            }
        }
    </style>
</head>
<body>
    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand" href="index.jsp">
                <i class="fas fa-bus me-2"></i>Bus Booking
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
                    <li class="nav-item"><a class="nav-link" href="register.jsp">Register</a></li>
                    <li class="nav-item"><a class="nav-link" href="search.jsp">Search</a></li>
                    <li class="nav-item"><a class="nav-link" href="admin.jsp">Admin</a></li>
                    <li class="nav-item"><a class="nav-link active" href="about.jsp">About Us</a></li>
                    <li class="nav-item"><a class="nav-link" href="contact.jsp">Contact Us</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Hero Section -->
    <section class="hero-about">
        <div class="container">
            <h1>About Bus Booking</h1>
            <p>Revolutionizing the way India travels with seamless, secure, and convenient bus booking solutions since 2023.</p>
            <a href="search.jsp" class="btn btn-primary btn-lg mt-4">Book Your Journey</a>
        </div>
    </section>

    <!-- About Content -->
    <section class="content-section">
        <div class="container">
            <div class="row mb-5">
                <div class="col-lg-6">
                    <h2 class="mb-4">Our Story</h2>
                    <p class="lead">Founded in 2023, Bus Booking emerged from a simple idea: to make bus travel hassle-free for everyone.</p>
                    <p>What started as a small startup has now grown into one of India's most trusted bus booking platforms. Our journey began when our founders experienced firsthand the challenges of booking bus tickets - long queues, lack of information, and unreliable services.</p>
                    <p>Today, we connect thousands of travelers with hundreds of bus operators across the country, offering a seamless booking experience that puts the customer first.</p>
                </div>
                <div class="col-lg-6">
                    <img src="https://images.unsplash.com/photo-1570125909232-eb263c188f7e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8YnVzJTIwdHJhdmVsfGVufDB8fDB8fHww&auto=format&fit=crop&w=600&q=60" alt="Bus Travel" class="img-fluid rounded shadow">
                </div>
            </div>

            <div class="row mb-5">
                <div class="col-12 text-center mb-4">
                    <h2>Why Choose Us</h2>
                    <p class="lead">We're committed to making your journey comfortable, convenient, and memorable.</p>
                </div>
                <div class="col-md-4">
                    <div class="feature-card card p-4 mb-4">
                        <div class="text-center mb-3">
                            <i class="fas fa-ticket-alt fa-3x text-primary"></i>
                        </div>
                        <h3 class="text-center">Easy Booking</h3>
                        <p>Book your tickets in just a few clicks. Our user-friendly interface makes the booking process simple and efficient.</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="feature-card card p-4 mb-4">
                        <div class="text-center mb-3">
                            <i class="fas fa-shield-alt fa-3x text-primary"></i>
                        </div>
                        <h3 class="text-center">Secure Payments</h3>
                        <p>Your financial information is always protected with our state-of-the-art security systems and encryption.</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="feature-card card p-4 mb-4">
                        <div class="text-center mb-3">
                            <i class="fas fa-headset fa-3x text-primary"></i>
                        </div>
                        <h3 class="text-center">24/7 Support</h3>
                        <p>Our dedicated customer service team is available round the clock to assist you with any queries or issues.</p>
                    </div>
                </div>
            </div>

            <!-- Company Stats -->
            <div class="stats-container my-5">
                <div class="container">
                    <div class="row">
                        <div class="col-md-3 stat-item">
                            <h2>500+</h2>
                            <p>Bus Operators</p>
                        </div>
                        <div class="col-md-3 stat-item">
                            <h2>10,000+</h2>
                            <p>Daily Bookings</p>
                        </div>
                        <div class="col-md-3 stat-item">
                            <h2>1,000+</h2>
                            <p>Destinations</p>
                        </div>
                        <div class="col-md-3 stat-item">
                            <h2>98%</h2>
                            <p>Customer Satisfaction</p>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Our Mission and Vision -->
            <div class="row mb-5">
                <div class="col-lg-6">
                    <div class="card p-4 mb-4 h-100">
                        <h3><i class="fas fa-bullseye text-primary me-2"></i> Our Mission</h3>
                        <p>To revolutionize bus travel by providing a reliable, transparent, and user-friendly platform that connects travelers with quality bus services across India.</p>
                        <p>We aim to make bus travel the preferred mode of transportation by ensuring comfort, convenience, and affordability for all our customers.</p>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="card p-4 mb-4 h-100">
                        <h3><i class="fas fa-eye text-primary me-2"></i> Our Vision</h3>
                        <p>To become India's most trusted travel companion, setting new standards in the bus transportation industry through innovation, reliability, and customer-centric services.</p>
                        <p>We envision a future where bus travel is seamless, sustainable, and accessible to everyone, regardless of their location or destination.</p>
                    </div>
                </div>
            </div>

            <!-- Our Journey Timeline -->
            <div class="row mb-5">
                <div class="col-12 text-center mb-4">
                    <h2>Our Journey</h2>
                    <p class="lead">The milestones that shaped Bus Booking</p>
                </div>
                <div class="col-12">
                    <div class="timeline">
                        <div class="timeline-container left">
                            <div class="timeline-content">
                                <h3>2023</h3>
                                <p>Bus Booking was founded with a vision to transform bus travel in India.</p>
                            </div>
                        </div>
                        <div class="timeline-container right">
                            <div class="timeline-content">
                                <h3>2023</h3>
                                <p>Launched our first version of the website with 50 bus operators.</p>
                            </div>
                        </div>
                        <div class="timeline-container left">
                            <div class="timeline-content">
                                <h3>2024</h3>
                                <p>Expanded our services to cover 500+ cities across India.</p>
                            </div>
                        </div>
                        <div class="timeline-container right">
                            <div class="timeline-content">
                                <h3>2025</h3>
                                <p>Reached the milestone of 1 million happy customers.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Our Team -->
            <div class="row mb-5">
                <div class="col-12 text-center mb-4">
                    <h2>Meet Our Team</h2>
                    <p class="lead">The dedicated professionals behind Bus Booking</p>
                </div>
                <div class="col-lg-6 col-md-3">
                    <div class="team-member">
                        <img src="images/vresume.jpg" alt="Team Member">
                        <h4>Vishal Tambi</h4>
                        <p class="text-muted">Founder & CEO</p>
                    </div>
                </div>
                <!-- <div class="col-lg-3 col-md-6">
                    <div class="team-member">
                        <img src="https://randomuser.me/api/portraits/women/44.jpg" alt="Team Member">
                        <h4>Priya Sharma</h4>
                        <p class="text-muted">Chief Technology Officer</p>
                    </div>
                </div> -->
                <div class="col-lg-5 col-md-6">
                    <div class="team-member">
                        <img src="images/son_of_vishal_tambi.jpg" alt="Team Member">
                        <h4>Govind Goyal</h4>
                        <p class="text-muted">Operations Manager</p>
                    </div>
                </div>
                <!-- <div class="col-lg-3 col-md-6">
                    <div class="team-member">
                        <img src="https://randomuser.me/api/portraits/women/65.jpg" alt="Team Member">
                        <h4>Neha Gupta</h4>
                        <p class="text-muted">Customer Relations</p>
                    </div>
                </div> -->
            </div>

            <!-- Testimonials -->
            <div class="row mb-5">
                <div class="col-12 text-center mb-4">
                    <h2>What Our Customers Say</h2>
                    <p class="lead">Don't just take our word for it</p>
                </div>
                <div class="col-md-4">
                    <div class="testimonial">
                        <p>"Bus Booking made my trip to Manali hassle-free. The booking process was simple, and the bus was exactly as described. Will definitely use again!"</p>
                        <div class="d-flex align-items-center mt-3">
                            <img src="https://randomuser.me/api/portraits/men/41.jpg" alt="Customer" class="rounded-circle me-3" width="50">
                            <div>
                                <h5 class="mb-0">Vikram Singh</h5>
                                <small class="text-muted">Delhi</small>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="testimonial">
                        <p>"I was skeptical about booking online, but Bus Booking exceeded my expectations. The customer service was excellent when I needed to reschedule my journey."</p>
                        <div class="d-flex align-items-center mt-3">
                            <img src="https://randomuser.me/api/portraits/women/63.jpg" alt="Customer" class="rounded-circle me-3" width="50">
                            <div>
                                <h5 class="mb-0">Ananya Desai</h5>
                                <small class="text-muted">Mumbai</small>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="testimonial">
                        <p>"As a frequent traveler, I've tried many booking platforms, but Bus Booking stands out for its reliability and user-friendly interface. It's now my go-to for all bus journeys."</p>
                        <div class="d-flex align-items-center mt-3">
                            <img src="https://randomuser.me/api/portraits/men/77.jpg" alt="Customer" class="rounded-circle me-3" width="50">
                            <div>
                                <h5 class="mb-0">Rahul Mehta</h5>
                                <small class="text-muted">Bangalore</small>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- CTA -->
            <div class="row">
                <div class="col-12 text-center">
                    <div class="card p-5 bg-light">
                        <h2>Ready to Experience the Difference?</h2>
                        <p class="lead mb-4">Join thousands of satisfied travelers who have made Bus Booking their preferred choice for bus travel.</p>
                        <div>
                            <a href="search.jsp" class="btn btn-primary btn-lg me-2">Book Now</a>
                            <a href="contact.jsp" class="btn btn-outline-primary btn-lg">Contact Us</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer>
        <div class="container">
            <div class="row">
                <div class="col-md-4 mb-4 mb-md-0">
                    <h5>Bus Booking</h5>
                    <p>Your trusted partner for hassle-free bus travel across India.</p>
                    <div class="social-icons mb-3">
                        <a href="#"><i class="fab fa-facebook"></i></a>
                        <a href="#"><i class="fab fa-twitter"></i></a>
                        <a href="#"><i class="fab fa-instagram"></i></a>
                        <a href="#"><i class="fab fa-linkedin"></i></a>
                    </div>
                </div>
                <div class="col-md-4 mb-4 mb-md-0">
                    <h5>Quick Links</h5>
                    <ul class="list-unstyled">
                        <li><a href="index.jsp" class="text-white">Home</a></li>
                        <li><a href="search.jsp" class="text-white">Search Buses</a></li>
                        <li><a href="login.jsp" class="text-white">Login</a></li>
                        <li><a href="register.jsp" class="text-white">Register</a></li>
                    </ul>
                </div>
                <div class="col-md-4">
                    <h5>Contact Us</h5>
                    <address>
                        <p><i class="fas fa-map-marker-alt me-2"></i> 123 Travel Jaipur, Rajasthan, India</p>
                        <p><i class="fas fa-phone me-2"></i> +91 9782066607</p>
                        <p><i class="fas fa-envelope me-2"></i> info@busbooking.com</p>
                    </address>
                </div>
            </div>
            <hr class="bg-light">
            <p class="text-center mb-0"> 2025 Bus Booking. All rights reserved.</p>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>