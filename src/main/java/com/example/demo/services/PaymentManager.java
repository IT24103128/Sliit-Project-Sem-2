package com.example.demo.services;

import com.example.demo.models.Payment;
import com.example.demo.utils.FileHandler;

import java.util.ArrayList;

public class PaymentManager {
    private static ArrayList<Payment> payments = null;
    private static final String fileName = "payments.txt";
    private static int ID = 0;

    public static void readPayments() {
        if (payments != null)
            return;

        payments =  new ArrayList<>();
        // Read all payments from file
        String[] paymentsDataArr = FileHandler.readFromFile(fileName);
        // initialize id with 0
        int paymentId = 0;
        for (String paymentData : paymentsDataArr) {
            // Split string using "," to get string array
            String[] paymentDataArr = paymentData.split(",");
            paymentId = Integer.parseInt(paymentDataArr[0]);
            int bookingID = Integer.parseInt(paymentDataArr[1]);
            int userID = Integer.parseInt(paymentDataArr[2]);
            String date = paymentDataArr[3];
            String time = paymentDataArr[4];
            double amount = Double.parseDouble(paymentDataArr[5]);

            // Create Payment object
            Payment payment = new Payment(paymentId, bookingID, userID, date, time, amount);
            payments.addFirst(payment); // Append payment to arrayList
        }
        ID = paymentId; // set last payment id to id
    }

    public static Payment findPayment(int id) {
        for (Payment payment : payments) {
            if (payment.getID() == id) {
                return payment;
            }
        }
        return null;
    }

    public static void addPayment(int id, int bookingID, int userID, String date, String time, double amount) {
        Payment payment = new Payment(id, bookingID, userID, date, time, amount);
        payments.add(0, payment);

        // Create string for writing to file
        FileHandler.writeToFile(fileName, true, payment.toString());
    }

    public static void deletePayment(int id) {
        Payment findPayment = findPayment(id);
        if (findPayment != null) {
            payments.remove(findPayment);
            savePaymentsToFile();
        }
    }

    public static void savePaymentsToFile(){
        // Update the file
        String paymentsDetails = "";
        for (Payment payment : payments) {
            paymentsDetails += payment.toString();
        }
        FileHandler.writeToFile(fileName, false, paymentsDetails);
    }

    public static int getNextID() {
        return ++ID;
    }

    public static ArrayList<Payment> getPayments() {
        return payments;
    }

    public static ArrayList<Payment> getPayments(int userID) {
        ArrayList<Payment> payments =  new ArrayList<>();
        for (Payment payment : getPayments()) {
            if (payment.getUserID() == userID) {
                payments.add(payment);
            }
        }
        return payments;
    }

    public static Payment getPaymentByBookingID(int bookingID) {
        for (Payment payment : payments) {
            if (payment.getBookingID() == bookingID) {
                return payment;
            }
        }
        return null;
    }

}
