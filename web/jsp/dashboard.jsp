<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.taskmanager.model.User" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("../index.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Dashboard - Smart Task Manager</title>
    <link rel="stylesheet" href="css/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
    <style>
        .reminder-item {
            display: flex;
            align-items: center;
            padding: 1rem;
            background: rgba(255, 255, 255, 0.03);
            border-radius: 0.75rem;
            margin-bottom: 0.75rem;
            border-left: 4px solid var(--accent);
            transition: 0.3s;
        }

        .reminder-item:hover {
            background: rgba(255, 255, 255, 0.05);
            transform: translateX(5px);
        }

        .reminder-item .icon {
            margin-right: 1rem;
            color: var(--accent);
            font-size: 1.2rem;
        }

        .reminder-info {
            flex: 1;
        }
    </style>
    <script>
        window.onload = function() {
            var overdue = <%= request.getAttribute("overdueReminders") %>;
            if (overdue > 0) {
                alert("You have " + overdue + " overdue reminders! Check the Reminders section.");
            }
        };
    </script>
</head>
<body>
    <jsp:include page="sidebar.jsp" />

    <div class="main-content">
        <header style="margin-bottom: 2rem;">
            <h1>Welcome, <%= user.getUsername() %>!</h1>
            <p style="color: var(--text-muted);">Here's what's happening with your tasks today.</p>
        </header>

        <div class="dashboard-grid">
            <div class="stat-card">
                <h3>Total Tasks</h3>
                <div class="value"><%= request.getAttribute("totalTasks") %></div>
            </div>
            <div class="stat-card">
                <h3>Completed</h3>
                <div class="value" style="color: var(--success);"><%= request.getAttribute("completedTasks") %></div>
            </div>
            <div class="stat-card">
                <h3>Pending</h3>
                <div class="value" style="color: var(--warning);"><%= request.getAttribute("pendingTasks") %></div>
            </div>
            <div class="stat-card">
                <h3>In Progress</h3>
                <div class="value" style="color: var(--accent);"><%= request.getAttribute("inProgressTasks") %></div>
            </div>
        </div>

        <div style="display: grid; grid-template-columns: 2fr 1fr; gap: 2rem;">
            <div class="glass-panel">
                <h3>Quick Actions</h3>
                <div style="display: flex; gap: 1rem; margin-top: 1rem;">
                    <a href="tasks" style="text-decoration: none;"><button>View All Tasks</button></a>
                    <a href="jsp/pomodoro.jsp" style="text-decoration: none;"><button style="background: var(--secondary-bg);">Start Pomodoro</button></a>
                </div>
            </div>

            <div class="glass-panel">
                <h3>Upcoming Reminders</h3>
                <div style="margin-top: 1rem;">
                    <% 
                        java.util.List<com.taskmanager.model.Reminder> reminders = (java.util.List<com.taskmanager.model.Reminder>) request.getAttribute("reminders");
                        
                        // Fallback in case servlet didn't provide them
                        if (reminders == null && user != null) {
                            reminders = new com.taskmanager.dao.ReminderDAO().getRemindersByUserId(user.getId());
                        }

                        if (reminders != null && !reminders.isEmpty()) {
                            boolean hasActive = false;
                            for (com.taskmanager.model.Reminder r : reminders) {
                                if (!r.isCompleted()) {
                                    hasActive = true;
                    %>
                        <div class="reminder-item">
                            <div class="icon">🔔</div>
                            <div class="reminder-info">
                                <div style="font-weight: 600; color: var(--text-main);"><%= r.getMessage() %></div>
                                <div style="font-size: 0.8rem; color: var(--text-muted); margin-top: 2px;">
                                    <%= new java.text.SimpleDateFormat("MMM dd, hh:mm a").format(r.getReminderTime()) %>
                                </div>
                            </div>
                        </div>
                    <% 
                                }
                            }
                            if (!hasActive) {
                                out.println("<p style='color: var(--text-muted); font-size: 0.9rem;'>No upcoming reminders.</p>");
                            }
                        } else {
                    %>
                        <p style="color: var(--text-muted); font-size: 0.9rem;">No upcoming reminders.</p>
                    <% } %>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
