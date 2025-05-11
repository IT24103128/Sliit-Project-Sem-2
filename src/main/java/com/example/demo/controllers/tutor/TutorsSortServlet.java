package com.example.demo.controllers.tutor;
import com.example.demo.dsa.MergeSort;
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

@WebServlet(name = "TutorSortServlet", value = "/sort-tutor")
public class TutorsSortServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        TutorsManager.readTutors();

        HttpSession session = request.getSession();

        ArrayList<Tutor> visibleTutors = (ArrayList<Tutor>)session.getAttribute("tutors");
        if  (visibleTutors == null) {
            visibleTutors = TutorsManager.getTutorsAsArrayList();
        }
        visibleTutors = (ArrayList<Tutor>)visibleTutors.clone();
        MergeSort.mergeSort(visibleTutors);

        session.setAttribute("tutors", visibleTutors);
        request.getRequestDispatcher("pages/tutor/user-view.jsp").forward(request, response);
    }
}