package com.busbooking.model;

import java.time.LocalDateTime;

public class Route {
    private int routeId;
    private String source;
    private String destination;
    private int busId;
    private LocalDateTime departureTime;
    private LocalDateTime arrivalTime;
    private double price;
    private int availableSeats;

    // Constructors
    public Route() {}

    public Route(int routeId, String source, String destination, int busId, LocalDateTime departureTime, 
                 LocalDateTime arrivalTime, double price, int availableSeats) {
        this.routeId = routeId;
        this.source = source;
        this.destination = destination;
        this.busId = busId;
        this.departureTime = departureTime;
        this.arrivalTime = arrivalTime;
        this.price = price;
        this.availableSeats = availableSeats;
    }

    // Getters and Setters
    public int getRouteId() { return routeId; }
    public void setRouteId(int routeId) { this.routeId = routeId; }
    public String getSource() { return source; }
    public void setSource(String source) { this.source = source; }
    public String getDestination() { return destination; }
    public void setDestination(String destination) { this.destination = destination; }
    public int getBusId() { return busId; }
    public void setBusId(int busId) { this.busId = busId; }
    public LocalDateTime getDepartureTime() { return departureTime; }
    public void setDepartureTime(LocalDateTime departureTime) { this.departureTime = departureTime; }
    public LocalDateTime getArrivalTime() { return arrivalTime; }
    public void setArrivalTime(LocalDateTime arrivalTime) { this.arrivalTime = arrivalTime; }
    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }
    public int getAvailableSeats() { return availableSeats; }
    public void setAvailableSeats(int availableSeats) { this.availableSeats = availableSeats; }
}