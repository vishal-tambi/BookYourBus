<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Your Ticket - Bus Booking</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
    <style>
        /* Custom styles for the ticket */
        .ticket-container {
            max-width: 700px;
            margin: 0 auto;
            padding: 2rem;
            background: linear-gradient(135deg, #ffffff, #f8f9fa);
            border-radius: 15px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            animation: fadeIn 1s ease-in;
            position: relative;
            border: 2px dashed #1abc9c;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .ticket-header {
            background-color: #2c3e50;
            color: white;
            padding: 1rem;
            border-radius: 10px 10px 0 0;
            text-align: center;
        }

        .ticket-body {
            padding: 2rem;
            background-color: white;
            border-radius: 0 0 10px 10px;
        }

        .ticket-body h3 {
            color: #1abc9c;
            margin-bottom: 1.5rem;
        }

        .ticket-details {
            display: flex;
            justify-content: space-between;
            flex-wrap: wrap;
            gap: 1rem;
        }

        .ticket-details div {
            flex: 1;
            min-width: 200px;
        }

        .ticket-details p {
            margin: 0.5rem 0;
        }

        .qr-code {
            text-align: center;
            margin-top: 1.5rem;
        }

        .qr-code img {
            width: 150px;
            height: 150px;
            animation: pulse 2s infinite;
        }

        @keyframes pulse {
            0% { transform: scale(1); }
            50% { transform: scale(1.05); }
            100% { transform: scale(1); }
        }

        .btn-print {
            background-color: #1abc9c;
            border-color: #1abc9c;
            transition: all 0.3s ease;
        }

        .btn-print:hover {
            background-color: #16a085;
            transform: scale(1.05);
        }

        @media print {
            .navbar, .btn-print, footer { display: none; }
            .ticket-container { box-shadow: none; border: none; }
        }
    </style>
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
                    <li class="nav-item"><a class="nav-link" href="about.jsp">About Us</a></li>
                    <li class="nav-item"><a class="nav-link" href="contact.jsp">Contact</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Ticket Section -->
    <div class="container mt-5 mb-5">
        <div class="ticket-container">
            <div class="ticket-header">
                <h2>Bus Booking Ticket</h2>
            </div>
            <div class="ticket-body">
                <h3>Booking Confirmed!</h3>
                <div class="ticket-details">
                    <div>
                        <p><strong>Booking ID:</strong> <%= request.getParameter("bookingId") != null ? request.getParameter("bookingId") : "12345" %></p>
                        <p><strong>Passenger:</strong> <%= request.getParameter("userName") != null ? request.getParameter("userName") : "John Doe" %></p>
                        <p><strong>Route:</strong> <%= request.getParameter("route") != null ? request.getParameter("route") : "City A to City B" %></p>
                    </div>
                    <div>
                        <p><strong>Date:</strong> <%= request.getParameter("date") != null ? request.getParameter("date") : "2025-03-20" %></p>
                        <p><strong>Seat:</strong> <%= request.getParameter("seat") != null ? request.getParameter("seat") : "5" %></p>
                        <p><strong>Total:</strong> $<%= request.getParameter("total") != null ? request.getParameter("total") : "20" %></p>
                    </div>
                </div>
                <div class="qr-code">
                    <!-- Placeholder QR code (replace with actual QR code generation in backend) -->
                    <img src="https://via.placeholder.com/150x150?text=QR+Code" alt="QR Code">
                    <p>Scan to verify your ticket</p>
                </div>
                <div class="text-center mt-4">
                    <button class="btn btn-print" onclick="window.print()">Print Ticket</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer>
        <p>© 2025 Bus Booking. All rights reserved.</p>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>