package com.example.demo.services;

import com.example.demo.models.Admin;
import com.example.demo.utils.FileHandler;

import java.util.ArrayList;

public class AdminManager {
    private static ArrayList<Admin> admins = null;
    private static  String fileName = "admins.txt";
    private static int ID = 0;

    public static void readAdmins() {
        if (admins != null)
            return;

        admins = new ArrayList<>();

        admins.add(new Admin(0, "admin@gmail.com", "123", "Admin", "0700000000"));

        String[] adminsDataArr = FileHandler.readFromFile(fileName);
        int adminID = 0;

        for (String adminData : adminsDataArr) {
            String[] adminDataArr = adminData.split(",");
            adminID = Integer.parseInt(adminDataArr[0]);
            String email = adminDataArr[1];
            String password = adminDataArr[2];
            String name = adminDataArr[3];
            String contactNo = adminDataArr[4];


            Admin admin = new Admin(adminID, email, password, name, contactNo);
            admins.add(admin);
        }

        ID = adminID;
    }

    public static Admin findAdmin(int id) {
        for (Admin admin : admins) {
            if (admin.getID() == id) {
                return admin;
            }
        }
        return null;
    }

    public static void addAdmin(int id, String email, String password, String name,
                                String contactNo) {
        Admin admin = new Admin(id, email, password, name, contactNo);
        admins.add(admin);
        FileHandler.writeToFile(fileName, true, admin.toString());
    }

    public static void removeAdmin(int id) {
        admins.remove(findAdmin(id));
        saveAdminsToFile();
    }

    public static void saveAdminsToFile() {
        String adminDetails = "";
        for (Admin admin : admins) {
            if (admin.getID() != 0) adminDetails += admin.toString();
        }
        FileHandler.writeToFile(fileName, false, adminDetails);
    }

    public static int getNextID() {
        return ++ID;
    }

    public static ArrayList<Admin> getAdmins() {
        return admins;
    }
}