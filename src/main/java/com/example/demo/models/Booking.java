package com.example.demo.models;

public class Booking {
    private int ID;
    private int userID;
    private int tutorID;
    private double duration;
    private String date;
    private String time;

    public Booking(int ID, int userID, int tutorID, double duration, String date, String time) {
        this.ID = ID;
        this.userID = userID;
        this.duration = duration;
        this.tutorID = tutorID;
        this.date = date;
        this.time = time;
    }

    public int getID() {
        return ID;
    }

    public int getUserID() {
        return userID;
    }

    public int getTutorID() {
        return tutorID;
    }

    public double getDuration() {
        return duration;
    }

    public String getDate() {
        return date;
    }

    public String getTime() {
        return time;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public void setDuration(double duration) {
        this.duration = duration;
    }

    public void displayDetails() {
        System.out.println("ID: " + ID);
        System.out.println("User ID: " + userID);
        System.out.println("Tutor ID: " + tutorID);
        System.out.println("Duration: " + duration);
        System.out.println("Date: " + date);
        System.out.println("Time: " + time);
    }

    @Override
    public String toString() {
        return  ID + "," + userID + "," + tutorID + "," + duration + "," + date + "," + time + "\n";
    }
}
