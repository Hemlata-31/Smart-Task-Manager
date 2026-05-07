# Smart Task Manager 

A modern, full-featured web application built with Java Servlets, JSP, JDBC, and MySQL. This project follows the MVC (Model-View-Controller) architecture and features a premium, glassmorphism-inspired UI.

## Features 
- **User Authentication**: Secure Registration and Login system.
- **Task Management**: Full CRUD operations (Create, Read, Update, Delete) for tasks.
- **Task Status & Priority**: Organize tasks by Priority (Low, Medium, High) and Status (Pending, In Progress, Completed).
- **Interactive Dashboard**: Real-time statistics of your tasks and upcoming reminders.
- **Reminder System**: Set time-based reminders for important events.
- **Pomodoro Timer**: Integrated productivity timer to keep you focused.
- **Responsive Design**: Modern dark-mode interface that looks great on all screens.

## Technology Stack 
- **Backend**: Java Servlets, JDBC
- **Frontend**: JSP, CSS, JavaScript
- **Database**: MySQL 8.0+
- **Server**: Apache Tomcat 10.1+

## Getting Started 

### Prerequisites
1.  **JDK 17 or higher** installed.
2.  **Apache Tomcat 10.1+** installed.
3.  **MySQL Server** installed and running.
4.  **MySQL Connector/J** (included in `web/WEB-INF/lib`).

### Database Setup
1.  Open MySQL Workbench or any MySQL client.
2.  Import and execute the `schema.sql` file located in the root directory.
3.  Ensure the database `task_manager` is created.

### Project Configuration
1.  Open `src/com/taskmanager/util/DBConnection.java`.
2.  Update the `USER` and `PASSWORD` constants to match your MySQL credentials.
3.  If you use a different port than `3306`, update the `URL` string.

### How to Run
1.  Open the project in **IntelliJ IDEA** or **Eclipse**.
2.  Add the **Smart Tomcat** plugin (for IntelliJ).
3.  Create a Run Configuration for Tomcat and point the **Deployment directory** to the `web` folder.
4.  Build the project and click **Run**.
5.  Access the app at `http://localhost:8080/SmartTaskManager/` (or your configured context path).

## Project Structure 
- `src/`: Java source files (Servlets, DAOs, Models, Utilities).
- `web/`: Frontend resources (JSP files, CSS, JavaScript, Images).
- `web/WEB-INF/lib/`: External JAR dependencies.
- `schema.sql`: Database schema definition.

