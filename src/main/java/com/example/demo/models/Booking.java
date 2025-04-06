package com.example.demo.models;

public class Booking {
    private int id;
    private int userId;
    private int tutorId;
    private double hours;
    private String date;
    private String time;

    public Booking(int id, int userId, double hours, int tutorId, String date, String time) {
        this.id = id;
        this.userId = userId;
        this.hours = hours;
        this.tutorId = tutorId;
        this.date = date;
        this.time = time;
    }

    public int getID() {
        return id;
    }

    public int getUserId() {
        return userId;
    }

    public int getTutorId() {
        return tutorId;
    }

    public double getHours() {
        return hours;
    }

    public String getDate() {
        return date;
    }

    public String getTime() {
        return time;
    }

    public void displayDetails() {
        System.out.println("ID: " + id);
        System.out.println("User ID: " + userId);
        System.out.println("Tutor ID: " + tutorId);
        System.out.println("Hours: " + hours);
        System.out.println("Date: " + date);
        System.out.println("Time: " + time);
    }

    @Override
    public String toString() {
        return  id + "," + userId + "," + tutorId + "," + date + "," + time + "\n";
    }
}
