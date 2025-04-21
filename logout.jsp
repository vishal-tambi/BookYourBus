<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Invalidate the session
    session.invalidate();
    // Redirect to index.jsp
    response.sendRedirect("index.jsp");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Logout - Bus Booking</title>
</head>
<body>
    <!-- No content needed; redirect happens immediately -->
</body>
</html>