package com.example.demo.controllers;

import com.example.demo.services.TutorsManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "RemoveTutorServlet", value = "/remove-tutor")
public class RemoveTutorServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get tutor id
        int tutorID = Integer.parseInt(request.getParameter("id"));

        // Remove tutor
        TutorsManager.removeTutor(tutorID);

        response.sendRedirect("tutor-admin-view");
    }
}