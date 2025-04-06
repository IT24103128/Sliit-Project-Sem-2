package com.example.demo.models;

public class Review {
    private int id;
    private int userId;
    private int tutorId;
    private String comment;
    private int rating;
    private String date;

    public Review(int id, int userId, String comment, int tutorId, int rating, String date) {
        this.id = id;
        this.userId = userId;
        this.comment = comment;
        this.tutorId = tutorId;
        this.rating = rating;
        this.date = date;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
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

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public void displayDetails() {
        System.out.println("ID: " + id);
        System.out.println("User ID: " + userId);
        System.out.println("Tutor ID: " + tutorId);
        System.out.println("Comment: " + comment);
        System.out.println("Rating: " + rating);
        System.out.println("Date: " + date);
    }

    @Override
    public String toString() {
        return id + "," + userId + tutorId + "," + comment + "," + rating + "," + date + "\n" ;
    }
}
