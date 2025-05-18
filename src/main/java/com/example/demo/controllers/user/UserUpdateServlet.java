package com.example.demo.controllers.user;

import com.example.demo.models.User;
import com.example.demo.services.UserManager;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "UserUpdateServlet", value = "/user-update")
public class UserUpdateServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        UserManager.readUsers();

        String email = request.getParameter("email");
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        String gender = request.getParameter("gender");
        String contactNo = request.getParameter("contact-no");
        int age = Integer.parseInt(request.getParameter("age"));
        int id  = Integer.parseInt(request.getParameter("id"));

        UserManager.updateUser(id, email, password, name, contactNo, age, gender);

        response.sendRedirect("pages/user/profile-view.jsp");
    }
}


