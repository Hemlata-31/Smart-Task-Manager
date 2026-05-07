<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Register - Smart Task Manager</title>
    <link rel="stylesheet" href="css/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
</head>
<body style="display: block;">
    <div class="auth-container">
        <div class="glass-panel">
            <h2 style="text-align: center; color: var(--accent); margin-bottom: 1.5rem;">Create Account</h2>
            <form action="register" method="post">
                <label>Username</label>
                <input type="text" name="username" required placeholder="Pick a username">
                <label>Email</label>
                <input type="email" name="email" required placeholder="Enter email">
                <label>Password</label>
                <input type="password" name="password" required placeholder="Choose a password">
                <button type="submit" style="width: 100%;">Register</button>
            </form>
            <p style="margin-top: 1rem; text-align: center; font-size: 0.9rem;">
                Already have an account? <a href="index.jsp" style="color: var(--accent);">Login here</a>
            </p>
            <% if (request.getAttribute("error") != null) { %>
                <p style="color: var(--danger); text-align: center; margin-top: 1rem;"><%= request.getAttribute("error") %></p>
            <% } %>
        </div>
    </div>
</body>
</html>
