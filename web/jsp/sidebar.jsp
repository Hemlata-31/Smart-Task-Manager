<div class="sidebar">
    <h2>TaskMaster</h2>
    <a href="dashboard" class="<%= request.getServletPath().contains("dashboard") ? "active" : "" %>">Dashboard</a>
    <a href="tasks" class="<%= request.getServletPath().contains("tasks") ? "active" : "" %>">Tasks</a>
    <a href="reminders" class="<%= request.getServletPath().contains("reminders") ? "active" : "" %>">Reminders</a>
    <a href="jsp/pomodoro.jsp" class="<%= request.getServletPath().contains("pomodoro") ? "active" : "" %>">Pomodoro</a>
    <div style="margin-top: auto;">
        <a href="logout" style="color: var(--danger);">Logout</a>
    </div>
</div>
