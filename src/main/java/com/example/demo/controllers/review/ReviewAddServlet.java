package com.example.demo.controllers.review;
import java.time.LocalDate;
import com.example.demo.services.ReviewManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "AddReviewServlet", value = "/add-review")
public class ReviewAddServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ReviewManager.readReviews();

        // Get tutor details
        int ID = ReviewManager.getNextID();
        int userID = Integer.parseInt(request.getParameter("userID"));
        int tutorID = Integer.parseInt(request.getParameter("tutorID"));
        String comment = request.getParameter("review");
        int rating = Integer.parseInt(request.getParameter("rating"));
        // Get current time
        String date = String.valueOf(LocalDate.now());

        // Save new review
        ReviewManager.addReview(ID, userID, tutorID, comment, rating, date);
        response.sendRedirect("pages/review/tutor-profile.jsp?tutorID=" + tutorID);
    }
}