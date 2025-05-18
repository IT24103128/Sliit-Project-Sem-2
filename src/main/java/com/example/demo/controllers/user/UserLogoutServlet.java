package com.example.demo.controllers.user;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "UserLogoutServlet", value = "/user-logout")
public class UserLogoutServlet extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

        HttpSession session = request.getSession();

        session.removeAttribute("logged-in-user");

        response.sendRedirect("index.jsp");
    }
}
