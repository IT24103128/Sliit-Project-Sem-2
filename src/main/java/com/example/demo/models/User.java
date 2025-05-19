package com.example.demo.models;

public class User {
    protected int ID;
    protected String email;
    protected String password;
    protected String name;
    protected String ContactNo;
    protected int age;
    protected String gender;

    public User(int ID, String email, String password, String name, String contactNo, int age, String gender) { 
        this.ID = ID;
        this.email = email;
        this.password = password;
        this.name = name;
        this.ContactNo = contactNo;
        this.age = age;
        this.gender = gender;
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

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getContactNo() {
        return ContactNo;
    }

    public void setContactNo(String contactNo) {
        ContactNo = contactNo;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public void displayDetails() {
        System.out.println("ID: " + ID);
        System.out.println("Email: " + email);
        System.out.println("Password: " + password);
        System.out.println("Name: " + name);
        System.out.println("ContactNo: " + ContactNo);
        System.out.println("Age: " + age);
        System.out.println("Gender: " + gender);
    }

    
    @Override
    public String toString() {
        return ID + "," +  email + "," + password + "," + name + "," + ContactNo + "," + age + "," + gender + "\n";
    }
}
