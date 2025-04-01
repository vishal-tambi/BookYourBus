<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.busbooking.dao.RouteDAO, com.busbooking.model.Route" %>
<!DOCTYPE html>
<html>
<head>
    <title>Select Seats - Bus Booking</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
    <style>
        .seat-layout {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            background: url('https://via.placeholder.com/600x300?text=Bus+Layout') no-repeat center/cover;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            position: relative;
            animation: fadeIn 1s ease-in;
        }
        @keyframes fadeIn {
            from { opacity: 0; transform: scale(0.9); }
            to { opacity: 1; transform: scale(1); }
        }
        .seat-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 10px;
            padding: 20px;
            justify-content: center;
        }
        .seat {
            width: 50px;
            height: 50px;
            background-color: #ecf0f1;
            border-radius: 5px;
            text-align: center;
            line-height: 50px;
            cursor: pointer;
            transition: all 0.3s ease;
            border: 2px solid transparent;
        }
        .seat:hover {
            background-color: #1abc9c;
            color: white;
            transform: scale(1.1);
        }
        .seat.selected {
            background-color: #1abc9c;
            color: white;
            border-color: #16a085;
            animation: pulse 0.5s ease;
        }
        @keyframes pulse {
            0% { transform: scale(1); }
            50% { transform: scale(1.2); }
            100% { transform: scale(1); }
        }
        .seat.unavailable {
            background-color: #95a5a6;
            cursor: not-allowed;
            opacity: 0.6;
        }
        .selected-seats {
            margin-top: 20px;
            color: #2c3e50;
            font-weight: bold;
        }
        .bus-info {
            text-align: center;
            margin-bottom: 20px;
            color: #2c3e50;
            animation: slideIn 1s ease-out;
        }
        @keyframes slideIn {
            from { transform: translateX(-20px); opacity: 0; }
            to { transform: translateX(0); opacity: 1; }
        }
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
                    <h2 class="text-center mb-4">Select Your Seat</h2>
                    <%
                        String routeIdStr = request.getParameter("routeId");
                        if (routeIdStr == null) {
                            out.println("<p class='text-danger'>No route selected. Please go back to search.</p>");
                        } else {
                            try {
                                int routeId = Integer.parseInt(routeIdStr);
                                RouteDAO routeDAO = new RouteDAO();
                                Route route = routeDAO.getRouteById(routeId);
                                if (route == null) {
                                    out.println("<p class='text-danger'>Route not found.</p>");
                                } else {
                    %>
                    <div class="bus-info">
                        <p>Route: <%= route.getSource() %> to <%= route.getDestination() %> | Date: <%= route.getDepartureTime().toLocalDate() %> | Time: <%= route.getDepartureTime().toLocalTime() %></p>
                        <p>Available Seats: <%= route.getAvailableSeats() %></p>
                    </div>
                    <div class="seat-layout">
                        <div class="seat-grid" id="seatGrid">
                            <% 
                                int totalSeats = 10; // Example: Fetch from bus data later
                                for (int i = 1; i <= totalSeats; i++) {
                                    boolean isUnavailable = (i == 3 || i == 7); // Example unavailable seats
                                    String seatClass = isUnavailable ? "seat unavailable" : "seat";
                            %>
                                <div class="<%= seatClass %>" data-seat="<%= i %>" onclick="toggleSeat(this, <%= isUnavailable %>)"><%= i %></div>
                            <% } %>
                        </div>
                        <div class="selected-seats" id="selectedSeats">
                            Selected Seats: None
                        </div>
                    </div>
                    <br>
                    <form action="confirm.jsp" method="post">
                        <input type="hidden" name="routeId" value="<%= routeId %>">
                        <input type="hidden" id="selectedSeat" name="selectedSeat">
                        <button type="submit" class="btn btn-primary w-100 mt-3" id="proceedBtn" disabled>Proceed to Booking</button>
                    </form>
                    <%
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
    <script>
        let selectedSeats = [];
        function toggleSeat(element, isUnavailable) {
            if (isUnavailable) return;
            const seatNumber = parseInt(element.getAttribute('data-seat'));
            const index = selectedSeats.indexOf(seatNumber);
            if (index === -1) {
                if (selectedSeats.length < 1) { // Limit to 1 seat for simplicity
                    element.classList.add('selected');
                    selectedSeats.push(seatNumber);
                } else {
                    alert("You can select only 1 seat for now!");
                }
            } else {
                element.classList.remove('selected');
                selectedSeats.splice(index, 1);
            }
            updateSelectedSeats();
            toggleProceedButton();
        }
        function updateSelectedSeats() {
            const selectedSeatsDiv = document.getElementById('selectedSeats');
            const selectedSeatInput = document.getElementById('selectedSeat');
            if (selectedSeats.length > 0) {
                selectedSeatsDiv.textContent = `Selected Seats: ${selectedSeats.join(', ')}`;
                selectedSeatInput.value = selectedSeats[0]; // Store the first selected seat
            } else {
                selectedSeatsDiv.textContent = 'Selected Seats: None';
                selectedSeatInput.value = '';
            }
        }
        function toggleProceedButton() {
            const proceedBtn = document.getElementById('proceedBtn');
            proceedBtn.disabled = selectedSeats.length === 0;
        }
    </script>
</body>
</html>