package com.busbooking.dao;

import com.busbooking.model.Bus;
import com.busbooking.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BusDAO {
    public List<Bus> getAllBuses() throws SQLException {
        String sql = "SELECT * FROM Buses";
        List<Bus> buses = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                buses.add(new Bus(
                    rs.getInt("bus_id"),
                    rs.getString("bus_name"),
                    rs.getInt("total_seats"),
                    rs.getString("status")
                ));
            }
        }
        return buses;
    }

    public void addBus(Bus bus) throws SQLException {
        String sql = "INSERT INTO Buses (bus_name, total_seats, status) VALUES (?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, bus.getBusName());
            stmt.setInt(2, bus.getTotalSeats());
            stmt.setString(3, bus.getStatus());
            stmt.executeUpdate();
        }
    }

    public void updateBus(Bus bus) throws SQLException {
        String sql = "UPDATE Buses SET bus_name = ?, total_seats = ?, status = ? WHERE bus_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, bus.getBusName());
            stmt.setInt(2, bus.getTotalSeats());
            stmt.setString(3, bus.getStatus());
            stmt.setInt(4, bus.getBusId());
            stmt.executeUpdate();
        }
    }

    public void deleteBus(int busId) throws SQLException {
        String sql = "DELETE FROM Buses WHERE bus_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, busId);
            stmt.executeUpdate();
        }
    }
}