package com.example.demo.models;

public class Payment {
    private int id;
    private int tutorId;
    private int userId;
    private String date;
    private double amount;

    public Payment(int id, int userId, int tutorId, String date, double amount) {
        this.id = id;
        this.userId = userId;
        this.date = date;
        this.amount = amount;
    }

    public int getID() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getTutorId() {
        return tutorId;
    }

    public void setTutorId(int tutorId) {
        this.tutorId = tutorId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public void displayDetails() {
        System.out.println("ID: " + id);
        System.out.println("Tutor ID: " + tutorId);
        System.out.println("User ID: " + userId);
        System.out.println("Date: " + date);
        System.out.println("Amount: " + amount);
    }

    @Override
    public String toString() {
        return id + "," + userId + "," + tutorId + "," + date + "," + amount + "\n";
    }
}
