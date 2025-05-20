package com.example.demo.controllers.user;
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

// this servlet delete a user when called at /delete-user
@WebServlet(name = "UserDeleteServlet", value = "/delete-user") 
public class UserDeleteServlet extends HttpServlet {

    // this method runs when a POST request is made to /delete-user
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        UserManager.readUsers();

        int id = Integer.parseInt(request.getParameter("user-id"));  // get the user ID from the request

        UserManager.removeUser(id);    // delete user with given ID

        response.sendRedirect("pages/user/admin-view.jsp"); // After deleting go back to admin user management page
    }
}
