package com.example.dissysservlet;

public class Entry {
    private int id;
    private String description;
    private double amount;
    private String date; // Assuming a simple date format, can be changed to Date or LocalDate

    // Constructor
    public Entry(int id, String description, double amount, String date) {
        this.id = id;
        this.description = description;
        this.amount = amount;
        this.date = date;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    // You might want to override the toString method for easier debugging and logging
    @Override
    public String toString() {
        return "Entry{" +
                "id=" + id +
                ", description='" + description + '\'' +
                ", amount=" + amount +
                ", date='" + date + '\'' +
                '}';
    }
}
