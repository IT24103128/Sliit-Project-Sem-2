package com.example.demo.models;

public class Review {
    private int ID;
    private int userID;
    private int tutorID;
    private String comment;
    private int rating;
    private String date;

    public Review(int ID, int userID, int tutorID, String comment, int rating, String date) {
        this.ID = ID;
        this.userID = userID;
        this.tutorID = tutorID;
        this.comment = comment;
        this.rating = rating;
        this.date = date;
    }

    public int getUserID() {
        return userID;
    }

    public int getID() {
        return ID;
    }

    public int getTutorID() {
        return tutorID;
    }

    public String getComment() {
        return comment;
    }


    public int getRating() {
        return rating;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public void displayDetails() {
        System.out.println("ID: " + ID);
        System.out.println("User ID: " + userID);
        System.out.println("Tutor ID: " + tutorID);
        System.out.println("Comment: " + comment);
        System.out.println("Rating: " + rating);
        System.out.println("Date: " + date);
    }

    @Override
    public String toString() {
        return ID + "," + userID + "," + tutorID + "," + comment + "," + rating + "," + date + "\n" ;
    }
}
