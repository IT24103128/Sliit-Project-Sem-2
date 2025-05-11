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

@WebServlet(name = "TutorSearchServlet", value = "/search-tutor")
public class TutorsSearchServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        TutorsManager.readTutors();

        // Get the search subject
        String subjectName = request.getParameter("subject");
        ArrayList<Tutor> tutors = new ArrayList<>();

        for (Tutor tutor : TutorsManager.getTutorsAsArrayList()) {
            // Remove all spaces in subject name
            String tutorSubject = tutor.getSubject().replaceAll(" ", "");
            if (tutorSubject.equalsIgnoreCase(subjectName)){
                tutors.add(tutor);
            }
        }

        //
        HttpSession session = request.getSession();
        session.setAttribute("tutors", tutors);

        request.getRequestDispatcher("pages/tutor/user-view.jsp").forward(request, response);

    }
}