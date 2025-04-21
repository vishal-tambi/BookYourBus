package com.busbooking.dao;

import com.busbooking.model.Route;
import com.busbooking.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class RouteDAO {
    public List<Route> getAllRoutes() throws SQLException {
        String sql = "SELECT * FROM Routes";
        List<Route> routes = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                routes.add(new Route(
                    rs.getInt("route_id"),
                    rs.getString("source"),
                    rs.getString("destination"),
                    rs.getInt("bus_id"),
                    rs.getTimestamp("departure_time").toLocalDateTime(),
                    rs.getTimestamp("arrival_time").toLocalDateTime(),
                    rs.getDouble("price"),
                    rs.getInt("available_seats")
                ));
            }
        }
        return routes;
    }

    public void addRoute(Route route) throws SQLException {
        String sql = "INSERT INTO Routes (source, destination, bus_id, departure_time, arrival_time, price, available_seats) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, route.getSource());
            stmt.setString(2, route.getDestination());
            stmt.setInt(3, route.getBusId());
            stmt.setTimestamp(4, java.sql.Timestamp.valueOf(route.getDepartureTime()));
            stmt.setTimestamp(5, java.sql.Timestamp.valueOf(route.getArrivalTime()));
            stmt.setDouble(6, route.getPrice());
            stmt.setInt(7, route.getAvailableSeats());
            stmt.executeUpdate();
        }
    }

    public void updateRoute(Route route) throws SQLException {
        String sql = "UPDATE Routes SET source = ?, destination = ?, bus_id = ?, departure_time = ?, arrival_time = ?, price = ?, available_seats = ? WHERE route_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, route.getSource());
            stmt.setString(2, route.getDestination());
            stmt.setInt(3, route.getBusId());
            stmt.setTimestamp(4, java.sql.Timestamp.valueOf(route.getDepartureTime()));
            stmt.setTimestamp(5, java.sql.Timestamp.valueOf(route.getArrivalTime()));
            stmt.setDouble(6, route.getPrice());
            stmt.setInt(7, route.getAvailableSeats());
            stmt.setInt(8, route.getRouteId());
            stmt.executeUpdate();
        }
    }

    public void deleteRoute(int routeId) throws SQLException {
        String sql = "DELETE FROM Routes WHERE route_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, routeId);
            stmt.executeUpdate();
        }
    }
}