<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Select Seats - Bus Booking</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
    <style>
        /* Custom styles for seat selection */
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
                </ul>
            </div>
        </div>
    </nav>

    <!-- Seat Selection Section -->
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card p-4">
                    <h2 class="text-center mb-4">Select Your Seat</h2>
                    <div class="bus-info">
                        <p>Route: City A to City B | Date: 2025-03-20 | Time: 10:00 AM</p>
                        <p>Available Seats: 8/10</p>
                    </div>
                    <div class="seat-layout">
                        <div class="seat-grid" id="seatGrid">
                            <% 
                                int totalSeats = 10;
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
                    <a href="confirm.jsp" class="btn btn-primary w-100 mt-3" id="proceedBtn" disabled>Proceed to Booking</a>
                </div>
            </div>
        </div>
    </div>

    <!-- JavaScript for Seat Selection -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        let selectedSeats = [];

        function toggleSeat(element, isUnavailable) {
            if (isUnavailable) return; // Prevent selection of unavailable seats

            const seatNumber = parseInt(element.getAttribute('data-seat'));
            const index = selectedSeats.indexOf(seatNumber);

            if (index === -1) {
                if (selectedSeats.length < 4) { // Limit to 4 seats
                    element.classList.add('selected');
                    selectedSeats.push(seatNumber);
                } else {
                    alert("You can select a maximum of 4 seats!");
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
            if (selectedSeats.length > 0) {
                selectedSeatsDiv.textContent = `Selected Seats: ${selectedSeats.join(', ')}`;
            } else {
                selectedSeatsDiv.textContent = 'Selected Seats: None';
            }
        }

        function toggleProceedButton() {
            const proceedBtn = document.getElementById('proceedBtn');
            proceedBtn.disabled = selectedSeats.length === 0;
        }
    </script>
</body>
</html>