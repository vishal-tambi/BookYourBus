# Bus Booking System 🚍

![Bus Booking Banner](https://via.placeholder.com/1200x400.png?text=Bus+Booking+System)  
*A modern, user-friendly web application for booking bus tickets online.*

---

## 📝 Overview

The **Bus Booking System** is a web-based application designed to simplify the process of booking bus tickets. It allows users to search for bus routes, select seats, confirm bookings, and generate digital tickets. The application also includes an admin panel for managing buses, routes, and bookings. With a sleek, modern UI and smooth animations, it provides an engaging experience for users.

This project was developed as a full-stack web application, integrating a JSP-based frontend with a Java backend using JDBC for database connectivity.

---

## ✨ Features

### User Features
- **User Registration & Login**: Secure user authentication with password hashing using BCrypt.
- **Route Search**: Search for available bus routes by specifying source, destination, and travel date.
- **Seat Selection**: Interactive seat selection with real-time availability and visual feedback.
- **Booking Confirmation**: Review and confirm bookings with a detailed summary.
- **Digital Ticket Generation**: Generate a printable ticket with booking details and a QR code placeholder.
- **Responsive Design**: Fully responsive UI that works on desktops, tablets, and mobile devices.
- **Animations**: Smooth animations (fade-in, slide-in, pulse) for an engaging user experience.
- **About & Contact Pages**: Learn about the platform and contact support.

### Admin Features
- **Admin Dashboard**: Manage buses, routes, and bookings (view, update, delete).
- **Role-Based Access**: Separate access for admin users to manage the system.

### Technical Features
- **Database Integration**: MySQL database to store users, buses, routes, and bookings.
- **Session Management**: Secure session handling for user authentication.
- **Error Handling**: Graceful error handling with user-friendly messages.
- **Security**: Password hashing, SQL injection prevention using Prepared Statements.

---

## 🛠️ Tech Stack

### Frontend
- **JSP (JavaServer Pages)**: For dynamic web pages.
- **Bootstrap 5**: For responsive design and styling.
- **CSS**: Custom styles with animations (fade-in, slide-in, pulse).
- **JavaScript**: Client-side interactivity (e.g., seat selection).
- **Font Awesome**: For icons in the UI.

### Backend
- **Java**: Core backend logic using the DAO (Data Access Object) pattern.
- **JDBC**: For database connectivity with MySQL.
- **BCrypt**: For secure password hashing (`jbcrypt-0.4.jar`).
- **Tomcat 9.2.0**: Application server to host the web app.

### Database
- **MySQL**: Relational database to store application data.

---

## 📂 Project Structure

---

## 🚀 Setup Instructions

### Prerequisites
- **Java 11+**: Ensure JDK is installed.
- **Apache Tomcat 9.2.0**: Application server to host the web app.
- **MySQL**: Database server (e.g., via XAMPP or standalone MySQL).
- **Git**: To clone the repository.

### Steps

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/your-username/busBooking.git
   cd busBooking


🤝 Contributing
Contributions are welcome! Please follow these steps:

Fork the repository.
Create a new branch (git checkout -b feature/your-feature).
Commit your changes (git commit -m "Add your feature").
Push to the branch (git push origin feature/your-feature).
Open a Pull Request.
📜 License
This project is licensed under the MIT License - see the  file for details.

📧 Contact
For any inquiries, reach out to:

Email: support@busbooking.com
GitHub: your-username
Happy Booking! 🚍
