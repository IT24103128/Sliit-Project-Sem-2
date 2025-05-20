package com.example.demo.models;

public class Payment {
    private int ID;
    private int bookingID;
    private int userID;
    private String date;
    private String time;
    private double amount;

    public Payment(int ID, int bookingID, int userID, String date, String time, double amount) {
        this.ID = ID;
        this.bookingID = bookingID;
        this.userID = userID;
        this.date = date;
        this.time = time;
        this.amount = amount;
    }

    public int getID()  {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public int getBookingID() {
        return bookingID;
    }

    public void setBookingID(int bookingID) {
        this.bookingID = bookingID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public void displayDetails() {
        System.out.println("ID: " + ID);
        System.out.println("Booking ID: " + bookingID);
        System.out.println("User ID: " + userID);
        System.out.println("Date: " + date);
        System.out.println("Time: "  +  time);
        System.out.println("Amount: " + amount);
    }

    @Override
    public String toString() {
        return ID + "," + bookingID + "," + userID + "," + date + "," + time + "," + amount + "\n";
    }
}
