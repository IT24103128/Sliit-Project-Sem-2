package com.example.demo.controllers.admin;



import java.io.*;

import com.example.demo.models.Admin;
import com.example.demo.services.AdminManager;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "AdminDetleteServlet", value = "/delete-admin")
public class AdminDeleteServlet extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {



        int id = Integer.parseInt(request.getParameter("admin-id"));

        AdminManager.removeAdmin(id);

        response.sendRedirect("pages/admin/admin-view.jsp");

    }
}