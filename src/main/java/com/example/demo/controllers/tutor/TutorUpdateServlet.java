package com.example.demo.controllers.tutor;
import com.example.demo.services.TutorsManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "UpdateTutorServlet", value = "/update-tutor")
public class TutorUpdateServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        TutorsManager.readTutors();

        // Get tutor details
        int ID = Integer.parseInt(request.getParameter("id"));
        String email = request.getParameter("email");
        String name = request.getParameter("name");
        String contactNo = request.getParameter("contact-no");
        int age = Integer.parseInt(request.getParameter("age"));
        String gender = request.getParameter("gender");
        String subject = request.getParameter("subject");
        int subjectExpertise = Integer.parseInt(request.getParameter("subject-expertise"));
        double costPerHour = Double.parseDouble(request.getParameter("cost-per-hour"));

        // update tutor details
        TutorsManager.updateTutor(ID, email, name, contactNo, age, gender, subject, subjectExpertise, costPerHour);

        response.sendRedirect("pages/tutor/admin-view.jsp");
    }
}