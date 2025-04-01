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
    public List<Route> searchRoutes(String source, String destination, String date) throws SQLException {
        String sql = "SELECT * FROM Routes WHERE source = ? AND destination = ? AND DATE(departure_time) = ?";
        List<Route> routes = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, source);
            stmt.setString(2, destination);
            stmt.setString(3, date);
            ResultSet rs = stmt.executeQuery();
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

    public Route getRouteById(int routeId) throws SQLException {
        String sql = "SELECT * FROM Routes WHERE route_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, routeId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return new Route(
                    rs.getInt("route_id"),
                    rs.getString("source"),
                    rs.getString("destination"),
                    rs.getInt("bus_id"),
                    rs.getTimestamp("departure_time").toLocalDateTime(),
                    rs.getTimestamp("arrival_time").toLocalDateTime(),
                    rs.getDouble("price"),
                    rs.getInt("available_seats")
                );
            }
            return null;
        }
    }
}