package com.example.demo.controllers.admin;
import com.example.demo.models.Admin;
import com.example.demo.services.AdminManager;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "adminLoginServlet", value = "/admin-login")
public class AdminLoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        AdminManager.readAdmins();

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Admin loggedAdmin = null;
        for (Admin admin : AdminManager.getAdmins()) {
            if (admin.getEmail().equals(email) &&  admin.getPassword().equals(password)) {
                loggedAdmin= admin;
            }
        }

        HttpSession session = request.getSession();
        if (loggedAdmin == null){
            session.setAttribute("email-password-incorrect", "Email or password incorrect..!");
            response.sendRedirect("pages/admin/login.jsp");
            return;
        }

        session.setAttribute("logged-in-admin", loggedAdmin);
        response.sendRedirect("pages/tutor/admin-view.jsp");
    }
}