<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.busbooking.dao.BookingDAO, com.busbooking.model.Booking, com.busbooking.model.User, java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard - Bus Booking</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
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
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card p-4">
                    <h2 class="text-center mb-4">Admin Dashboard</h2>
                    <%
                        User user = (User) session.getAttribute("user");
                        if (user == null || !"admin".equals(user.getRole())) {
                            response.sendRedirect("login.jsp");
                        } else {
                            try {
                                BookingDAO bookingDAO = new BookingDAO();
                                List<Booking> bookings = bookingDAO.getUserBookings(user.getUserId());
                    %>
                    <div class="mb-4">
                        <h3>View Bookings</h3>
                        <%
                            if (bookings.isEmpty()) {
                                out.println("<p>No bookings found.</p>");
                            } else {
                                for (Booking booking : bookings) {
                                    out.println("<p>Booking ID: " + booking.getBookingId() + " - Route ID: " + booking.getRouteId() +
                                                " - Seat: " + booking.getSeatNumber() + " - Status: " + booking.getStatus() + "</p>");
                                }
                            }
                        %>
                    </div>
                    <%
                            } catch (Exception e) {
                                out.println("<p class='text-danger'>Error: " + e.getMessage() + "</p>");
                            }
                        }
                    %>
                </div>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>