package com.example.demo.services;
import com.example.demo.models.Tutor;
import com.example.demo.utils.FileHandler;
import java.util.ArrayList;

public class TutorsManager {
    private static ArrayList<Tutor> tutors = null;
    private static final String fileName = "tutors.txt";
    private static int id = 0;

    public static void readTutors() {
        if (tutors != null)
            return;

        tutors =  new ArrayList<>();
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
            tutors.add(tutor); // Append tutor to arrayList
        }
        id = tutorID; // set last tutor id to id
    }

    public static Tutor findTutor(int id) {
        for (Tutor tutor : tutors) {
            if (tutor.getID() == id) {
                return tutor;
            }
        }
        return null;
    }

    public static void addTutor(int id, String email, String name, String contactNo, int age, String gender,
            String subject, int subjectExpertise, double costPerHour) {
        // Create new tutor object
        Tutor tutor = new Tutor(id, email, name, contactNo, age, gender, subject, subjectExpertise, costPerHour);
        // insert to tutors array list
        tutors.add(tutor);

        // Create string for writing to file
        FileHandler.writeToFile(fileName, true, tutor.toString());
    }

    public static void removeTutor(int id) {
        // Remove tutor from array list
        tutors.remove(findTutor(id));
        saveTutorsToFile();
    }

    public static void updateTutor(int id, String email, String name, String contactNo, int age, String gender,
            String subject, int subjectExpertise, double costPerHour) {
        Tutor foundTutor = findTutor(id);
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

    public static void saveTutorsToFile(){
        // Update the file
        String tutorsDetails = "";
        for (Tutor tutor : tutors) {
            tutorsDetails += tutor.toString();
        }
        FileHandler.writeToFile(fileName, false, tutorsDetails);
    }

    public static int getNextID() {
        return ++id;
    }

    public static ArrayList<Tutor> getTutors() {
        return tutors;
    }

}
