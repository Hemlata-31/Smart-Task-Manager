package com.taskmanager.dao;

import com.taskmanager.model.Reminder;
import com.taskmanager.util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ReminderDAO {
    public boolean addReminder(Reminder reminder) {
        String sql = "INSERT INTO reminders (user_id, message, reminder_time) VALUES (?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, reminder.getUserId());
            ps.setString(2, reminder.getMessage());
            ps.setTimestamp(3, reminder.getReminderTime());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<Reminder> getRemindersByUserId(int userId) {
        List<Reminder> reminders = new ArrayList<>();
        String sql = "SELECT * FROM reminders WHERE user_id = ? ORDER BY reminder_time ASC";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                reminders.add(new Reminder(
                    rs.getInt("id"),
                    rs.getInt("user_id"),
                    rs.getString("message"),
                    rs.getTimestamp("reminder_time"),
                    rs.getBoolean("is_completed")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return reminders;
    }

    public boolean markAsCompleted(int id, int userId) {
        String sql = "UPDATE reminders SET is_completed = TRUE WHERE id = ? AND user_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.setInt(2, userId);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
