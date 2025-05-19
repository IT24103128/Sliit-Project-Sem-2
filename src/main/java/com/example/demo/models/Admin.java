package com.example.demo.models;

public class Admin {
    private int ID;
    private String email;
    private String password;
    private String name;
    private String contactNo;

    public Admin(int ID, String email, String password, String name, String contactNo) {
        this.ID = ID;
        this.email = email;
        this.password = password;
        this.name = name;
        this.contactNo = contactNo;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getContactNo() {
        return contactNo;
    }

    public void setContactNo(String contactNo) {
        this.contactNo = contactNo;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void displayDetails() {
        System.out.println("ID: " + ID);
        System.out.println("Email: " + email);
        System.out.println("Password: " + password);
        System.out.println("Name: " + name);
        System.out.println("Contact No: " + contactNo);
    }

    public String toString(){
        return ID + "," + email + "," + password + "," + name + "," + contactNo + "\n";
    }
}
