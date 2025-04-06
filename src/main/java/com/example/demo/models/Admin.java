package com.example.demo.models;

public class Admin {
    private int id;
    private String email;
    private String password;
    private String name;
    private String ContactNo;

    public Admin(String password, String email, int id, String name, String contactNo) {
        this.password = password;
        this.email = email;
        this.id = id;
        this.name = name;
        ContactNo = contactNo;
    }

    public int getID() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getContactNo() {
        return ContactNo;
    }

    public void setContactNo(String contactNo) {
        ContactNo = contactNo;
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
        System.out.println("ID: " + id);
        System.out.println("Email: " + email);
        System.out.println("Password: " + password);
        System.out.println("Name: " + name);
        System.out.println("Contact No: " + ContactNo);
    }

    public String toString(){
        return id + "," + email + "," + password + "," + name + "," + ContactNo + "\n";
    }
}
