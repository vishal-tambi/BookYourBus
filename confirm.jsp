<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.busbooking.dao.BookingDAO, com.busbooking.dao.RouteDAO, com.busbooking.model.Booking, com.busbooking.model.User, com.busbooking.model.Route, java.time.LocalDateTime" %>
<!DOCTYPE html>
<html>
<head>
    <title>Confirm Booking - Bus Booking</title>
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
            <div class="col-md-6">
                <div class="card p-4">
                    <h2 class="text-center mb-4">Confirm Your Booking</h2>
                    <%
                        String routeIdStr = request.getParameter("routeId");
                        String selectedSeat = request.getParameter("selectedSeat");
                        User user = (User) session.getAttribute("user");
                        if (user == null || routeIdStr == null || selectedSeat == null) {
                            out.println("<p class='text-danger'>Please login and select a seat.</p>");
                        } else {
                            try {
                                int routeId = Integer.parseInt(routeIdStr);
                                int seatNumber = Integer.parseInt(selectedSeat);
                                RouteDAO routeDAO = new RouteDAO();
                                Route route = routeDAO.getRouteById(routeId);
                                if (route == null) {
                                    out.println("<p class='text-danger'>Route not found.</p>");
                                } else {
                    %>
                    <p class="mb-2">Route: <%= route.getSource() %> to <%= route.getDestination() %></p>
                    <p class="mb-2">Date: <%= route.getDepartureTime().toLocalDate() %></p>
                    <p class="mb-2">Seat: <%= seatNumber %></p>
                    <p class="mb-4">Total: $<%= route.getPrice() %></p>
                    <form action="ticket.jsp" method="get">
                        <input type="hidden" name="route" value="<%= route.getSource() %> to <%= route.getDestination() %>">
                        <input type="hidden" name="date" value="<%= route.getDepartureTime().toLocalDate() %>">
                        <input type="hidden" name="seat" value="<%= seatNumber %>">
                        <input type="hidden" name="total" value="<%= route.getPrice() %>">
                        <input type="hidden" name="userName" value="<%= user.getName() %>">
                        <input type="hidden" name="bookingId" id="bookingId">
                        <button type="submit" class="btn btn-primary w-100">Confirm Booking</button>
                    </form>
                    <%
                                    if ("POST".equalsIgnoreCase(request.getMethod())) {
                                        Booking booking = new Booking(0, user.getUserId(), routeId, seatNumber, LocalDateTime.now(), "confirmed");
                                        BookingDAO bookingDAO = new BookingDAO();
                                        bookingDAO.createBooking(booking);
                                        // Fetch the last inserted booking ID (simplified for now)
                                        String bookingId = "12345"; // Replace with actual logic to fetch booking ID
                    %>
                    <script>
                        document.getElementById('bookingId').value = '<%= bookingId %>';
                        document.forms[0].submit();
                    </script>
                    <%
                                    }
                                }
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