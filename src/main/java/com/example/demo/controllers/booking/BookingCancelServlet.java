package com.example.demo.controllers.booking;
import com.example.demo.services.BookingManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "CancelBookingServlet", value = "/cancel-booking")
public class BookingCancelServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get booking details
        int bookingID = Integer.parseInt(request.getParameter("booking-id"));


        BookingManager.removeBooking(bookingID);

        response.sendRedirect("pages/booking/user-view.jsp");
    }
}