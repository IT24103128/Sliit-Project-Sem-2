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

@WebServlet(name = "TutorAscSortServlet", value = "/sort-tutor-asc")
public class TutorsAscSortServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        TutorsManager.readTutors();

        HttpSession session = request.getSession();

        ArrayList<Tutor> visibleTutors = (ArrayList<Tutor>)session.getAttribute("tutors");
        if  (visibleTutors == null) {
            visibleTutors = TutorsManager.getTutorsAsArrayList();
        }

        // Use Merge sort to sort tutors
        // convert array list to normal array
        Tutor[] tutorArr = new Tutor[visibleTutors.size()];
        // insert element in arraylist to array
        for (int i = 0; i < visibleTutors.size(); i++) {
            tutorArr[i] = visibleTutors.get(i);
        }

        System.out.println("Before Sorting"); // print the array before sorting
        for (Tutor tutor : tutorArr) {
            System.out.println(tutor.toString());
        }

        // Sort the array
        MergeSort.mergeSort(tutorArr, 0, tutorArr.length-1);

        System.out.println("After Sorting");  // print to check sorting worked or not
        for (Tutor tutor : tutorArr) {
            System.out.println(tutor.toString());
        }

        visibleTutors.clear(); // clear old details

        // insert array items to arrayLists
        for (Tutor tutor : tutorArr) {
            visibleTutors.add(tutor);
        }

        session.setAttribute("tutors", visibleTutors);
        request.getRequestDispatcher("pages/tutor/user-view.jsp").forward(request, response);
    }
}