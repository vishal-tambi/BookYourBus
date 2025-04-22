<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.busbooking.dao.RouteDAO, com.busbooking.model.Route, java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <title>Search Routes - Bus Booking</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
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
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card p-4">
                    <h2 class="text-center mb-4">Search Bus Routes</h2>
                    <form action="search.jsp" method="post">
                        <div class="mb-3">
                            <input type="text" class="form-control" name="source" placeholder="Source" required>
                        </div>
                        <div class="mb-3">
                            <input type="text" class="form-control" name="destination" placeholder="Destination" required>
                        </div>
                        <div class="mb-3">
                            <input type="date" class="form-control" name="travel_date" required>
                        </div>
                        <button type="submit" class="btn btn-primary w-100">Search</button>
                    </form>
                    <%
                        if ("POST".equalsIgnoreCase(request.getMethod())) {
                            try {
                                String source = request.getParameter("source");
                                String destination = request.getParameter("destination");
                                String date = request.getParameter("travel_date");
                                RouteDAO routeDAO = new RouteDAO();
                                List<Route> routes = routeDAO.searchRoutes(source, destination, date);
                                if (routes.isEmpty()) {
                                    out.println("<p class='text-danger mt-3'>No routes found.</p>");
                                } else {
                                    out.println("<h3 class='mt-4'>Available Routes</h3>");
                                    for (Route route : routes) {
                                        out.println("<p class='mt-3'>" + route.getSource() + " to " + route.getDestination() +
                                                    " - " + route.getDepartureTime() + " - $" + route.getPrice() +
                                                    " <a href='seats.jsp?routeId=" + route.getRouteId() + "' class='btn btn-success btn-sm'>Select Seats</a></p>");
                                    }
                                }
                            } catch (Exception e) {
                                out.println("<p class='text-danger mt-3'>Error: " + e.getMessage() + "</p>");
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