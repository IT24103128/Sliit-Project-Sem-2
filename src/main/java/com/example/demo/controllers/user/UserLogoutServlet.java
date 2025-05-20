package com.example.demo.controllers.user;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

// this annotation makes the servlet respond to URL "/user-logout"
@WebServlet(name = "UserLogoutServlet", value = "/user-logout")
public class UserLogoutServlet extends HttpServlet {

    // this method runs when a POST request sent to this servlet
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

        // get current user's session
        HttpSession session = request.getSession();

        // remove 'logged-in-user' attribute to log out user
        session.removeAttribute("logged-in-user");

        response.sendRedirect("index.jsp");
    }
}
