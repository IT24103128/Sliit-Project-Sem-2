package com.example.demo.controllers.review;
import com.example.demo.services.ReviewManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "DeleteReviewServlet", value = "/delete-review")
public class ReviewDeleteServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get review id
        int reviewID = Integer.parseInt(request.getParameter("review-id"));

        // Remove review
        ReviewManager.removeReview(reviewID);

        response.sendRedirect("pages/review/admin-view.jsp");
    }
}