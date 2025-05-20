package com.example.demo.controllers.user;
import com.example.demo.models.Review;
import com.example.demo.models.User;
import com.example.demo.services.ReviewManager;
import com.example.demo.services.TutorsManager;
import com.example.demo.services.UserManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

// define this servlet handle user login requests at "/user-login"
@WebServlet(name = "UserLoginServlet", value = "/user-login")
public class UserLoginServlet extends HttpServlet {
    
     // handle POST requests (when user submits login form)
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         // Load tutors, users, reviews data      
        TutorsManager.readTutors();
        UserManager.readUsers();
        ReviewManager.readReviews();

        // get the email, password entered by the user       
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        /*
        User login auth going here
        */
        User loggedUser = null;
        for (User user : UserManager.getUsers()) { //  Check user to find  matching email and password
            if (user.getEmail().equals(email) &&  user.getPassword().equals(password)) {
                loggedUser = user;
            }
        }

        HttpSession session = request.getSession();
            // if login failed show error message and redirect to login page
        if (loggedUser == null){
            session.setAttribute("email-password-incorrect", "Email or password incorrect..!");
            response.sendRedirect("index.jsp");
            return;
        }
                
       // if login succeeded save user info in session and redirect to tutors view
        session.setAttribute("logged-in-user", loggedUser);
        response.sendRedirect("tutors-user-view");
    }
}
