package com.example.demo.controllers;

import com.example.demo.services.TutorsManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "AddTutorServlet", value = "/add-tutor")
public class AddTutorServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get tutor details
        int id = TutorsManager.getNextID();
        String email = request.getParameter("email");
        String name = request.getParameter("name");
        String contactNo = request.getParameter("contact-no");
        int age = Integer.parseInt(request.getParameter("age"));
        String gender = request.getParameter("gender");
        String subject = request.getParameter("subject");
        int subjectExpertise = Integer.parseInt(request.getParameter("subject-expertise"));
        double costPerHour = Double.parseDouble(request.getParameter("cost-per-hour"));

        // Save new tutor
        TutorsManager.addTutor(id, email, name, contactNo, age, gender, subject, subjectExpertise, costPerHour);

        response.sendRedirect("admin-dashboard.jsp");
    }
}