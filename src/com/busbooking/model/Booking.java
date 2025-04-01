package com.busbooking.model;

import java.time.LocalDateTime;

public class Booking {
    private int bookingId;
    private int userId;
    private int routeId;
    private int seatNumber;
    private LocalDateTime bookingDate;
    private String status;

    // Constructors
    public Booking() {}

    public Booking(int bookingId, int userId, int routeId, int seatNumber, LocalDateTime bookingDate, String status) {
        this.bookingId = bookingId;
        this.userId = userId;
        this.routeId = routeId;
        this.seatNumber = seatNumber;
        this.bookingDate = bookingDate;
        this.status = status;
    }

    // Getters and Setters
    public int getBookingId() { return bookingId; }
    public void setBookingId(int bookingId) { this.bookingId = bookingId; }
    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }
    public int getRouteId() { return routeId; }
    public void setRouteId(int routeId) { this.routeId = routeId; }
    public int getSeatNumber() { return seatNumber; }
    public void setSeatNumber(int seatNumber) { this.seatNumber = seatNumber; }
    public LocalDateTime getBookingDate() { return bookingDate; }
    public void setBookingDate(LocalDateTime bookingDate) { this.bookingDate = bookingDate; }
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
}