package com.example.demo.controllers.payment;
import com.example.demo.services.PaymentManager;
import com.example.demo.services.ReviewManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "PaymentDeleteServlet", value = "/delete-payment")
public class PaymentDeleteServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get payment id
        int paymentID = Integer.parseInt(request.getParameter("payment-id"));

        // Remove review
        PaymentManager.deletePayment(paymentID);

        response.sendRedirect("pages/payment/user-view.jsp");
    }
}