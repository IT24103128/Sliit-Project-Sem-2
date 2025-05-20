package com.example.demo.controllers.user;

import java.io.*;
import com.example.demo.models.User;
import com.example.demo.services.UserManager;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "helloServlet", value = "/user-register")
public class UserRegisterServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        UserManager.readUsers();

        String email = request.getParameter("email");
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        String gender = request.getParameter("gender");
        String contactNo = request.getParameter("contact-no");
        int age = Integer.parseInt(request.getParameter("age"));
        int id  = UserManager.getNextID();

        HttpSession session = request.getSession();
        for(User user : UserManager.getUsers()) {
            if(user.getEmail().equals(email)) {
                session.setAttribute("email-already-used" , "This email is already in use..!");
                response.sendRedirect("pages/user/register.jsp");
                return;
            }
        }

        UserManager.addUser(id,email,password,name,contactNo,age,gender);

        session.setAttribute("registration-success", "Registration Successful..!");
        response.sendRedirect("pages/user/register.jsp");
    }
}


