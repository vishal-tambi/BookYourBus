<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Search Routes - Bus Booking</title>
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
                    <li class="nav-item"><a class="nav-link" href="admin.jsp">Contact Us</a></li>
                    <li class="nav-item"><a class="nav-link" href="admin.jsp">About Us</a></li>
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
                    <%-- Placeholder for search results --%>
                    <%
                        if ("POST".equalsIgnoreCase(request.getMethod())) {
                            String source = request.getParameter("source");
                            String dest = request.getParameter("destination");
                            String date = request.getParameter("travel_date");
                            out.println("<h3 class='mt-4'>Results for " + source + " to " + dest + " on " + date + "</h3>");
                            out.println("<p class='mt-3'>Bus 1 - 10:00 AM - $20 <a href='seats.jsp' class='btn btn-success btn-sm'>Select Seats</a></p>");
                        }
                    %>
                </div>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>