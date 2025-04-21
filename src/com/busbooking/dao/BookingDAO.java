package com.busbooking.dao;

import com.busbooking.model.Booking;
import com.busbooking.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class BookingDAO {
    public void createBooking(Booking booking) throws SQLException {
        String sql = "INSERT INTO Bookings (user_id, route_id, seat_number, booking_date, status) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, booking.getUserId());
            stmt.setInt(2, booking.getRouteId());
            stmt.setInt(3, booking.getSeatNumber());
            stmt.setTimestamp(4, java.sql.Timestamp.valueOf(booking.getBookingDate()));
            stmt.setString(5, booking.getStatus());
            stmt.executeUpdate();

            String updateSql = "UPDATE Routes SET available_seats = available_seats - 1 WHERE route_id = ?";
            try (PreparedStatement updateStmt = conn.prepareStatement(updateSql)) {
                updateStmt.setInt(1, booking.getRouteId());
                updateStmt.executeUpdate();
            }
        }
    }

    public List<Booking> getUserBookings(int userId) throws SQLException {
        String sql = "SELECT * FROM Bookings WHERE user_id = ?";
        List<Booking> bookings = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                bookings.add(new Booking(
                    rs.getInt("booking_id"),
                    rs.getInt("user_id"),
                    rs.getInt("route_id"),
                    rs.getInt("seat_number"),
                    rs.getTimestamp("booking_date").toLocalDateTime(),
                    rs.getString("status")
                ));
            }
        }
        return bookings;
    }

    public List<Booking> getAllBookings() throws SQLException {
        String sql = "SELECT * FROM Bookings";
        List<Booking> bookings = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                bookings.add(new Booking(
                    rs.getInt("booking_id"),
                    rs.getInt("user_id"),
                    rs.getInt("route_id"),
                    rs.getInt("seat_number"),
                    rs.getTimestamp("booking_date").toLocalDateTime(),
                    rs.getString("status")
                ));
            }
        }
        return bookings;
    }

    public void updateBookingStatus(int bookingId, String status) throws SQLException {
        String sql = "UPDATE Bookings SET status = ? WHERE booking_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, status);
            stmt.setInt(2, bookingId);
            stmt.executeUpdate();
        }
    }

    public void deleteBooking(int bookingId) throws SQLException {
        String sql = "DELETE FROM Bookings WHERE booking_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, bookingId);
            stmt.executeUpdate();
        }
    }
}