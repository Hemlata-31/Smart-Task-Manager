<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login - Smart Task Manager</title>
    <link rel="stylesheet" href="css/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
</head>
<body style="display: block;">
    <div class="auth-container">
        <div class="glass-panel">
            <h2 style="text-align: center; color: var(--accent); margin-bottom: 1.5rem;">Smart Task Manager</h2>
            <form action="login" method="post">
                <label>Username</label>
                <input type="text" name="username" required placeholder="Enter username">
                <label>Password</label>
                <input type="password" name="password" required placeholder="Enter password">
                <button type="submit" style="width: 100%;">Login</button>
            </form>
            <p style="margin-top: 1rem; text-align: center; font-size: 0.9rem;">
                Don't have an account? <a href="register" style="color: var(--accent);">Register here</a>
            </p>
            <% if (request.getAttribute("error") != null) { %>
                <p style="color: var(--danger); text-align: center; margin-top: 1rem;"><%= request.getAttribute("error") %></p>
            <% } %>
            <% if (request.getParameter("msg") != null) { %>
                <p style="color: var(--success); text-align: center; margin-top: 1rem;"><%= request.getParameter("msg") %></p>
            <% } %>
        </div>
    </div>
</body>
</html>
