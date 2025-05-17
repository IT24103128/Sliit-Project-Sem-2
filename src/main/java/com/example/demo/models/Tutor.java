package com.example.demo.models;

public class Tutor extends User {
    private String subject;
    private int subjectExpertise;
    private double costPerHour;

    public Tutor(int ID, String email, String name, String contactNo, int age,
                 String gender, String subject, int subjectExpertise, double costPerHour) {
        super(ID, email, "", name, contactNo, age, gender);
        this.subject = subject;
        this.subjectExpertise = subjectExpertise;
        this.costPerHour = costPerHour;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public int getSubjectExpertise() {
        return subjectExpertise;
    }

    public void setSubjectExpertise(int subjectExpertise) {
        this.subjectExpertise = subjectExpertise;
    }

    public double getCostPerHour() {
        return costPerHour;
    }

    public void setCostPerHour(double costPerHour) {
        this.costPerHour = costPerHour;
    }

    public double calculateCost(double hours){
        return hours * costPerHour;
    }

    @Override
    public void displayDetails() {
        super.displayDetails();
        System.out.println("Subject: " + subject);
        System.out.println("SubjectExpertise: " + subjectExpertise);
        System.out.println("CostPerHour: " + costPerHour);
    }

    @Override
    public String toString(){
        return ID + "," + email + "," + name + "," + ContactNo + "," + age + "," + gender + "," + subject + "," + subjectExpertise + "," + costPerHour + "\n";
    }
}
