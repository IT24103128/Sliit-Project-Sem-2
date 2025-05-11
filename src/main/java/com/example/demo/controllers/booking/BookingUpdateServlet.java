package com.example.demo.controllers.booking;
import com.example.demo.services.BookingManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "UpdateBookingServlet", value = "/update-booking")
public class BookingUpdateServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get booking details
        int bookingID = Integer.parseInt(request.getParameter("booking-id"));
        String bookingDate = request.getParameter("booking-date");
        String bookingTime = request.getParameter("booking-time");

        BookingManager.updateBooking(bookingID, bookingDate, bookingTime);

        response.sendRedirect("pages/booking/user-view.jsp");
    }
}