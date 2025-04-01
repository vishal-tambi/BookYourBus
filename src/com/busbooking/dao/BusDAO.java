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
        List<Bus> buses = new ArrayList<>();
        String sql = "SELECT * FROM Buses";
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
}