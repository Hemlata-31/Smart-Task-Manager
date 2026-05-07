<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.taskmanager.model.Reminder, java.util.List, java.sql.Timestamp" %>
<!DOCTYPE html>
<html>
<head>
    <title>Reminders - Smart Task Manager</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <jsp:include page="sidebar.jsp" />

    <div class="main-content">
        <h1>Reminders</h1>

        <div class="glass-panel" style="margin-top: 1rem; margin-bottom: 2rem;">
            <h3>Create Reminder</h3>
            <form action="reminders" method="post" style="display: flex; gap: 1rem; margin-top: 1rem;">
                <input type="text" name="message" placeholder="What should I remind you?" required style="flex: 2;">
                <input type="datetime-local" name="reminderTime" required style="flex: 1;">
                <button type="submit">Set Reminder</button>
            </form>
        </div>

        <div class="glass-panel">
            <h3>Scheduled Reminders</h3>
            <table>
                <thead>
                    <tr>
                        <th>Message</th>
                        <th>Time</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                        List<Reminder> reminders = (List<Reminder>) request.getAttribute("reminders");
                        Timestamp now = new Timestamp(System.currentTimeMillis());
                        if (reminders != null) {
                            for (Reminder r : reminders) {
                                boolean isOverdue = r.getReminderTime().before(now) && !r.isCompleted();
                    %>
                        <tr style="<%= isOverdue ? "color: var(--danger);" : "" %>">
                            <td><%= r.getMessage() %></td>
                            <td><%= r.getReminderTime() %></td>
                            <td><%= r.isCompleted() ? "Completed" : (isOverdue ? "Overdue" : "Scheduled") %></td>
                            <td>
                                <% if (!r.isCompleted()) { %>
                                    <a href="reminders?action=complete&id=<%= r.getId() %>" style="color: var(--success); text-decoration: none;">Mark Done</a>
                                <% } %>
                            </td>
                        </tr>
                    <%      }
                        }
                    %>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
