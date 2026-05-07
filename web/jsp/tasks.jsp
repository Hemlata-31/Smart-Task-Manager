<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.taskmanager.model.Task, java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <title>Tasks - Smart Task Manager</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <jsp:include page="sidebar.jsp" />

    <div class="main-content">
        <h1>Task Management</h1>
        
        <div class="glass-panel" style="margin-top: 1rem; margin-bottom: 2rem;">
            <h3>Add New Task</h3>
            <form action="tasks?action=add" method="post" style="display: grid; grid-template-columns: 1fr 1fr; gap: 1rem; margin-top: 1rem;">
                <input type="text" name="title" placeholder="Task Title" required>
                <input type="date" name="dueDate" required>
                <select name="priority">
                    <option value="Low">Low</option>
                    <option value="Medium">Medium</option>
                    <option value="High">High</option>
                </select>
                <select name="status">
                    <option value="Pending">Pending</option>
                    <option value="In Progress">In Progress</option>
                    <option value="Completed">Completed</option>
                </select>
                <textarea name="description" placeholder="Description" style="grid-column: span 2;"></textarea>
                <button type="submit" style="grid-column: span 2;">Add Task</button>
            </form>
        </div>

        <div class="glass-panel">
            <h3>Your Tasks</h3>
            <table>
                <thead>
                    <tr>
                        <th>Title</th>
                        <th>Due Date</th>
                        <th>Priority</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                        List<Task> tasks = (List<Task>) request.getAttribute("tasks");
                        if (tasks != null) {
                            for (Task t : tasks) {
                    %>
                        <tr>
                            <td><%= t.getTitle() %></td>
                            <td><%= t.getDueDate() %></td>
                            <td><span class="badge badge-<%= t.getPriority().toLowerCase() %>"><%= t.getPriority() %></span></td>
                            <td><%= t.getStatus() %></td>
                            <td>
                                <button onclick="editTask('<%= t.getId() %>', '<%= t.getTitle() %>', '<%= t.getDueDate() %>', '<%= t.getPriority() %>', '<%= t.getStatus() %>', `<%= t.getDescription() != null ? t.getDescription() : "" %>`)" style="padding: 0.25rem 0.5rem; background: var(--secondary-bg); font-size: 0.8rem;">Edit</button>
                                <a href="tasks?action=delete&id=<%= t.getId() %>" style="color: var(--danger); text-decoration: none; margin-left: 0.5rem; font-size: 0.8rem;" onclick="return confirm('Delete this task?')">Delete</a>
                            </td>
                        </tr>
                    <%      }
                        }
                    %>
                </tbody>
            </table>
        </div>
    </div>

    <script>
        function editTask(id, title, dueDate, priority, status, description) {
            const form = document.querySelector('form');
            form.action = 'tasks?action=update&id=' + id;
            
            // Fix: Target the heading correctly
            const heading = document.querySelector('.glass-panel h3');
            if (heading) heading.textContent = 'Update Task';
            
            form.querySelector('input[name="title"]').value = title;
            form.querySelector('input[name="dueDate"]').value = dueDate;
            form.querySelector('select[name="priority"]').value = priority;
            form.querySelector('select[name="status"]').value = status;
            form.querySelector('textarea[name="description"]').value = description;
            
            form.querySelector('button[type="submit"]').textContent = 'Update Task';
            window.scrollTo({ top: 0, behavior: 'smooth' });
        }
    </script>
</body>
</html>
