package com.example.demo.controllers.admin;



import java.io.*;

import com.example.demo.models.Admin;
import com.example.demo.services.AdminManager;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "AdminServlet", value = "/add-admin")
public class AdminAddServlet extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String email = request.getParameter("email");
 //get email if already has entered email sent - allready used mas and reasign Admin add page 
        for(Admin admin : AdminManager.getAdmins()) {
            if(admin.getEmail().equals(email)) {
                HttpSession session = request.getSession();
                session.setAttribute("email-already-used", "This email is already in use..!");
                response.sendRedirect("pages/admin/add.jsp");
                return;
            };

        }

        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String contactNo = request.getParameter("contact-no");
        int ID = AdminManager.getNextID();

        AdminManager.addAdmin(ID, email, password, name, contactNo);

        response.sendRedirect("pages/admin/admin-view.jsp");
    }
}
