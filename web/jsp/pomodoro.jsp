<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Pomodoro - Smart Task Manager</title>
    <link rel="stylesheet" href="../css/style.css">
</head>
<body>
    <div class="sidebar">
        <h2>TaskMaster</h2>
        <a href="../dashboard">Dashboard</a>
        <a href="../tasks">Tasks</a>
        <a href="../reminders">Reminders</a>
        <a href="pomodoro.jsp" class="active">Pomodoro</a>
        <div style="margin-top: auto;">
            <a href="../logout" style="color: var(--danger);">Logout</a>
        </div>
    </div>

    <div class="main-content">
        <h1>Pomodoro Timer</h1>
        <p style="color: var(--text-muted);">Stay focused and boost your productivity.</p>

        <div class="glass-panel" style="margin-top: 2rem; text-align: center; max-width: 600px; margin-left: auto; margin-right: auto;">
            <h2 id="mode-text">Work Mode (25m)</h2>
            <div id="timer-display" class="timer-display">25:00</div>
            
            <div style="display: flex; justify-content: center; gap: 1rem;">
                <button onclick="startTimer()">Start</button>
                <button onclick="pauseTimer()" style="background: var(--secondary-bg);">Pause</button>
                <button onclick="resetTimer()" style="background: var(--danger);">Reset</button>
            </div>
            
            <button onclick="toggleMode()" style="margin-top: 1.5rem; background: transparent; border: 1px solid var(--accent); color: var(--accent);">Switch Mode</button>
        </div>
    </div>

    <script src="../js/pomodoro.js"></script>
</body>
</html>
