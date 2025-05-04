package com.example.demo.controllers.tutor;
import com.example.demo.services.TutorsManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "RemoveTutorServlet", value = "/remove-tutor")
public class TutorRemoveServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        TutorsManager.readTutors();

        // Get tutor id
        int tutorID = Integer.parseInt(request.getParameter("tutor-id"));

        // Remove tutor
        TutorsManager.removeTutor(tutorID);

        response.sendRedirect("pages/tutor/admin-view.jsp");
    }
}