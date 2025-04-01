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
            stmt.setObject(4, booking.getBookingDate());
            stmt.setString(5, booking.getStatus());
            stmt.executeUpdate();
        }
    }

    public List<Booking> getUserBookings(int userId) throws SQLException {
        List<Booking> bookings = new ArrayList<>();
        String sql = "SELECT * FROM Bookings WHERE user_id = ?";
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

    public Booking getBookingById(int bookingId) throws SQLException {
        String sql = "SELECT * FROM Bookings WHERE booking_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, bookingId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return new Booking(
                    rs.getInt("booking_id"),
                    rs.getInt("user_id"),
                    rs.getInt("route_id"),
                    rs.getInt("seat_number"),
                    rs.getTimestamp("booking_date").toLocalDateTime(),
                    rs.getString("status")
                );
            }
            return null;
        }
    }
}