package com.example.demo.controllers.booking_payment;
import com.example.demo.models.Payment;
import com.example.demo.models.Tutor;
import com.example.demo.models.User;
import com.example.demo.services.BookingManager;
import java.time.LocalDate;

import com.example.demo.services.PaymentManager;
import com.example.demo.services.TutorsManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.time.LocalDateTime;

@WebServlet(name = "BookAndPay", value = "/book-and-pay")
public class BookAndPayServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        BookingManager.readBookings();
        PaymentManager.readPayments();

        // Catch data for booking
        int bookingId = BookingManager.getNextID();
        String bookingDate = request.getParameter("date");
        String bookingTime = request.getParameter("time");
        double duration = Double.parseDouble(request.getParameter("duration"));
        int tutorID = Integer.parseInt(request.getParameter("tutor-id"));
        Tutor bookedTutor = TutorsManager.findTutor(tutorID);

        // Catch data for payment
        User loggedInUser = (User) request.getSession().getAttribute("logged-in-user");
        int userID = loggedInUser.getID();
        String currentDate = String.valueOf(LocalDate.now());
        String currentTime = String.valueOf(LocalDateTime.now()).substring(11).split("\\.")[0];
        double amount = bookedTutor.calculateCost(duration);

        BookingManager.addBooking(bookingId, userID, tutorID, duration, bookingDate, bookingTime);
        PaymentManager.addPayment(PaymentManager.getNextID(), bookingId, userID, currentDate, currentTime, amount);

        response.sendRedirect("pages/booking/user-view.jsp");
    }
}
