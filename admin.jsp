<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.busbooking.dao.BookingDAO, com.busbooking.dao.RouteDAO, com.busbooking.dao.BusDAO, com.busbooking.model.Booking, com.busbooking.model.Route, com.busbooking.model.Bus, com.busbooking.model.User, java.util.List, java.time.LocalDateTime" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard - Bus Booking</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
    <style>
        .admin-section { margin-bottom: 2rem; }
        .form-group { margin-bottom: 1rem; }
        .table { margin-top: 1rem; }
        .btn-spacing { margin-right: 0.5rem; }
    </style>
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
                    <%
                        com.busbooking.model.User user = (com.busbooking.model.User) session.getAttribute("user");
                        if (user == null) {
                    %>
                        <li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
                        <li class="nav-item"><a class="nav-link" href="register.jsp">Register</a></li>
                    <% } else { %>
                        <li class="nav-item"><a class="nav-link" href="search.jsp">Search</a></li>
                        <li class="nav-item"><a class="nav-link" href="admin.jsp" <%= "admin".equals(user.getRole()) ? "" : "style='display:none;'" %>>Admin</a></li>
                        <li class="nav-item">
                            <form action="logout.jsp" method="post" style="display:inline;">
                                <button type="submit" class="nav-link btn btn-link text-white" style="padding:0; border:none; background:none; cursor:pointer;">Logout</button>
                            </form>
                        </li>
                    <% } %>
                    <li class="nav-item"><a class="nav-link" href="about.jsp">About Us</a></li>
                    <li class="nav-item"><a class="nav-link" href="contact.jsp">Contact</a></li>
                </ul>
            </div>
        </div>
    </nav>
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-10">
                <div class="card p-4">
                    <h2 class="text-center mb-4">Admin Dashboard</h2>
                    <%
                        if (user == null || !"admin".equals(user.getRole())) {
                            response.sendRedirect("login.jsp");
                            return;
                        }

                        BookingDAO bookingDAO = new BookingDAO();
                        RouteDAO routeDAO = new RouteDAO();
                        BusDAO busDAO = new BusDAO();
                        String action = request.getParameter("action");
                        String errorMessage = null;

                        // Handle form submissions before rendering
                        if (action != null) {
                            try {
                                if ("updateBooking".equals(action)) {
                                    int bookingId = Integer.parseInt(request.getParameter("bookingId"));
                                    String status = request.getParameter("status");
                                    bookingDAO.updateBookingStatus(bookingId, status);
                                    response.sendRedirect("admin.jsp");
                                    return;
                                } else if ("deleteBooking".equals(action)) {
                                    int bookingId = Integer.parseInt(request.getParameter("bookingId"));
                                    bookingDAO.deleteBooking(bookingId);
                                    response.sendRedirect("admin.jsp");
                                    return;
                                } else if ("addRoute".equals(action)) {
                                    Route route = new Route(0,
                                        request.getParameter("source"),
                                        request.getParameter("destination"),
                                        Integer.parseInt(request.getParameter("busId")),
                                        LocalDateTime.parse(request.getParameter("departureTime")),
                                        LocalDateTime.parse(request.getParameter("arrivalTime")),
                                        Double.parseDouble(request.getParameter("price")),
                                        Integer.parseInt(request.getParameter("availableSeats"))
                                    );
                                    routeDAO.addRoute(route);
                                    response.sendRedirect("admin.jsp");
                                    return;
                                } else if ("updateRoute".equals(action)) {
                                    int routeId = Integer.parseInt(request.getParameter("routeId"));
                                    Route route = new Route(
                                        routeId,
                                        request.getParameter("source"),
                                        request.getParameter("destination"),
                                        Integer.parseInt(request.getParameter("busId")),
                                        LocalDateTime.parse(request.getParameter("departureTime")),
                                        LocalDateTime.parse(request.getParameter("arrivalTime")),
                                        Double.parseDouble(request.getParameter("price")),
                                        Integer.parseInt(request.getParameter("availableSeats"))
                                    );
                                    routeDAO.updateRoute(route);
                                    response.sendRedirect("admin.jsp");
                                    return;
                                } else if ("deleteRoute".equals(action)) {
                                    int routeId = Integer.parseInt(request.getParameter("routeId"));
                                    routeDAO.deleteRoute(routeId);
                                    response.sendRedirect("admin.jsp");
                                    return;
                                } else if ("addBus".equals(action)) {
                                    Bus bus = new Bus(0,
                                        request.getParameter("busName"),
                                        Integer.parseInt(request.getParameter("totalSeats")),
                                        request.getParameter("status")
                                    );
                                    busDAO.addBus(bus);
                                    response.sendRedirect("admin.jsp");
                                    return;
                                } else if ("updateBus".equals(action)) {
                                    int busId = Integer.parseInt(request.getParameter("busId"));
                                    Bus bus = new Bus(
                                        busId,
                                        request.getParameter("busName"),
                                        Integer.parseInt(request.getParameter("totalSeats")),
                                        request.getParameter("status")
                                    );
                                    busDAO.updateBus(bus);
                                    response.sendRedirect("admin.jsp");
                                    return;
                                } else if ("deleteBus".equals(action)) {
                                    int busId = Integer.parseInt(request.getParameter("busId"));
                                    busDAO.deleteBus(busId);
                                    response.sendRedirect("admin.jsp");
                                    return;
                                }
                            } catch (Exception e) {
                                errorMessage = "Error: " + e.getMessage();
                            }
                        }
                    %>

                    <!-- Display error message if any -->
                    <% if (errorMessage != null) { %>
                        <p class="text-danger"><%= errorMessage %></p>
                    <% } %>

                    <!-- Bookings Section -->
                    <div class="admin-section">
                        <h3>Manage Bookings</h3>
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>Booking ID</th>
                                    <th>User ID</th>
                                    <th>Route ID</th>
                                    <th>Seat</th>
                                    <th>Status</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    try {
                                        List<Booking> bookings = bookingDAO.getAllBookings();
                                        if (bookings.isEmpty()) {
                                            out.println("<tr><td colspan='6'>No bookings found.</td></tr>");
                                        } else {
                                            for (Booking booking : bookings) {
                                                out.println("<tr>");
                                                out.println("<td>" + booking.getBookingId() + "</td>");
                                                out.println("<td>" + booking.getUserId() + "</td>");
                                                out.println("<td>" + booking.getRouteId() + "</td>");
                                                out.println("<td>" + booking.getSeatNumber() + "</td>");
                                                out.println("<td>" + booking.getStatus() + "</td>");
                                                out.println("<td>");
                                                out.println("<form action='admin.jsp' method='post' style='display:inline;'>");
                                                out.println("<input type='hidden' name='bookingId' value='" + booking.getBookingId() + "'>");
                                                out.println("<select name='status' class='form-control d-inline w-auto'>");
                                                out.println("<option value='confirmed' " + ("confirmed".equals(booking.getStatus()) ? "selected" : "") + ">Confirmed</option>");
                                                out.println("<option value='cancelled' " + ("cancelled".equals(booking.getStatus()) ? "selected" : "") + ">Cancelled</option>");
                                                out.println("</select>");
                                                out.println("<button type='submit' name='action' value='updateBooking' class='btn btn-primary btn-spacing'>Update</button>");
                                                out.println("<button type='submit' name='action' value='deleteBooking' class='btn btn-danger' onclick='return confirm(\"Are you sure?\");'>Delete</button>");
                                                out.println("</form>");
                                                out.println("</td>");
                                                out.println("</tr>");
                                            }
                                        }
                                    } catch (Exception e) {
                                        out.println("<p class='text-danger'>Error: " + e.getMessage() + "</p>");
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>

                    <!-- Routes Section -->
                    <div class="admin-section">
                        <h3>Manage Routes</h3>
                        <form action="admin.jsp" method="post" class="mb-3">
                            <div class="form-group">
                                <input type="text" name="source" class="form-control" placeholder="Source" required>
                            </div>
                            <div class="form-group">
                                <input type="text" name="destination" class="form-control" placeholder="Destination" required>
                            </div>
                            <div class="form-group">
                                <input type="number" name="busId" class="form-control" placeholder="Bus ID" required>
                            </div>
                            <div class="form-group">
                                <input type="datetime-local" name="departureTime" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <input type="datetime-local" name="arrivalTime" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <input type="number" step="0.01" name="price" class="form-control" placeholder="Price" required>
                            </div>
                            <div class="form-group">
                                <input type="number" name="availableSeats" class="form-control" placeholder="Available Seats" required>
                            </div>
                            <button type="submit" name="action" value="addRoute" class="btn btn-success">Add Route</button>
                        </form>
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>Route ID</th>
                                    <th>Source</th>
                                    <th>Destination</th>
                                    <th>Bus ID</th>
                                    <th>Departure</th>
                                    <th>Arrival</th>
                                    <th>Price</th>
                                    <th>Seats</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    try {
                                        List<Route> routes = routeDAO.getAllRoutes();
                                        if (routes.isEmpty()) {
                                            out.println("<tr><td colspan='9'>No routes found.</td></tr>");
                                        } else {
                                            for (Route route : routes) {
                                                out.println("<tr>");
                                                out.println("<td>" + route.getRouteId() + "</td>");
                                                out.println("<td>" + route.getSource() + "</td>");
                                                out.println("<td>" + route.getDestination() + "</td>");
                                                out.println("<td>" + route.getBusId() + "</td>");
                                                out.println("<td>" + route.getDepartureTime() + "</td>");
                                                out.println("<td>" + route.getArrivalTime() + "</td>");
                                                out.println("<td>$" + route.getPrice() + "</td>");
                                                out.println("<td>" + route.getAvailableSeats() + "</td>");
                                                out.println("<td>");
                                                out.println("<form action='admin.jsp' method='post' style='display:inline;'>");
                                                out.println("<input type='hidden' name='routeId' value='" + route.getRouteId() + "'>");
                                                out.println("<input type='hidden' name='source' value='" + route.getSource() + "'>");
                                                out.println("<input type='hidden' name='destination' value='" + route.getDestination() + "'>");
                                                out.println("<input type='hidden' name='busId' value='" + route.getBusId() + "'>");
                                                out.println("<input type='hidden' name='departureTime' value='" + route.getDepartureTime() + "'>");
                                                out.println("<input type='hidden' name='arrivalTime' value='" + route.getArrivalTime() + "'>");
                                                out.println("<input type='hidden' name='price' value='" + route.getPrice() + "'>");
                                                out.println("<input type='hidden' name='availableSeats' value='" + route.getAvailableSeats() + "'>");
                                                out.println("<button type='submit' name='action' value='updateRoute' class='btn btn-primary btn-spacing'>Update</button>");
                                                out.println("<button type='submit' name='action' value='deleteRoute' class='btn btn-danger' onclick='return confirm(\"Are you sure?\");'>Delete</button>");
                                                out.println("</form>");
                                                out.println("</td>");
                                                out.println("</tr>");
                                            }
                                        }
                                    } catch (Exception e) {
                                        out.println("<p class='text-danger'>Error: " + e.getMessage() + "</p>");
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>

                    <!-- Buses Section -->
                    <div class="admin-section">
                        <h3>Manage Buses</h3>
                        <form action="admin.jsp" method="post" class="mb-3">
                            <div class="form-group">
                                <input type="text" name="busName" class="form-control" placeholder="Bus Name" required>
                            </div>
                            <div class="form-group">
                                <input type="number" name="totalSeats" class="form-control" placeholder="Total Seats" required>
                            </div>
                            <div class="form-group">
                                <select name="status" class="form-control" required>
                                    <option value="active">Active</option>
                                    <option value="inactive">Inactive</option>
                                </select>
                            </div>
                            <button type="submit" name="action" value="addBus" class="btn btn-success">Add Bus</button>
                        </form>
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>Bus ID</th>
                                    <th>Name</th>
                                    <th>Total Seats</th>
                                    <th>Status</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    try {
                                        List<Bus> buses = busDAO.getAllBuses();
                                        if (buses.isEmpty()) {
                                            out.println("<tr><td colspan='5'>No buses found.</td></tr>");
                                        } else {
                                            for (Bus bus : buses) {
                                                out.println("<tr>");
                                                out.println("<td>" + bus.getBusId() + "</td>");
                                                out.println("<td>" + bus.getBusName() + "</td>");
                                                out.println("<td>" + bus.getTotalSeats() + "</td>");
                                                out.println("<td>" + bus.getStatus() + "</td>");
                                                out.println("<td>");
                                                out.println("<form action='admin.jsp' method='post' style='display:inline;'>");
                                                out.println("<input type='hidden' name='busId' value='" + bus.getBusId() + "'>");
                                                out.println("<input type='hidden' name='busName' value='" + bus.getBusName() + "'>");
                                                out.println("<input type='hidden' name='totalSeats' value='" + bus.getTotalSeats() + "'>");
                                                out.println("<input type='hidden' name='status' value='" + bus.getStatus() + "'>");
                                                out.println("<button type='submit' name='action' value='updateBus' class='btn btn-primary btn-spacing'>Update</button>");
                                                out.println("<button type='submit' name='action' value='deleteBus' class='btn btn-danger' onclick='return confirm(\"Are you sure?\");'>Delete</button>");
                                                out.println("</form>");
                                                out.println("</td>");
                                                out.println("</tr>");
                                            }
                                        }
                                    } catch (Exception e) {
                                        out.println("<p class='text-danger'>Error: " + e.getMessage() + "</p>");
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>