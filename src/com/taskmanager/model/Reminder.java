package com.taskmanager.model;

import java.sql.Timestamp;

public class Reminder {
    private int id;
    private int userId;
    private String message;
    private Timestamp reminderTime;
    private boolean isCompleted;

    public Reminder() {}

    public Reminder(int id, int userId, String message, Timestamp reminderTime, boolean isCompleted) {
        this.id = id;
        this.userId = userId;
        this.message = message;
        this.reminderTime = reminderTime;
        this.isCompleted = isCompleted;
    }

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }
    public String getMessage() { return message; }
    public void setMessage(String message) { this.message = message; }
    public Timestamp getReminderTime() { return reminderTime; }
    public void setReminderTime(Timestamp reminderTime) { this.reminderTime = reminderTime; }
    public boolean isCompleted() { return isCompleted; }
    public void setCompleted(boolean completed) { isCompleted = completed; }
}
