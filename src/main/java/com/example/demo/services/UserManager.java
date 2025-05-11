package com.example.demo.services;

import com.example.demo.models.User;
import com.example.demo.utils.FileHandler;

import java.util.ArrayList;

public class UserManager {
    private static ArrayList<User> users = null;
    private static final String fileName = "users.txt";
    private static int ID = 0;

    public static void readUsers() {
        if (users != null)
            return;

        users = new ArrayList<>();
        String[] usersDataArr = FileHandler.readFromFile(fileName);
        int userID = 0;

        for (String userData : usersDataArr) {
            String[] userDataArr = userData.split(",");
            userID = Integer.parseInt(userDataArr[0]);
            String email = userDataArr[1];
            String password = userDataArr[2];
            String name = userDataArr[3];
            String contactNo = userDataArr[4];
            int age = Integer.parseInt(userDataArr[5]);
            String gender = userDataArr[6];

            User user = new User(userID, email, password, name, contactNo, age, gender);
            users.add(user);
        }

        ID = userID;
    }

    public static User findUser(int id) {
        for (User user : users) {
            if (user.getID() == id) {
                return user;
            }
        }
        return null;
    }

    public static void addUser(int id, String email, String password, String name,
                               String contactNo, int age, String gender) {
        User user = new User(id, email, password, name, contactNo, age, gender);
        users.add(user);
        FileHandler.writeToFile(fileName, true, user.toString());
    }

    public static void removeUser(int id) {
        users.remove(findUser(id));
        saveUsersToFile();
    }

    public static void updateUser(int id, String email, String password, String name,
                                  String contactNo, int age, String gender) {
        User user = findUser(id);
        if (user != null) {
            user.setEmail(email);
            user.setPassword(password);
            user.setName(name);
            user.setContactNo(contactNo);
            user.setAge(age);
            user.setGender(gender);
        }
        saveUsersToFile();
    }

    public static void saveUsersToFile() {
        String userDetails = "";
        for (User user : users) {
            userDetails += user.toString();
        }
        FileHandler.writeToFile(fileName, false, userDetails);
    }

    public static int getNextID() {
        ID = ID + 1;
        return ID;
    }

    public static ArrayList<User> getUsers() {
        return users;
    }
}
