<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.busbooking.dao.UserDAO, com.busbooking.model.User" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login - Bus Booking</title>
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
                    <h2 class="text-center mb-4">Login</h2>
                    <form action="login.jsp" method="post">
                        <div class="mb-3">
                            <input type="email" class="form-control" name="email" placeholder="Email" required>
                        </div>
                        <div class="mb-3">
                            <input type="password" class="form-control" name="password" placeholder="Password" required>
                        </div>
                        <button type="submit" class="btn btn-primary w-100">Login</button>
                    </form>
                    <p class="text-center mt-3">Not registered? <a href="register.jsp">Sign Up</a></p>
                    <%
                        if ("POST".equalsIgnoreCase(request.getMethod())) {
                            try {
                                String email = request.getParameter("email");
                                String password = request.getParameter("password");
                                UserDAO userDAO = new UserDAO();
                                User user = userDAO.loginUser(email, password);
                                if (user != null) {
                                    session.setAttribute("user", user);
                                    if ("admin".equals(user.getRole())) {
                                        response.sendRedirect("admin.jsp");
                                    } else {
                                        response.sendRedirect("search.jsp");
                                    }
                                } else {
                                    out.println("<p class='text-danger mt-3'>Invalid email or password.</p>");
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