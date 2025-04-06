package com.example.demo.controllers.user;
import com.example.demo.models.User;
import com.example.demo.services.TutorsManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "UserLoginServlet", value = "/user-login")
public class UserLoginServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        TutorsManager.readTutors();

        User user = new User(1, "user@mail.com", "123", "Thisal", "0783654803", 10, "Male");

        HttpSession session = request.getSession();
        session.setAttribute("user", user);
        session.setAttribute("tutors", TutorsManager.getTutors());
        request.getRequestDispatcher("/tutors-user-view.jsp").forward(request, response);
    }
}
