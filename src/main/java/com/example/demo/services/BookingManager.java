package com.example.demo.services;

import com.example.demo.models.Booking;
import com.example.demo.models.Tutor;
import com.example.demo.utils.FileHandler;

import java.util.ArrayList;

public class BookingManager {
    private static ArrayList<Booking> bookings = null;
    private static final String fileName = "bookings.txt";
    private static int ID = 0;

    public static void readBookings() {
        if (bookings != null)
            return;

        bookings =  new ArrayList<>();
        // Read all bookings from file
        String[] bookingsDataArr = FileHandler.readFromFile(fileName);
        // initialize id with 0
        int bookingId = 0;
        for (String bookingData : bookingsDataArr) {
            // Split string using "," to get string array
            String[] bookingDataArr = bookingData.split(",");
            bookingId = Integer.parseInt(bookingDataArr[0]);
            int userId = Integer.parseInt(bookingDataArr[1]);
            int tutorId = Integer.parseInt(bookingDataArr[2]);
            double hours = Double.parseDouble(bookingDataArr[3]);
            String date = bookingDataArr[4];
            String time = bookingDataArr[5];

            // Create Booking object
            Booking booking = new Booking(bookingId, userId, tutorId, hours, date, time);
            bookings.add(0, booking); // Append booking to arrayList
        }
        ID = bookingId; // set last booking id to id
    }

    public static Booking findBooking(int id) {
        for (Booking booking : bookings) {
            if (booking.getID() == id) {
                return booking;
            }
        }
        return null;
    }

    public static void addBooking(int ID, int userID, int tutorID, double duration, String date, String time) {
        Booking booking = new Booking(ID, userID, tutorID, duration, date, time);
        bookings.addFirst(booking);

        // Create string for writing to file
        FileHandler.writeToFile(fileName, true, booking.toString());
    }

    public static void updateBooking(int id, String date, String time) {
        Booking foundBooking = BookingManager.findBooking(id);
        if (foundBooking != null) {
            foundBooking.setDate(date);
            foundBooking.setTime(time);
        }
        saveBookingsToFile();
    }

    public static void removeBooking(int id) {
        // Remove booking from array list
        bookings.remove(findBooking(id));
        saveBookingsToFile();
    }

    public static void saveBookingsToFile(){
        // Update the file
        String bookingsDetails = "";
        for (Booking booking : bookings) {
            bookingsDetails += booking.toString();
        }
        FileHandler.writeToFile(fileName, false, bookingsDetails);
    }

    public static int getNextID() {
        return ++ID;
    }

    public static ArrayList<Booking> getBookings() {
        return bookings;
    }

    public static ArrayList<Booking> getBooking(int userID){
        ArrayList<Booking> bookings = new ArrayList<>();
        for (Booking booking : getBookings()) {
            if (booking.getUserID() == userID) {
                bookings.add(booking);
            }
        }
        return bookings;
    }

}
