package com.example.demo.controllers.user;
import com.example.demo.services.UserManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;


@WebServlet(name = "UserUnregisterServlet", value = "/unregister-user")
public class UserUnregisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        UserManager.readUsers();

        int id = Integer.parseInt(request.getParameter("user-id"));  // get the user ID from the request

        UserManager.removeUser(id);

        response.sendRedirect("index.jsp"); // After deleting go back to login page
    }
}
