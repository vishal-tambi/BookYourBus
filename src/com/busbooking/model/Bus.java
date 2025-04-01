package com.busbooking.model;

public class Bus {
    private int busId;
    private String busName;
    private int totalSeats;
    private String status;

    public Bus() {}

    public Bus(int busId, String busName, int totalSeats, String status) {
        this.busId = busId;
        this.busName = busName;
        this.totalSeats = totalSeats;
        this.status = status;
    }

    public int getBusId() { return busId; }
    public void setBusId(int busId) { this.busId = busId; }
    public String getBusName() { return busName; }
    public void setBusName(String busName) { this.busName = busName; }
    public int getTotalSeats() { return totalSeats; }
    public void setTotalSeats(int totalSeats) { this.totalSeats = totalSeats; }
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
}