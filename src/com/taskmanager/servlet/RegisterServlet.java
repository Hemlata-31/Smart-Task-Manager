package com.taskmanager.servlet;

import com.taskmanager.dao.UserDAO;
import com.taskmanager.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    private UserDAO userDAO = new UserDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("jsp/register.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String pass = request.getParameter("password");

        User user = new User();
        user.setUsername(username);
        user.setEmail(email);
        user.setPassword(pass);

        String errorMsg = userDAO.registerUser(user);
        if (errorMsg == null) {
            response.sendRedirect("index.jsp?msg=Registration successful! Please login.");
        } else {
            request.setAttribute("error", "Registration failed: " + errorMsg);
            request.getRequestDispatcher("jsp/register.jsp").forward(request, response);
        }
    }
}
