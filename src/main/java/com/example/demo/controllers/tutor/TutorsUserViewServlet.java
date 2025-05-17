package com.example.demo.controllers.tutor;
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

@WebServlet(name = "TutorsUserViewServlet", value = "/tutors-user-view")
public class TutorsUserViewServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        TutorsManager.readTutors();

        // get all tutors
        ArrayList<Tutor> tutors = TutorsManager.getTutorsAsArrayList();

        // Forward to the view-tutors.jsp
        HttpSession session = request.getSession();
        session.setAttribute("tutors", tutors);
        response.sendRedirect("pages/tutor/user-view.jsp");
    }
}
