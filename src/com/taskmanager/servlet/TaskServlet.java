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
import java.sql.Date;
import java.util.List;

@WebServlet("/tasks")
public class TaskServlet extends HttpServlet {
    private TaskDAO taskDAO = new TaskDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("index.jsp");
            return;
        }

        User user = (User) session.getAttribute("user");
        String action = request.getParameter("action");

        if ("delete".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            taskDAO.deleteTask(id, user.getId());
        }

        List<Task> tasks = taskDAO.getTasksByUserId(user.getId());
        request.setAttribute("tasks", tasks);
        request.getRequestDispatcher("jsp/tasks.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("index.jsp");
            return;
        }

        User user = (User) session.getAttribute("user");
        String action = request.getParameter("action");

        Task task = new Task();
        task.setUserId(user.getId());
        task.setTitle(request.getParameter("title"));
        task.setDescription(request.getParameter("description"));
        task.setPriority(request.getParameter("priority"));
        task.setStatus(request.getParameter("status"));
        task.setDueDate(Date.valueOf(request.getParameter("dueDate")));

        if ("add".equals(action)) {
            taskDAO.addTask(task);
        } else if ("update".equals(action)) {
            task.setId(Integer.parseInt(request.getParameter("id")));
            taskDAO.updateTask(task);
        }

        response.sendRedirect("tasks");
    }
}
