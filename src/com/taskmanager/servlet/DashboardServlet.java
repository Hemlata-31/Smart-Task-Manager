package com.taskmanager.servlet;

import com.taskmanager.dao.TaskDAO;
import com.taskmanager.model.Task;
import com.taskmanager.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/dashboard")
public class DashboardServlet extends HttpServlet {
    private TaskDAO taskDAO = new TaskDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("index.jsp");
            return;
        }

        User user = (User) session.getAttribute("user");
        List<Task> tasks = taskDAO.getTasksByUserId(user.getId());

        long total = tasks.size();
        long completed = tasks.stream().filter(t -> "Completed".equals(t.getStatus())).count();
        long pending = tasks.stream().filter(t -> "Pending".equals(t.getStatus())).count();
        long inProgress = tasks.stream().filter(t -> "In Progress".equals(t.getStatus())).count();

        List<com.taskmanager.model.Reminder> reminders = new com.taskmanager.dao.ReminderDAO().getRemindersByUserId(user.getId());
        long overdueReminders = reminders.stream().filter(r -> !r.isCompleted() && r.getReminderTime().before(new java.sql.Timestamp(System.currentTimeMillis()))).count();

        request.setAttribute("totalTasks", total);
        request.setAttribute("completedTasks", completed);
        request.setAttribute("pendingTasks", pending);
        request.setAttribute("inProgressTasks", inProgress);
        request.setAttribute("overdueReminders", overdueReminders);
        request.setAttribute("reminders", reminders);

        request.getRequestDispatcher("jsp/dashboard.jsp").forward(request, response);
    }
}
