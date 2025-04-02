package com.example.demo.controllers;

import com.example.demo.models.Tutor;
import com.example.demo.services.TutorsManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "TutorEditRedirectServlet", value = "/tutor-edit-redirect")
public class TutorEditRedirectServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        TutorsManager.readTutors();

        // Catch tutor id
        int tutorId = Integer.parseInt(request.getParameter("id"));

        Tutor tutor = TutorsManager.findTutor(tutorId);

        HttpSession session = request.getSession();
        session.setAttribute("tutor", tutor);
        request.getRequestDispatcher("/update-tutor.jsp").forward(request, response);
    }
}
