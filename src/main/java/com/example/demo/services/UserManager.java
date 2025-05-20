package com.example.demo.services;

import com.example.demo.models.User;
import com.example.demo.utils.FileHandler;

import java.util.ArrayList;

public class UserManager { // dependency
    private static ArrayList<User> users = null;           // array list used to stores user objects within user.
    private static final String fileName = "users.txt";    // file users.txt is used for saving user.
    private static int ID = 0;                             // ID counter tracks the next available user ID

    public static void readUsers() {  /* reads user data from users.txt, and initializes the users list*/

        if (users != null)      // exit,If users list is already loaded
            return;

        users = new ArrayList<>();
        String[] usersDataArr = FileHandler.readFromFile(fileName);   // reads user data from file
        int userID = 0;          // Temporary variable for storing user ID

        for (String userData : usersDataArr) {
            String[] userDataArr = userData.split(",");    // Split line into fields by comma
            userID = Integer.parseInt(userDataArr[0]);
            String email = userDataArr[1];
            String password = userDataArr[2];
            String name = userDataArr[3];
            String contactNo = userDataArr[4];
            int age = Integer.parseInt(userDataArr[5]);
            String gender = userDataArr[6];

            User user = new User(userID, email, password, name, contactNo, age, gender); //Create a User object with those fields
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
     /*  Searches for a User object by its ID. Returns null if no match is found */
    }

    public static void addUser(int id, String email, String password, String name,
                               String contactNo, int age, String gender) {
        User user = new User(id, email, password, name, contactNo, age, gender);
        users.add(user);
        FileHandler.writeToFile(fileName, true, user.toString());
        /* adds new users to users list and writes the users details */
    }

    public static void removeUser(int id) {
        users.remove(findUser(id));
        saveUsersToFile();
     // remove user from list, update file
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
    /* Converts all user objects in users list to string format and saves, overwriting it */

        String userDetails = "";
        for (User user : users) {
            userDetails += user.toString();
        }
        FileHandler.writeToFile(fileName, false, userDetails);
    }

    public static int getNextID() { // increments and returns the next ID for a new user
        ID = ID + 1;
        return ID;
    }

    public static ArrayList<User> getUsers() {
        return users;
    }
}


