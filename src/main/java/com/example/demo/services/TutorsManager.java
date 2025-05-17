package com.example.demo.services;
import com.example.demo.dsa.BinaryTree;
import com.example.demo.dsa.Node;
import com.example.demo.models.Tutor;
import com.example.demo.utils.FileHandler;
import java.util.ArrayList;

public class TutorsManager {
    private static BinaryTree tutors = null;
    private static final String fileName = "tutors.txt";
    private static int ID = 0;

    public static void readTutors() {
        if (tutors != null)
            return;

        tutors =  new BinaryTree();
        // Read all tutors from file
        String[] tutorsDataArr = FileHandler.readFromFile(fileName);
        // initialize id with 0
        int tutorID = 0;
        for (String tutorData : tutorsDataArr) {
            // Split string using "," to get string array
            String[] tutorDataArr = tutorData.split(",");
            tutorID = Integer.parseInt(tutorDataArr[0]);
            String email = tutorDataArr[1];
            String name = tutorDataArr[2];
            String contactNo = tutorDataArr[3];
            int age = Integer.parseInt(tutorDataArr[4]);
            String gender = tutorDataArr[5];
            String subject = tutorDataArr[6];
            int subjectExpertise = Integer.parseInt(tutorDataArr[7]);
            double costPerHour = Double.parseDouble(tutorDataArr[8]);
            // Create Tutor object
            Tutor tutor = new Tutor(tutorID, email, name, contactNo, age, gender, subject, subjectExpertise, costPerHour);
            tutors.insert(tutorID, tutor); // Append tutor to arrayList
        }
        ID = tutorID; // set last tutor id to id
    }


    public static void addTutor(int id, String email, String name, String contactNo, int age, String gender,
            String subject, int subjectExpertise, double costPerHour) {
        // Create new tutor object
        Tutor tutor = new Tutor(id, email, name, contactNo, age, gender, subject, subjectExpertise, costPerHour);
        // insert to tutors array list
        tutors.insert(id, tutor);

        // Create string for writing to file
        FileHandler.writeToFile(fileName, true, tutor.toString());
    }

    public static void removeTutor(int id) {
        // Remove tutor from array list
        Tutor removeTutor = tutors.findTutor(id);
        if (removeTutor != null){
            tutors.remove(id);
        }
        saveTutorsToFile();
    }

    public static void updateTutor(int id, String email, String name, String contactNo, int age, String gender,
            String subject, int subjectExpertise, double costPerHour) {
        Tutor foundTutor = tutors.findTutor(id);
        if (foundTutor != null) {
            foundTutor.setEmail(email);
            foundTutor.setName(name);
            foundTutor.setContactNo(contactNo);
            foundTutor.setAge(age);
            foundTutor.setGender(gender);
            foundTutor.setSubject(subject);
            foundTutor.setSubjectExpertise(subjectExpertise);
            foundTutor.setCostPerHour(costPerHour);
        }

        saveTutorsToFile();
    }


    public static void saveTutorsToFile() {
        StringBuilder tutorsStringBuilder = new StringBuilder();
        tutors.inOrderTraversalToString(tutors.getRoot(), tutorsStringBuilder);
        FileHandler.writeToFile(fileName, false, tutorsStringBuilder.toString());
    }

    public static int getNextID() {
        return ++ID;
    }

    public static ArrayList<Tutor> getTutorsAsArrayList() {
        ArrayList<Tutor> list = new ArrayList<>();
        tutors.inOrderTraversalToList(tutors.getRoot(), list);
        return list;
    }

    public static Tutor findTutor(int id) {
        return tutors.findTutor(id);
    }

}
