package com.taskmanager.servlet;

import com.taskmanager.dao.ReminderDAO;
import com.taskmanager.model.Reminder;
import com.taskmanager.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;

@WebServlet("/reminders")
public class ReminderServlet extends HttpServlet {
    private ReminderDAO reminderDAO = new ReminderDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("index.jsp");
            return;
        }

        User user = (User) session.getAttribute("user");
        String action = request.getParameter("action");

        if ("complete".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            reminderDAO.markAsCompleted(id, user.getId());
        }

        List<Reminder> reminders = reminderDAO.getRemindersByUserId(user.getId());
        request.setAttribute("reminders", reminders);
        request.getRequestDispatcher("jsp/reminders.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("index.jsp");
            return;
        }

        User user = (User) session.getAttribute("user");
        String message = request.getParameter("message");
        String timeStr = request.getParameter("reminderTime"); // Format: yyyy-MM-dd'T'HH:mm
        
        // Convert datetime-local string to Timestamp
        Timestamp time = Timestamp.valueOf(timeStr.replace("T", " ") + ":00");

        Reminder reminder = new Reminder();
        reminder.setUserId(user.getId());
        reminder.setMessage(message);
        reminder.setReminderTime(time);

        reminderDAO.addReminder(reminder);
        response.sendRedirect("reminders");
    }
}
